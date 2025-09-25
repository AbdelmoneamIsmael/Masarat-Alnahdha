

import 'package:masarat_alnahdha/core/models/product/product_model.dart';
import 'package:masarat_alnahdha/gen/assets.gen.dart';

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
List<ProductModel> newProductsList = [
  ProductModel(
    availableQuantity: 26,
    price: 50000,
    discount: '25%',
    priceAfterDiscount: 37500,
    productId: 99,
    name: 'بتنجان الرافيل',
    description:
        "بتنجان طازج عالي الجودة من مزارع الرافيل، مثالي للطهي والقلي ويتميز بمذاقه اللذيذ.",
    imageUrl: Assets.exProductsNoBg.btngan.path,
  ),
  ProductModel(
    availableQuantity: 10,
    price: 4000,
    productId: 98,
    name: 'مشكل الرافيل',
    description:
        "تشكيلة خضروات طازجة متنوعة من مزارع الرافيل، جاهزة للأكلات الصحية والمميزة.",
    imageUrl: Assets.exProductsNoBg.mshkl.path,
  ),
  ProductModel(
    availableQuantity: 40,
    price: 5000,
    productId: 97,
    name: "قاس الرافيل",
    description:
        "قاس طازج من أجود المحاصيل، غني بالقيمة الغذائية ومناسب لجميع الأطباق الشرقية.",
    imageUrl: Assets.exProductsNoBg.qas.path,
  ),
  ProductModel(
    availableQuantity: 26,
    price: 50000,
    discount: '25%',
    priceAfterDiscount: 37500,
    productId: 96,
    name: 'بتنجان الرافيل الكبير',
    description: "بتنجان حجم كبير وطازج، مثالي للمحاشي والوصفات التقليدية.",
    imageUrl: Assets.exProductsNoBg.btngan.path,
  ),
  ProductModel(
    availableQuantity: 10,
    price: 4000,
    productId: 95,
    name: 'مشكل الرافيل الصغير',
    description:
        "خليط صغير الحجم من خضروات طازجة متنوعة، مناسب للوجبات اليومية السريعة.",
    imageUrl: Assets.exProductsNoBg.mshkl.path,
  ),
  ProductModel(
    availableQuantity: 40,
    price: 5000,
    productId: 94,
    name: "قاس بلدي",
    description: "قاس بلدي طازج غني بالطعم الأصيل، مثالي للسلطات والطواجن.",
    imageUrl: Assets.exProductsNoBg.qas.path,
  ),
  ProductModel(
    availableQuantity: 26,
    price: 50000,
    discount: '15%',
    priceAfterDiscount: 42500,
    productId: 93,
    name: 'بتنجان محشي الرافيل',
    description:
        "بتنجان خاص بالوصفات المحشية، سهل التفريغ ومثالي للمطبخ الشرقي.",
    imageUrl: Assets.exProductsNoBg.btngan.path,
  ),
  ProductModel(
    availableQuantity: 10,
    price: 4000,
    productId: 92,
    name: 'مشكل موسمي',
    description: "تشكيلة موسمية من أجود أنواع الخضروات الطازجة، مختارة بعناية.",
    imageUrl: Assets.exProductsNoBg.mshkl.path,
  ),
  ProductModel(
    availableQuantity: 40,
    price: 5000,
    productId: 91,
    name: "قاس مميز",
    description: "قاس طازج بنكهة مميزة، مثالي للشوربات والمقبلات.",
    imageUrl: Assets.exProductsNoBg.qas.path,
  ),
];
