import 'package:masarat_alnahdha/features/check_out/presentation/manager/checkout_steps_cubit.dart';
import 'package:masarat_alnahdha/features/home/presentation/manager/home_cubit/home_screen_cubit.dart';
import 'package:masarat_alnahdha/features/layout/presentation/manager/layout_cubit.dart';
import 'package:masarat_alnahdha/features/login/presentation/manager/login_cubit.dart';
import 'package:masarat_alnahdha/features/products/presentation/manager/products_cubit.dart';
import 'package:masarat_alnahdha/features/profile_page/data/repo/log_out_repo_impl.dart';
import 'package:masarat_alnahdha/features/profile_page/data/repo/logout_repo.dart';
import 'package:masarat_alnahdha/features/register/presentation/manager/register_cubit.dart';
import 'package:get_it/get_it.dart';
import '../../core/utills/api_server.dart';
import '../../core/utills/dio_manager.dart';

GetIt sl = GetIt.instance;

Future<void> setupGetIt() async {
  // DioManager dioManager = DioManager();
  // sl.registerLazySingleton<ApiServer>(
  //   () => ApiServer(dioManager: dioManager.dio),
  // );
  // app Cubits
  sl.registerFactory<HomeScreenCubit>(() => HomeScreenCubit());
  sl.registerFactory<RegisterCubit>(() => RegisterCubit());
  sl.registerFactory<LoginCubit>(() => LoginCubit());
  sl.registerFactory<LayoutCubit>(() => LayoutCubit());
  // sl.registerFactory<ProductDetailsCubit>(() => ProductDetailsCubit());
  sl.registerFactory<ProductsCubit>(() => ProductsCubit());
  // sl.registerFactory<CategoriesCubit>(() => CategoriesCubit());
  sl.registerFactory<CheckoutStepsCubit>(() => CheckoutStepsCubit());
  //resturant layout Cubits
  // sl.registerFactory<ResturantHomeCubit>(() => ResturantHomeCubit());
  // sl.registerFactory<ResturantFoodListCubit>(() => ResturantFoodListCubit());
  // sl.registerFactory<ResturantLayoutCubit>(() => ResturantLayoutCubit());

  // register product model
  // sl.registerLazySingleton<ProductModel>(
  //   () => ProductModel(
  //     id: 0,
  //     name: 'Suvage',
  //     description: 'sssssss',
  //     isFavorite: true,
  //     category: [
  //       CategoryModel(
  //         id: 0,
  //         name: 'Suvage',
  //         imageUrl:
  //             'https://i.pinimg.com/736x/25/ba/fd/25bafdd90cba38a01d9ba3f40fdbd02d.jpg',
  //       ),
  //     ],
  //     // classification: [],
  //     // ultraClassification: [],
  //     productComponents: [],
  //     productDocuments: [ProductDocument(id: 0, imageUrl: AppImage.logo)],
  //     productSizes: [
  //       ProductSize(
  //         id: 0,
  //         size: '5',
  //         price: 100,
  //         priceAfterDiscount: 90,
  //         availableAmount: 1,
  //       ),
  //     ],
  //     companyId: 0,
  //     companyName: "sss",
  //   ),
  // );

  // sl.registerLazySingleton<LogoutRepo>(() => LogOutRepoImpl());

  // sl.registerLazySingleton<NewsRepoImpl>(() => NewsRepoImpl());
  // sl.registerLazySingleton<NewsDetailsRepoImpl>(() => NewsDetailsRepoImpl());
  // sl.registerLazySingleton<MagazineRepoImpl>(() => MagazineRepoImpl());
  // sl.registerLazySingleton<MagazineDetailsRepoImpl>(
  //   () => MagazineDetailsRepoImpl(),
  // );

  // sl.registerLazySingleton<StockCategoryRepoImpl>(
  //   () => StockCategoryRepoImpl(),
  // );
  // sl.registerLazySingleton<CompanyRepoImpl>(() => CompanyRepoImpl());
  // // sl.registerLazySingleton<ManagerRepoImpl>(()=>ManagerRepoImpl(apiServer: sl.get<ApiServer>()));
  // sl.registerLazySingleton<CraftModel>(
  //   () => CraftModel(
  //     craft: '',
  //     subCrafts: [
  //       SubCraftModel(
  //         createdAt: DateTime.now(),
  //         details: '',
  //         id: 0,
  //         img: '',
  //         imgThumbnail: '',
  //         name: '',
  //       ),
  //       SubCraftModel(
  //         createdAt: DateTime.now(),
  //         details: '',
  //         id: 0,
  //         img: '',
  //         imgThumbnail: '',
  //         name: '',
  //       ),
  //       SubCraftModel(
  //         createdAt: DateTime.now(),
  //         details: '',
  //         id: 0,
  //         img: '',
  //         imgThumbnail: '',
  //         name: '',
  //       ),
  //     ],
  //   ),
  // );
  // sl.registerLazySingleton<CompanyDetailsRepoImpl>(
  //   () => CompanyDetailsRepoImpl(),
  // );
  // sl.registerLazySingleton<InternalPageRepoImpl>(() => InternalPageRepoImpl());
  // // // getIt.registerFactory<OtpCubit>(()=>OtpCubit());
  // sl.registerFactory<HomeCubit>(() => HomeCubit(sl.get<HomeRepoImpl>()));
  // sl.registerFactory<CompanyDetailCubit>(
  //   () => CompanyDetailCubit(sl.get<CompanyDetailsRepoImpl>()),
  // );
  // sl.registerFactory<CategoryCubit>(() => CategoryCubit());
  // sl.registerFactory<MagazineDetailsCubit>(() => MagazineDetailsCubit());
  // sl.registerFactory<AboutUsRepoImpl>(() => AboutUsRepoImpl());
  // sl.registerFactory<ContactUsRepoImpl>(() => ContactUsRepoImpl());
  // sl.registerFactory<SubCategoryCubit>(() => SubCategoryCubit());
  // sl.registerLazySingleton<CategoriesRepoImpl>(() => CategoriesRepoImpl());
  // sl.registerLazySingleton<SubCategoriesRepoImpl>(
  //   () => SubCategoriesRepoImpl(),
  // );
  // sl.registerLazySingleton<CategoryModel>(
  //   () => CategoryModel(
  //     createdAt: DateTime.now(),
  //     details: '',
  //     id: 0,
  //     img: '',
  //     imgThumbnail: '',
  //     name: '',
  //     parentId: 0,
  //     ord: 0,
  //     sector: '',
  //     type: '',
  //   ),
  // );
  // sl.registerLazySingleton<SubCategoryModel>(
  //   () => SubCategoryModel(
  //     createdAt: DateTime.now(),
  //     details: '',
  //     id: 0,
  //     img: '',
  //     imgThumbnail: '',
  //     name: '',
  //     parentId: 0,
  //     ord: 0,
  //     sector: '',
  //     type: '',
  //   ),
  // );
  // sl.registerFactory<DriverMapCubit>(()=>DriverMapCubit(driverRepo: sl.get<DriverRepo>()));
}
