import 'package:masarat_alnahdha/core/const/app_const.dart';
import 'package:masarat_alnahdha/features/orders/presentation/widgets/finished_order_item.dart';
import 'package:masarat_alnahdha/features/orders/presentation/widgets/orders_page_item.dart';
import 'package:flutter/material.dart';

class TapView extends StatelessWidget {
  const TapView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar(
            labelColor: Theme.of(context).colorScheme.surface,
            indicatorColor: Theme.of(context).colorScheme.surface,
            tabs: const [
              FittedBox(fit: BoxFit.scaleDown, child: Text("الطلبات الفعالة")),
              FittedBox(fit: BoxFit.scaleDown, child: Text("الطلبات المنتهية")),
              FittedBox(fit: BoxFit.scaleDown, child: Text("الطلبات الملغية")),
            ],
          ),
          Expanded(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  itemCount: newProductsList.length,
                  itemBuilder: (context, index) {
                    return OrdersPageItem(productModel: newProductsList[index]);
                  },
                ),
                ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  itemCount: newProductsList.length,
                  itemBuilder: (context, index) {
                    return FinishedOrderItem(
                      productModel: newProductsList[index],
                    );
                  },
                ),
                ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  itemCount: newProductsList.length,
                  itemBuilder: (context, index) {
                    return FinishedOrderItem(
                      productModel: newProductsList[index],
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
