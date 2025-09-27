import 'package:masarat_alnahdha/core/models/product/product_model.dart';
// import 'package:masarat_alnahdha/gen/assets.gen.dart';

const kRefreshToken = "refreshToken";
// const prodBaseURl = "";
const prodBaseURl = "";

String kDeviceToken = "";
// String kInitialRoute = PagesKeys.internalPlaceDetailsScreen;
// String kInitialRoute = PageKeys.loginScreen;
// String token = "";
const kFontFamily = "Tajawal";
const kAppName = "Masarat Alnahdha";

const internalLocalError = 700; // englishFont = "Poppins";

//------------------------------------------------------------------------
// List<ProductModel> newProductsList = [
//   ProductModel(
//     availableQuantity: 26,
//     price: 50000,
//     discount: '25%',
//     priceAfterDiscount: 37500,
//     productId: 99,
//     name: 'بتنجان المسارات النهضة',
//     description:
//         "بتنجان طازج عالي الجودة من مزارع المسارات النهضة، مثالي للطهي والقلي ويتميز بمذاقه اللذيذ.",
//     imageUrl: Assets.exProductsNoBg.btngan.path,
//   ),
//   ProductModel(
//     availableQuantity: 10,
//     price: 4000,
//     productId: 98,
//     name: 'مشكل المسارات النهضة',
//     description:
//         "تشكيلة خضروات طازجة متنوعة من مزارع المسارات النهضة، جاهزة للأكلات الصحية والمميزة.",
//     imageUrl: Assets.exProductsNoBg.mshkl.path,
//   ),
//   ProductModel(
//     availableQuantity: 40,
//     price: 5000,
//     productId: 97,
//     name: "قاس المسارات النهضة",
//     description:
//         "قاس طازج من أجود المحاصيل، غني بالقيمة الغذائية ومناسب لجميع الأطباق الشرقية.",
//     imageUrl: Assets.exProductsNoBg.qas.path,
//   ),
//   ProductModel(
//     availableQuantity: 26,
//     price: 50000,
//     discount: '25%',
//     priceAfterDiscount: 37500,
//     productId: 96,
//     name: 'بتنجان المسارات النهضة الكبير',
//     description: "بتنجان حجم كبير وطازج، مثالي للمحاشي والوصفات التقليدية.",
//     imageUrl: Assets.exProductsNoBg.btngan.path,
//   ),
//   ProductModel(
//     availableQuantity: 10,
//     price: 4000,
//     productId: 95,
//     name: 'مشكل المسارات النهضة الصغير',
//     description:
//         "خليط صغير الحجم من خضروات طازجة متنوعة، مناسب للوجبات اليومية السريعة.",
//     imageUrl: Assets.exProductsNoBg.mshkl.path,
//   ),
//   ProductModel(
//     availableQuantity: 40,
//     price: 5000,
//     productId: 94,
//     name: "قاس بلدي",
//     description: "قاس بلدي طازج غني بالطعم الأصيل، مثالي للسلطات والطواجن.",
//     imageUrl: Assets.exProductsNoBg.qas.path,
//   ),
//   ProductModel(
//     availableQuantity: 26,
//     price: 50000,
//     discount: '15%',
//     priceAfterDiscount: 42500,
//     productId: 93,
//     name: 'بتنجان محشي المسارات النهضة',
//     description:
//         "بتنجان خاص بالوصفات المحشية، سهل التفريغ ومثالي للمطبخ الشرقي.",
//     imageUrl: Assets.exProductsNoBg.btngan.path,
//   ),
//   ProductModel(
//     availableQuantity: 10,
//     price: 4000,
//     productId: 92,
//     name: 'مشكل موسمي',
//     description: "تشكيلة موسمية من أجود أنواع الخضروات الطازجة، مختارة بعناية.",
//     imageUrl: Assets.exProductsNoBg.mshkl.path,
//   ),
//   ProductModel(
//     availableQuantity: 40,
//     price: 5000,
//     productId: 91,
//     name: "قاس مميز",
//     description: "قاس طازج بنكهة مميزة، مثالي للشوربات والمقبلات.",
//     imageUrl: Assets.exProductsNoBg.qas.path,
//   ),
// ];

List<ProductModel> newProductsList = [
  ProductModel(
    availableQuantity: 26,
    price: 48000,
    discount: '20%',
    priceAfterDiscount: 38400,
    productId: 99,
    name: 'التنمية',
    description: "منتج التنمية عالي الجودة، مناسب للاستخدامات اليومية.",
    imageUrl: "assets/masarat/التنمية/Capture.PNG",
  ),
  ProductModel(
    availableQuantity: 12,
    price: 6000,
    productId: 98,
    name: 'الصدور',
    description: "صدور دجاج طازجة ومغذية، مثالية للوجبات الصحية.",
    imageUrl: "assets/masarat/الصدور/4868979d-ff91-4e74-92ae-0e265851ca85.png",
  ),
  ProductModel(
    availableQuantity: 35,
    price: 15000,
    productId: 97,
    name: "الوطنية",
    description: "دجاج الوطنية 1100 جرام بجودة مميزة وطعم شهي.",
    imageUrl: "assets/masarat/الوطنية/دجاج وطنية 1100.png",
  ),
  ProductModel(
    availableQuantity: 50,
    price: 5000,
    productId: 96,
    name: 'خضراوات',
    description: "خضراوات طازجة متنوعة، جاهزة للطهي السريع.",
    imageUrl:
        "assets/masarat/خضراوات/5.1.1.1-Seara-French-Fries-1-KG-Front.png",
  ),
  ProductModel(
    availableQuantity: 18,
    price: 11000,
    discount: '10%',
    priceAfterDiscount: 9900,
    productId: 95,
    name: 'دجاج دوكس',
    description: "دجاج دوكس طازج، مثالي للوصفات المميزة.",
    imageUrl: "assets/masarat/دجاج دوكس/01J18KYDC3PJHJGM3ECNYKMWW5.png",
  ),
  ProductModel(
    availableQuantity: 28,
    price: 14000,
    productId: 94,
    name: "دجاج ساديا",
    description: "منتجات دجاج ساديا بجودة عالية.",
    imageUrl: "assets/masarat/دجاج ساديا/71BObOm+8qL._AC_SL1500_.png",
  ),
  ProductModel(
    availableQuantity: 22,
    price: 20000,
    discount: '15%',
    priceAfterDiscount: 17000,
    productId: 93,
    name: 'دجاج فقيه',
    description: "دجاج فقيه طازج ومغذي، مثالي للعائلات.",
    imageUrl: "assets/masarat/دجاج فقيه/دجاج فقيه 1100.png",
  ),
  ProductModel(
    availableQuantity: 14,
    price: 9000,
    productId: 92,
    name: 'رضوى',
    description: "دجاج رضوى طازج بعناية فائقة.",
    imageUrl:
        "assets/masarat/رضوى/00d77a32-3ef4-4f21-84f2-3f957bdbf262-775.png",
  ),
  ProductModel(
    availableQuantity: 40,
    price: 7000,
    productId: 91,
    name: "زيوت",
    description: "زيوت طازجة وصحية لمختلف الاستخدامات.",
    imageUrl: "assets/masarat/زيوت/202309061734_23006-preview.png",
  ),
  ProductModel(
    availableQuantity: 30,
    price: 12000,
    productId: 90,
    name: "شاورما الدجاج",
    description: "شاورما دجاج جاهزة للطهي، بنكهة رائعة.",
    imageUrl:
        "assets/masarat/شاورما الدجاج/690f8788-c0b8-4957-b1da-44c6607475de.png",
  ),
  ProductModel(
    availableQuantity: 9,
    price: 8000,
    discount: '5%',
    priceAfterDiscount: 7600,
    productId: 89,
    name: "كبده",
    description: "كبده دجاج طازجة مليئة بالقيمة الغذائية.",
    imageUrl: "assets/masarat/كبده/ac3a77c7-9e5c-443a-bc2c-82b05389ff43.png",
  ),
  ProductModel(
    availableQuantity: 17,
    price: 16000,
    productId: 88,
    name: "كواليكوا",
    description: "منتجات كواليكوا عالية الجودة.",
    imageUrl: "assets/masarat/كواليكوا/1_3.png",
  ),
  ProductModel(
    availableQuantity: 24,
    price: 30000,
    productId: 87,
    name: "لحوم",
    description: "لحوم طازجة بعناية فائقة.",
    imageUrl:
        "assets/masarat/لحوم/68806866_499677107257416_7817361290749280256_n.png",
  ),
  ProductModel(
    availableQuantity: 11,
    price: 10000,
    productId: 86,
    name: "مفروم الدجاج",
    description: "مفروم دجاج جاهز للطهي مباشرة.",
    imageUrl:
        "assets/masarat/مفروم الدجاج/5a6bcd8d-0933-4dd8-86e0-d7b5c661ed7b-500x500-Yf3dDQjr0uBlgaPlEQgKBY8P8aMp7jYx2nD4PQPE.png",
  ),
  ProductModel(
    availableQuantity: 38,
    price: 13500,
    productId: 85,
    name: "مقطعات دجاج",
    description: "مقطعات دجاج طازجة مثالية للقلي.",
    imageUrl:
        "assets/masarat/مقطعات دجاج/372d2531-71e8-4166-a9c9-06e6dcbf3b42_size3840_cropCenter.png",
  ),
  ProductModel(
    availableQuantity: 55,
    price: 4500,
    discount: '10%',
    priceAfterDiscount: 4050,
    productId: 84,
    name: "منتجات ورقية وبلاستيكية",
    description: "منتجات ورقية وبلاستيكية متنوعة.",
    imageUrl: "assets/masarat/منتجات ورقية وبلاستيكية/41AL9aImz6L._AC_.png",
  ),
  ProductModel(
    availableQuantity: 20,
    price: 7500,
    productId: 83,
    name: "مواد جافة وسائلة",
    description: "مواد غذائية جافة وسائلة للمطبخ العصري.",
    imageUrl:
        "assets/masarat/مواد جافة وسائلة/4bdd0c53-2b2b-4f9a-bb92-432b896f3219.png",
  ),
];
//----all products list
List<ProductModel> productsList = [
  ProductModel(
    availableQuantity: 26,
    price: 48000,
    discount: '20%',
    priceAfterDiscount: 38400,
    productId: 99,
    name: 'التنمية',
    description: "منتج التنمية عالي الجودة، مناسب للاستخدامات اليومية.",
    imageUrl: "assets/masarat/التنمية/Capture.PNG",
  ),
  ProductModel(
    availableQuantity: 12,
    price: 6000,
    productId: 98,
    name: 'الصدور',
    description: "صدور دجاج طازجة ومغذية، مثالية للوجبات الصحية.",
    imageUrl: "assets/masarat/الصدور/4868979d-ff91-4e74-92ae-0e265851ca85.png",
  ),
  ProductModel(
    availableQuantity: 35,
    price: 15000,
    productId: 97,
    name: "الوطنية",
    description: "دجاج الوطنية 1100 جرام بجودة مميزة وطعم شهي.",
    imageUrl: "assets/masarat/الوطنية/دجاج وطنية 1100.png",
  ),
  ProductModel(
    availableQuantity: 50,
    price: 5000,
    productId: 96,
    name: 'خضراوات',
    description: "خضراوات طازجة متنوعة، جاهزة للطهي السريع.",
    imageUrl:
        "assets/masarat/خضراوات/5.1.1.1-Seara-French-Fries-1-KG-Front.png",
  ),
  ProductModel(
    availableQuantity: 18,
    price: 11000,
    discount: '10%',
    priceAfterDiscount: 9900,
    productId: 95,
    name: 'دجاج دوكس',
    description: "دجاج دوكس طازج، مثالي للوصفات المميزة.",
    imageUrl: "assets/masarat/دجاج دوكس/01J18KYDC3PJHJGM8AF7CMXSYA.png",
  ),
  ProductModel(
    availableQuantity: 28,
    price: 14000,
    productId: 94,
    name: "دجاج ساديا",
    description: "منتجات دجاج ساديا بجودة عالية.",
    imageUrl: "assets/masarat/دجاج ساديا/sadia.png",
  ),
  ProductModel(
    availableQuantity: 22,
    price: 20000,
    discount: '15%',
    priceAfterDiscount: 17000,
    productId: 93,
    name: 'دجاج فقيه',
    description: "دجاج فقيه طازج ومغذي، مثالي للعائلات.",
    imageUrl: "assets/masarat/دجاج فقيه/Alfakih-chicken-1100g.png",
  ),
  ProductModel(
    availableQuantity: 14,
    price: 9000,
    productId: 92,
    name: 'رضوى',
    description: "دجاج رضوى طازج بعناية فائقة.",
    imageUrl: "assets/masarat/رضوى/0105410_1.png",
  ),
  ProductModel(
    availableQuantity: 40,
    price: 7000,
    productId: 91,
    name: "زيوت",
    description: "زيوت طازجة وصحية لمختلف الاستخدامات.",
    imageUrl: "assets/masarat/زيوت/ayn.png",
  ),
  ProductModel(
    availableQuantity: 30,
    price: 12000,
    productId: 90,
    name: "شاورما الدجاج",
    description: "شاورما دجاج جاهزة للطهي، بنكهة رائعة.",
    imageUrl:
        "assets/masarat/شاورما الدجاج/Al-Kabeer-Chicken-Shawarma-1kg-1.png",
  ),
  ProductModel(
    availableQuantity: 9,
    price: 8000,
    discount: '5%',
    priceAfterDiscount: 7600,
    productId: 89,
    name: "كبده",
    description: "كبده دجاج طازجة مليئة بالقيمة الغذائية.",
    imageUrl: "assets/masarat/كبده/Al-Kabeer-Frozen-Chicken-Liver-450g-1.png",
  ),
  ProductModel(
    availableQuantity: 17,
    price: 16000,
    productId: 88,
    name: "كواليكوا",
    description: "منتجات كواليكوا عالية الجودة.",
    imageUrl: "assets/masarat/كواليكوا/kwalikwa.png",
  ),
  ProductModel(
    availableQuantity: 24,
    price: 30000,
    productId: 87,
    name: "لحوم",
    description: "لحوم طازجة بعناية فائقة.",
    imageUrl: "assets/masarat/لحوم/Al-Kabeer-Beef-Burger-1kg-1.png",
  ),
  ProductModel(
    availableQuantity: 11,
    price: 10000,
    productId: 86,
    name: "مفروم الدجاج",
    description: "مفروم دجاج جاهز للطهي مباشرة.",
    imageUrl: "assets/masarat/مفروم الدجاج/chicken-mince-al-kabeer-400g.png",
  ),
  ProductModel(
    availableQuantity: 38,
    price: 13500,
    productId: 85,
    name: "مقطعات دجاج",
    description: "مقطعات دجاج طازجة مثالية للقلي.",
    imageUrl: "assets/masarat/مقطعات دجاج/Al-Kabeer-Chicken-Wings-900g.png",
  ),
  ProductModel(
    availableQuantity: 55,
    price: 4500,
    discount: '10%',
    priceAfterDiscount: 4050,
    productId: 84,
    name: "منتجات ورقية وبلاستيكية",
    description: "منتجات ورقية وبلاستيكية متنوعة.",
    imageUrl: "assets/masarat/منتجات ورقية وبلاستيكية/tissue.png",
  ),
  ProductModel(
    availableQuantity: 20,
    price: 7500,
    productId: 83,
    name: "مواد جافة وسائلة",
    description: "مواد غذائية جافة وسائلة للمطبخ العصري.",
    imageUrl: "assets/masarat/مواد جافة وسائلة/Al-Kabeer-Frozen-Okra-400g.png",
  ),
];
