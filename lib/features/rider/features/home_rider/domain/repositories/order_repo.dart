// order_status.dart
// Order Status Enum
import 'package:flutter/material.dart';

enum OrderStatus {
  pendingApproval('قيد الموافقة', Icons.access_time, Color(0xFFFFA000)),
  preparing('قيد التجهيز', Icons.restaurant, Color(0xFF2196F3)),
  delivering('قيد التوصيل', Icons.delivery_dining, Color(0xFF4CAF50)),
  delivered('تم التوصيل', Icons.check_circle, Color(0xFF4CAF50)),
  cancelled('ملغي', Icons.cancel, Color(0xFFF44336));

  final String arabicText;
  final IconData icon;
  final Color color;

  const OrderStatus(this.arabicText, this.icon, this.color);
}

// payment_status.dart
enum PaymentStatus {
  notCollected('لم يتم التحصيل بعد', Icons.payment, Color(0xFFFFA000)),
  partiallyPaid('مدفوع جزئياً', Icons.attach_money, Color(0xFF2196F3)),
  fullyPaid('مدفوع بالكامل', Icons.check_circle, Color(0xFF4CAF50)),
  refunded('تم الاسترجاع', Icons.refresh, Color(0xFF9E9E9E));

  final String arabicText;
  final IconData icon;
  final Color color;

  const PaymentStatus(this.arabicText, this.icon, this.color);
}

// payment_method.dart
enum PaymentMethod {
  cash, // نقدي
  creditCard, // بطاقة ائتمان
  wallet, // محفظة إلكترونية
  bankTransfer, // تحويل بنكي
}

// order_item.dart
class OrderItem {
  final String id;
  final String name;
  final String? imageUrl;
  final double price;
  final int quantity;
  final String? notes;

  OrderItem({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
    this.imageUrl,
    this.notes,
  });

  double get totalPrice => price * quantity;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'price': price,
      'quantity': quantity,
      'notes': notes,
    };
  }

  factory OrderItem.fromMap(Map<String, dynamic> map) {
    return OrderItem(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      imageUrl: map['imageUrl'],
      price: map['price']?.toDouble() ?? 0.0,
      quantity: map['quantity']?.toInt() ?? 0,
      notes: map['notes'],
    );
  }
}

// address.dart
class Address {
  final String city; // المدينة (بغداد)
  final String district; // المنطقة (المنصور)
  final String street; // الشارع (شارع 14 رمضان)
  final String details; // التفاصيل (مجاور مطعم...)
  final String? buildingNumber;
  final String? apartmentNumber;
  final double? latitude;
  final double? longitude;

  Address({
    required this.city,
    required this.district,
    required this.street,
    required this.details,
    this.buildingNumber,
    this.apartmentNumber,
    this.latitude,
    this.longitude,
  });

  String get fullAddress {
    return '$city - $district، $street، $details';
  }

  Map<String, dynamic> toMap() {
    return {
      'city': city,
      'district': district,
      'street': street,
      'details': details,
      'buildingNumber': buildingNumber,
      'apartmentNumber': apartmentNumber,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      city: map['city'] ?? '',
      district: map['district'] ?? '',
      street: map['street'] ?? '',
      details: map['details'] ?? '',
      buildingNumber: map['buildingNumber'],
      apartmentNumber: map['apartmentNumber'],
      latitude: map['latitude']?.toDouble(),
      longitude: map['longitude']?.toDouble(),
    );
  }
}

// restaurant.dart
class Restaurant {
  final String id;
  final String name; // اسم المطعم
  final String? imageUrl;
  final String phoneNumber;
  final Address address;
  final double rating;
  final int ratingCount;
  final bool isOpen;

  Restaurant({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.address,
    this.imageUrl,
    this.rating = 0.0,
    this.ratingCount = 0,
    this.isOpen = true,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'phoneNumber': phoneNumber,
      'address': address.toMap(),
      'rating': rating,
      'ratingCount': ratingCount,
      'isOpen': isOpen,
    };
  }

  factory Restaurant.fromMap(Map<String, dynamic> map) {
    return Restaurant(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      imageUrl: map['imageUrl'],
      phoneNumber: map['phoneNumber'] ?? '',
      address: Address.fromMap(Map<String, dynamic>.from(map['address'] ?? {})),
      rating: map['rating']?.toDouble() ?? 0.0,
      ratingCount: map['ratingCount']?.toInt() ?? 0,
      isOpen: map['isOpen'] ?? true,
    );
  }
}

// order.dart
class RiderOrder {
  final String id;
  final String orderNumber; // رقم الطلبة
  final Restaurant restaurant;
  final List<OrderItem> items;
  final OrderStatus status; // حالة الطلبة
  final PaymentStatus paymentStatus; // حالة الدفع
  final PaymentMethod? paymentMethod;
  final Address deliveryAddress;
  final DateTime orderDate;
  final DateTime? estimatedDeliveryTime;
  final double deliveryFee;
  final double taxAmount;
  final String? customerNotes;
  final String? rejectionReason;
  final DateTime? acceptedAt;
  final DateTime? deliveredAt;

  RiderOrder({
    required this.id,
    required this.orderNumber,
    required this.restaurant,
    required this.items,
    required this.status,
    required this.paymentStatus,
    required this.deliveryAddress,
    required this.orderDate,
    this.paymentMethod,
    this.estimatedDeliveryTime,
    this.deliveryFee = 0.0,
    this.taxAmount = 0.0,
    this.customerNotes,
    this.rejectionReason,
    this.acceptedAt,
    this.deliveredAt,
  });

  // إجمالي الطلبة
  double get itemsTotal {
    return items.fold(0.0, (sum, item) => sum + item.totalPrice);
  }

  // الإجمالي النهائي
  double get totalAmount {
    return itemsTotal + deliveryFee + taxAmount;
  }

  // الوقت المتبقي للتوصيل
  Duration? get remainingDeliveryTime {
    if (estimatedDeliveryTime == null) return null;
    return estimatedDeliveryTime!.difference(DateTime.now());
  }

  // هل يمكن قبول الطلبة؟
  bool get canAcceptOrder {
    return status == OrderStatus.pendingApproval;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'orderNumber': orderNumber,
      'restaurant': restaurant.toMap(),
      'items': items.map((item) => item.toMap()).toList(),
      'status': status.index,
      'paymentStatus': paymentStatus.index,
      'paymentMethod': paymentMethod?.index,
      'deliveryAddress': deliveryAddress.toMap(),
      'orderDate': orderDate.toIso8601String(),
      'estimatedDeliveryTime': estimatedDeliveryTime?.toIso8601String(),
      'deliveryFee': deliveryFee,
      'taxAmount': taxAmount,
      'customerNotes': customerNotes,
      'rejectionReason': rejectionReason,
      'acceptedAt': acceptedAt?.toIso8601String(),
      'deliveredAt': deliveredAt?.toIso8601String(),
    };
  }

  factory RiderOrder.fromMap(Map<String, dynamic> map) {
    return RiderOrder(
      id: map['id'] ?? '',
      orderNumber: map['orderNumber'] ?? '',
      restaurant: Restaurant.fromMap(
        Map<String, dynamic>.from(map['restaurant'] ?? {}),
      ),
      items: List<OrderItem>.from(
        (map['items'] ?? []).map((item) => OrderItem.fromMap(item)),
      ),
      status: OrderStatus.values[map['status'] ?? 0],
      paymentStatus: PaymentStatus.values[map['paymentStatus'] ?? 0],
      paymentMethod: map['paymentMethod'] != null
          ? PaymentMethod.values[map['paymentMethod']]
          : null,
      deliveryAddress: Address.fromMap(
        Map<String, dynamic>.from(map['deliveryAddress'] ?? {}),
      ),
      orderDate: DateTime.parse(
        map['orderDate'] ?? DateTime.now().toIso8601String(),
      ),
      estimatedDeliveryTime: map['estimatedDeliveryTime'] != null
          ? DateTime.parse(map['estimatedDeliveryTime'])
          : null,
      deliveryFee: map['deliveryFee']?.toDouble() ?? 0.0,
      taxAmount: map['taxAmount']?.toDouble() ?? 0.0,
      customerNotes: map['customerNotes'],
      rejectionReason: map['rejectionReason'],
      acceptedAt: map['acceptedAt'] != null
          ? DateTime.parse(map['acceptedAt'])
          : null,
      deliveredAt: map['deliveredAt'] != null
          ? DateTime.parse(map['deliveredAt'])
          : null,
    );
  }

  // Method to accept order
  RiderOrder acceptOrder() {
    if (!canAcceptOrder) {
      throw Exception('Cannot accept order in current status');
    }

    return RiderOrder(
      id: id,
      orderNumber: orderNumber,
      restaurant: restaurant,
      items: items,
      status: OrderStatus.preparing,
      paymentStatus: paymentStatus,
      paymentMethod: paymentMethod,
      deliveryAddress: deliveryAddress,
      orderDate: orderDate,
      estimatedDeliveryTime: estimatedDeliveryTime,
      deliveryFee: deliveryFee,
      taxAmount: taxAmount,
      customerNotes: customerNotes,
      rejectionReason: rejectionReason,
      acceptedAt: DateTime.now(),
      deliveredAt: deliveredAt,
    );
  }

  // Method to reject order
  RiderOrder rejectOrder(String reason) {
    if (!canAcceptOrder) {
      throw Exception('Cannot reject order in current status');
    }

    return RiderOrder(
      id: id,
      orderNumber: orderNumber,
      restaurant: restaurant,
      items: items,
      status: OrderStatus.cancelled,
      paymentStatus: paymentStatus,
      paymentMethod: paymentMethod,
      deliveryAddress: deliveryAddress,
      orderDate: orderDate,
      estimatedDeliveryTime: estimatedDeliveryTime,
      deliveryFee: deliveryFee,
      taxAmount: taxAmount,
      customerNotes: customerNotes,
      rejectionReason: reason,
      acceptedAt: acceptedAt,
      deliveredAt: deliveredAt,
    );
  }
}
