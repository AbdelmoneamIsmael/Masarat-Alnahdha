import 'package:masarat_alnahdha/features/categories_info/domain/entities/food_entity.dart';
import 'package:bloc/bloc.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:equatable/equatable.dart';
import 'package:masarat_alnahdha/gen/assets.gen.dart';

part 'categories_info_state.dart';

class CategoriesInfoCubit extends Cubit<CategoriesInfoState> {
  CategoriesInfoCubit() : super(CategoriesInfoInitial()) {
    currentImage = "assets/images/login.jpg";
  }
  onSwiperChange(int index) {
    swiperController.move(index);
    currentImage = "assets/images/login.jpg";
    emit(ChooseImageState(currentImage));
  }

  String currentImage = '';
  @override
  Future<void> close() {
    swiperController.dispose();
    return super.close();
  }

  SwiperController swiperController = SwiperController();
  final List<FoodEntity> FoodEntitys = [
    FoodEntity(
      dishImage:
          "https://media.istockphoto.com/id/503337620/photo/grilled-halibut-with-spinach-leeks-and-pine-nuts.jpg?s=612x612&w=0&k=20&c=bcrySCiUxAEhyRm8Hd5W9wLvnivMUA7o2xkM-i_lpT8=",
      title: 'التنمية',
      rating: 4.8,
      description: "منتج التنمية عالي الجودة، مناسب للاستخدامات اليومية.",
      hours: 0,
      minutes: 30,
      seconds: 0,
      smallImage: "assets/masarat/التنمية/Capture.PNG",
      fullImage: Assets.exproducts.img20250922Wa0034.path,
    ),
    FoodEntity(
      dishImage:
          "https://images.pexels.com/photos/2641886/pexels-photo-2641886.jpeg?cs=srgb&dl=pexels-willpicturethis-2641886.jpg&fm=jpg",
      title: 'الصدور',
      rating: 5.0,
      description: "صدور دجاج طازجة ومغذية، مثالية للوجبات الصحية.",
      hours: 0,
      minutes: 25,
      seconds: 0,
      smallImage:
          "assets/masarat/الصدور/4868979d-ff91-4e74-92ae-0e265851ca85.png",
      fullImage: Assets.exproducts.img20250922Wa0030.path,
    ),
    FoodEntity(
      dishImage:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJBO44lq1x67748QvsVHDB4ibfcC4kIFy2Pu5mqnMopuiBPoU3kfaJ1nhfpfh0MluDskQ&usqp=CAU",
      title: "الوطنية",
      rating: 4.9,
      description: "دجاج الوطنية 1100 جرام بجودة مميزة وطعم شهي.",
      hours: 1,
      minutes: 15,
      seconds: 0,
      smallImage: "assets/masarat/الوطنية/دجاج وطنية 1100.png",
      fullImage: Assets.exproducts.img20250922Wa0020.path,
    ),
    FoodEntity(
      dishImage:
          "https://previews.123rf.com/images/wolfmaster13/wolfmaster131401/wolfmaster13140100002/24811437-fish-steak-with-salad-dipping-sauce-and-garlic-bread.jpg",
      title: 'خضراوات',
      rating: 4.7,
      description: "خضراوات طازجة متنوعة، جاهزة للطهي السريع.",
      hours: 0,
      minutes: 40,
      seconds: 0,
      smallImage:
          "assets/masarat/خضراوات/5.1.1.1-Seara-French-Fries-1-KG-Front.png",
      fullImage: Assets.exproducts.img20250922Wa0043.path,
    ),
    FoodEntity(
      dishImage:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8Xc2fJdydKaslPL78_HL-8XcrQsycXcxx3xXVF4vb-rnLtB1ShJDNng1zz3K4jmxerBU&usqp=CAU",
      title: 'دجاج دوكس',
      rating: 4.6,
      description: "دجاج دوكس طازج، مثالي للوصفات المميزة.",
      hours: 0,
      minutes: 20,
      seconds: 0,
      smallImage: "assets/masarat/دجاج دوكس/01J18KYDC3PJHJGM3ECNYKMWW5.png",
      fullImage: Assets.exproducts.img20250922Wa0015.path,
    ),
    FoodEntity(
      dishImage:
          "https://img.freepik.com/foto-gratis/comida-filete-salmon-plato-frito_1203-4698.jpg?semt=ais_hybrid&w=740&q=80",
      title: "دجاج ساديا",
      rating: 4.9,
      description: "منتجات دجاج ساديا بجودة عالية.",
      hours: 1,
      minutes: 0,
      seconds: 0,
      smallImage: "assets/masarat/دجاج ساديا/71BObOm+8qL._AC_SL1500_.png",
      fullImage: Assets.exproducts.img20250922Wa0002.path,
    ),
  ];

  // List<ProductModel> newProductsList = [
  //   ProductModel(
  //     availableQuantity: 26,
  //     price: 48000,
  //     discount: '20%',
  //     priceAfterDiscount: 38400,
  //     productId: 99,
  //     name: 'التنمية',
  //     description: "منتج التنمية عالي الجودة، مناسب للاستخدامات اليومية.",
  //     imageUrl: "assets/masarat/التنمية/Capture.PNG",
  //   ),
  //   ProductModel(
  //     availableQuantity: 12,
  //     price: 6000,
  //     productId: 98,
  //     name: 'الصدور',
  //     description: "صدور دجاج طازجة ومغذية، مثالية للوجبات الصحية.",
  //     imageUrl:
  //         "assets/masarat/الصدور/4868979d-ff91-4e74-92ae-0e265851ca85.png",
  //   ),
  //   ProductModel(
  //     availableQuantity: 35,
  //     price: 15000,
  //     productId: 97,
  //     name: "الوطنية",
  //     description: "دجاج الوطنية 1100 جرام بجودة مميزة وطعم شهي.",
  //     imageUrl: "assets/masarat/الوطنية/دجاج وطنية 1100.png",
  //   ),
  //   ProductModel(
  //     availableQuantity: 50,
  //     price: 5000,
  //     productId: 96,
  //     name: 'خضراوات',
  //     description: "خضراوات طازجة متنوعة، جاهزة للطهي السريع.",
  //     imageUrl:
  //         "assets/masarat/خضراوات/5.1.1.1-Seara-French-Fries-1-KG-Front.png",
  //   ),
  //   ProductModel(
  //     availableQuantity: 18,
  //     price: 11000,
  //     discount: '10%',
  //     priceAfterDiscount: 9900,
  //     productId: 95,
  //     name: 'دجاج دوكس',
  //     description: "دجاج دوكس طازج، مثالي للوصفات المميزة.",
  //     imageUrl: "assets/masarat/دجاج دوكس/01J18KYDC3PJHJGM3ECNYKMWW5.png",
  //   ),
  //   ProductModel(
  //     availableQuantity: 28,
  //     price: 14000,
  //     productId: 94,
  //     name: "دجاج ساديا",
  //     description: "منتجات دجاج ساديا بجودة عالية.",
  //     imageUrl: "assets/masarat/دجاج ساديا/71BObOm+8qL._AC_SL1500_.png",
  //   ),
  //   ProductModel(
  //     availableQuantity: 22,
  //     price: 20000,
  //     discount: '15%',
  //     priceAfterDiscount: 17000,
  //     productId: 93,
  //     name: 'دجاج فقيه',
  //     description: "دجاج فقيه طازج ومغذي، مثالي للعائلات.",
  //     imageUrl: "assets/masarat/دجاج فقيه/دجاج فقيه 1100.png",
  //   ),
  // ];
}
