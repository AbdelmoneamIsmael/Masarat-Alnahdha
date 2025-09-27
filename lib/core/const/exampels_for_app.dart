import 'package:masarat_alnahdha/core/models/categories/categorie_model.dart';
import 'package:masarat_alnahdha/gen/assets.gen.dart';

List<CategorieModel> categoriesList = [
  CategorieModel(
    id: "1",
    name: 'قسم الدجاج',
    imagefrontsmallurl: Assets.masaratCategories.frozenImge.path,
    hasSubCategories: true,
  ),
  CategorieModel(
    id: "2",
    name: 'قسم الزيوت',
    imagefrontsmallurl: Assets.masaratCategories.oils.path,
  ),
  CategorieModel(
    id: "3",
    name: 'قسم الارز',
    imagefrontsmallurl: Assets.masaratCategories.rise.path,
  ),
  CategorieModel(
    id: "4",
    name: 'قسم اللحوم',
    imagefrontsmallurl: Assets.masaratCategories.meats.path,
  ),
  CategorieModel(
    id: "5",
    name: 'قسم الكبده',
    imagefrontsmallurl: Assets.masaratCategories.kbda.path,
  ),
  CategorieModel(
    id: "6",
    name: 'قسم الموارد الجافه والسائله',
    imagefrontsmallurl: Assets.masaratCategories.mwadSaala.path,
  ),
  CategorieModel(
    id: "7",
    name: 'منتجات الورقية والبال ستيكية',
    imagefrontsmallurl: Assets.masaratCategories.dishesJpeg.path,
  ),
];

List<CategorieModel> subCategoriesList = [
  CategorieModel(
    id: "11",
    name: 'دجاج الفقهة',
    imagefrontsmallurl: Assets.masaratSubcat.faqeh.path,
    hasSubCategories: true,
  ),
  CategorieModel(
    id: "12",
    name: "دجاج الوطنية",
    imagefrontsmallurl: Assets.masaratSubcat.watanya.path,
    hasSubCategories: true,
  ),
  CategorieModel(
    id: "13",
    name: "دجاج ساديا",
    imagefrontsmallurl: Assets.masaratSubcat.sadya.path,
    hasSubCategories: true,
  ),
  CategorieModel(
    id: "14",
    name: "دجاج هالل",
    imagefrontsmallurl: Assets.masaratSubcat.helal.path,
    hasSubCategories: true,
  ),
  CategorieModel(
    id: "15",
    name: "دجاج دوكس",
    imagefrontsmallurl: Assets.masaratSubcat.doux.path,
    hasSubCategories: true,
  ),

  CategorieModel(
    id: "16",
    name: "دجاج تنمية",
    imagefrontsmallurl: Assets.masaratSubcat.altanmya.path,
    hasSubCategories: true,
  ),

  CategorieModel(
    id: "17",
    name: "دجاج رضوى",
    imagefrontsmallurl: Assets.masaratSubcat.radwa.path,
    hasSubCategories: true,
  ),
  CategorieModel(
    id: "18",
    name: "دجاج اكواليكو",
    imagefrontsmallurl: Assets.masaratSubcat.qualiko.path,
    hasSubCategories: true,
  ),
  CategorieModel(
    id: "19",
    name: "دجاج الساحل",
    imagefrontsmallurl: Assets.masaratSubcat.sahel.path,
    hasSubCategories: true,
  ),
  CategorieModel(
    id: "110",
    name: "مقطعات الدجاج",
    imagefrontsmallurl: Assets.masaratSubcat.dgagMoqat3.path,
    hasSubCategories: true,
  ),
  CategorieModel(
    id: "111",
    name: "مفرووم الدجاج",
    imagefrontsmallurl: Assets.masaratSubcat.mfromDgag.path,
  hasSubCategories: true,
  ),
  CategorieModel(
    id: "112",
    name: "الصدور",
    imagefrontsmallurl: Assets.masaratSubcat.sdorDgag.path,
    hasSubCategories: true,
  ),
  CategorieModel(
    id: "113",
    name: "شاورما الدجاج",
    imagefrontsmallurl: Assets.masaratSubcat.shawrma.path,
    hasSubCategories: true,
  ),
];
