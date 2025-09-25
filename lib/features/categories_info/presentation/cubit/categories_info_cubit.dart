import 'package:masarat_alnahdha/features/categories_info/domain/entities/food_entity.dart';
import 'package:bloc/bloc.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:equatable/equatable.dart';
import 'package:masarat_alnahdha/gen/assets.gen.dart';

part 'categories_info_state.dart';

class CategoriesInfoCubit extends Cubit<CategoriesInfoState> {
  CategoriesInfoCubit() : super(CategoriesInfoInitial()) {
    currentImage = FoodEntitys[0].fullImage;
  }
  onSwiperChange(int index) {
    swiperController.move(index);
    currentImage = FoodEntitys[index].fullImage;
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
      title: "كباب مشوي مع سلطة ولبن",
      rating: 4.8,
      description:
          "وجبة لذيذة من الكباب المشوي على الفحم، متبلة بتوابل شرقية غنية. "
          "تقدم مع سلطة خضراء طازجة وخبز عربي ساخن. "
          "ويُكملها لبن بارد منعش يجعلها مثالية لأيام الصيف.",
      hours: 0,
      minutes: 30,
      seconds: 0,
      smallImage: Assets.exProductsNoBg.btngan.path,
      fullImage: Assets.exproducts.img20250922Wa0034.path,
    ),
    FoodEntity(
      dishImage:
          "https://images.pexels.com/photos/2641886/pexels-photo-2641886.jpeg?cs=srgb&dl=pexels-willpicturethis-2641886.jpg&fm=jpg",
      title: "شاورما دجاج مع بطاطس",
      rating: 5.0,
      description:
          "شاورما دجاج سورية متبلة بالبهارات الخاصة ومطهوة على شواية دوارة. "
          "تُقدم مع بطاطس مقرمشة مقلية وصوص الثوم الكريمي الشهير. "
          "وجبة سريعة لكنها مشبعة وتجمع بين الطعم الأصيل واللمسة العصرية.",
      hours: 0,
      minutes: 25,
      seconds: 0,
      smallImage: Assets.exProductsNoBg.fegl.path,
      fullImage: Assets.exproducts.img20250922Wa0030.path,
    ),
    FoodEntity(
      dishImage:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJBO44lq1x67748QvsVHDB4ibfcC4kIFy2Pu5mqnMopuiBPoU3kfaJ1nhfpfh0MluDskQ&usqp=CAU",
      title: "مندي لحم مع أرز بسمتي",
      rating: 4.9,
      description:
          "أرز بسمتي مطبوخ على الطريقة الخليجية مع بهارات المندي المميزة. "
          "اللحم الطري يُطهى ببطء فوق الأرز ليمنحه نكهة غنية ودسمة. "
          "وجبة تقليدية مفضلة في المناسبات والعزائم العائلية.",
      hours: 1,
      minutes: 15,
      seconds: 0,
      smallImage: Assets.exProductsNoBg.grains.path,
      fullImage: Assets.exproducts.img20250922Wa0020.path,
    ),
    FoodEntity(
      dishImage:
          "https://previews.123rf.com/images/wolfmaster13/wolfmaster131401/wolfmaster13140100002/24811437-fish-steak-with-salad-dipping-sauce-and-garlic-bread.jpg",
      title: "بيتزا مارغريتا إيطالية",
      rating: 4.7,
      description:
          "بيتزا كلاسيكية بعجينة إيطالية طرية من الداخل ومقرمشة من الأطراف. "
          "مغطاة بصلصة المارينارا الطازجة وجبنة الموزاريلا الذائبة. "
          "وجبة بسيطة لكنها تحمل الطابع الإيطالي الأصيل في كل قضمة.",
      hours: 0,
      minutes: 40,
      seconds: 0,
      smallImage: Assets.exProductsNoBg.mshkl.path,
      fullImage: Assets.exproducts.img20250922Wa0043.path,
    ),
    FoodEntity(
      dishImage:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8Xc2fJdydKaslPL78_HL-8XcrQsycXcxx3xXVF4vb-rnLtB1ShJDNng1zz3K4jmxerBU&usqp=CAU",
      title: "برجر لحم مع جبنة شيدر",
      rating: 4.6,
      description:
          "برجر لحم طازج مشوي على الجريل ليمنحه نكهة مدخنة رائعة. "
          "تعلوه طبقة من جبنة الشيدر الذائبة مع الخس والطماطم الطازجة. "
          "يُقدم مع بطاطس مقلية ذهبية وصوص حسب اختيارك.",
      hours: 0,
      minutes: 20,
      seconds: 0,
      smallImage: Assets.exProductsNoBg.qas.path,
      fullImage: Assets.exproducts.img20250922Wa0015.path,
    ),
    FoodEntity(
      dishImage:
          "https://img.freepik.com/foto-gratis/comida-filete-salmon-plato-frito_1203-4698.jpg?semt=ais_hybrid&w=740&q=80",
      title: "مسخن دجاج فلسطيني",
      rating: 4.9,
      description:
          "خبز الطابون الطازج مغطى بالبصل المقلي مع السماق وزيت الزيتون. "
          "يُضاف فوقه دجاج مشوي متبل بطريقة تقليدية فلسطينية. "
          "طبق شعبي أصيل يجمع بين الطعم التراثي والنكهة الغنية.",
      hours: 1,
      minutes: 0,
      seconds: 0,
      smallImage: Assets.exProductsNoBg.gargeer.path,
      fullImage: Assets.exproducts.img20250922Wa0002.path,
    ),
  ];
}
