import 'package:masarat_alnahdha/core/di/dependency_injection.dart';
import 'package:masarat_alnahdha/core/models/hero_model/hero_model.dart';
import 'package:masarat_alnahdha/core/models/product/product_model.dart';
import 'package:masarat_alnahdha/core/utills/cache_helper.dart';
import 'package:masarat_alnahdha/features/about_app/presentation/page/about_app_page.dart';
import 'package:masarat_alnahdha/features/address/presentation/page/map_screen.dart';
import 'package:masarat_alnahdha/features/categories_info/domain/entities/food_entity.dart';
import 'package:masarat_alnahdha/features/categories_info/presentation/cubit/categories_info_cubit.dart';
import 'package:masarat_alnahdha/features/categories_info/presentation/pages/categories_info_screen.dart';
import 'package:masarat_alnahdha/features/category_full_info/presentation/cubit/category_full_info_cubit.dart';
import 'package:masarat_alnahdha/features/category_full_info/presentation/pages/category_full_info_screen.dart';
import 'package:masarat_alnahdha/features/chat_page/presentation/page/chat_page.dart';
import 'package:masarat_alnahdha/features/check_out/presentation/manager/checkout_steps_cubit.dart';
import 'package:masarat_alnahdha/features/check_out/presentation/page/checkout_steps_page.dart';
import 'package:masarat_alnahdha/features/contact_us/presentation/page/contact_us.dart';
import 'package:masarat_alnahdha/features/edit_profile/page/edit_profile_page.dart';
import 'package:masarat_alnahdha/features/help/presentation/page/help_page.dart';
import 'package:masarat_alnahdha/features/home/presentation/manager/home_cubit/home_screen_cubit.dart';
import 'package:masarat_alnahdha/features/home/presentation/page/home_page.dart';
import 'package:masarat_alnahdha/features/layout/presentation/manager/layout_cubit.dart';
import 'package:masarat_alnahdha/features/layout/presentation/page/layout.dart';
import 'package:masarat_alnahdha/features/login/presentation/manager/login_cubit.dart';
import 'package:masarat_alnahdha/features/login/presentation/pages/login_page.dart';
import 'package:masarat_alnahdha/features/notification/presentation/page/notification_page.dart';
import 'package:masarat_alnahdha/features/on_boarding/presentation/views/on_boarding_page.dart';
import 'package:masarat_alnahdha/features/orders/presentation/pages/orders_page.dart';
import 'package:masarat_alnahdha/features/products/presentation/manager/products_cubit.dart';
import 'package:masarat_alnahdha/features/products/presentation/page/products_page.dart';
import 'package:masarat_alnahdha/features/profile_address/profile_address_page.dart';
import 'package:masarat_alnahdha/features/profile_page/presentation/pages/profile_page.dart';
import 'package:masarat_alnahdha/features/register/presentation/manager/register_cubit.dart';
import 'package:masarat_alnahdha/features/register/presentation/pages/register_page.dart';
import 'package:masarat_alnahdha/features/rider/features/account/presentation/cubit/account_cubit.dart';
import 'package:masarat_alnahdha/features/rider/features/account/presentation/pages/rider_account_screen.dart';
import 'package:masarat_alnahdha/features/rider/features/home_rider/presentation/cubit/home_rider_cubit.dart';
import 'package:masarat_alnahdha/features/rider/features/home_rider/presentation/pages/home_rider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:masarat_alnahdha/features/subcategories/presentation/pages/sub_categories_screen.dart';
import 'package:masarat_alnahdha/features/termis_and_condition/termis_and_conditions.dart';

import '../../core/helper/bloc_observer.dart';
import '../../core/routes/pages_keys.dart';

/// 🔒 Auth Guard
class AuthGuard {
  static String? redirect(BuildContext context, GoRouterState state) {
    // final loginCubit = sl<LoginCubit>();
    String? isLoggedIn = CacheHelper.getData(
      key: 'token',
    ); // لازم تكون موجودة في Cubit
    if (isLoggedIn == null) {
      return "/${PagesKeys.loginPage}";
    }
    return null;
  }
}

class PageRoutes {
  /// Root navigator (خارج الـ Shell) لصفحات زي Onboarding/Login/Details/Map
  static final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'root');

  /// Shell navigator (داخل الـ LayoutView مع التابات)
  static final GlobalKey<NavigatorState> _shellNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'shell');
  // static final GlobalKey<NavigatorState> _shellNavigatorKey2 =
  //     GlobalKey<NavigatorState>(debugLabel: 'shell2');

  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    observers: [MyNavigatorObserver()],
    initialLocation: PagesKeys.loginPage,
    // initialLocation: "/${PagesKeys.homeRiderPage}",
    errorBuilder: (context, state) {
      PrintHelper(state.error.toString());
      return const ErorPage();
    },
    // redirect: (context, state) {
    //   final isLoggedIn = sl<LoginCubit>().state.isLoggedIn; // أو أي مصدر للحالة

    //   final loggingIn = state.matchedLocation == "/${PagesKeys.loginPage}";

    //   // لو مش داخل وبيحاول يروح على صفحة محمية
    //   if (!isLoggedIn && state.matchedLocation == "/${PagesKeys.profilePage}") {
    //     return "/${PagesKeys.loginPage}";
    //   }

    //   // لو داخل وواقف على صفحة تسجيل الدخول
    //   if (isLoggedIn && loggingIn) {
    //     return "/${PagesKeys.homePage}";
    //   }

    //   return null; // مفيش إعادة توجيه
    // },
    routes: [
      // ---------------- Onboarding
      // GoRoute(
      //   parentNavigatorKey: _rootNavigatorKey,
      //   name: PagesKeys.oboardingScreen,
      //   path: "/${PagesKeys.oboardingScreen}",
      //   pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
      //     context: context,
      //     state: state,
      //     child: const OboardingScreen(),
      //   ),
      // ),
      // ---------------- Onboarding
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        name: PagesKeys.oboardingScreen,
        path: "/${PagesKeys.oboardingScreen}",
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const OnBoardingPage(),
          // child: const Scaffold(
          //   body: AspectRatio(
          //     aspectRatio: 16 / 9,
          //     child: CachedImage(
          //       url:
          //           "https://letsenhance.io/static/73136da51c245e80edc6ccfe44888a99/396e9/MainBefore.jpg",
          //     ),
          //   ),
          // ),
        ),
      ),

      // ---------------- Register
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        name: PagesKeys.registerPage,
        path: "/${PagesKeys.registerPage}",
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: BlocProvider(
            create: (context) => sl<RegisterCubit>(),
            child: const RegisterPage(),
          ),
        ),
      ),

      // ---------------- Login
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        name: PagesKeys.loginPage,
        path: "/${PagesKeys.loginPage}",
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: BlocProvider(
            create: (context) => sl<LoginCubit>(),
            child: const LoginPage(),
          ),
        ),
      ),

      // ---------------- Layout + Tabs via StatefulShellRoute
      StatefulShellRoute.indexedStack(
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state, navigationShell) => MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => sl<LayoutCubit>()..initialize()),
            BlocProvider(create: (_) => sl<HomeScreenCubit>()),
            // BlocProvider(create: (_) => sl<CategoriesCubit>()),
            BlocProvider(create: (_) => sl<CheckoutStepsCubit>()),
            BlocProvider(create: (_) => sl<ProductsCubit>()),
          ],
          child: LayoutView(shell: navigationShell),
        ),
        branches: [
          // ------- Branch: Home
          StatefulShellBranch(
            navigatorKey: _shellNavigatorKey,
            routes: [
              GoRoute(
                name: PagesKeys.homePage,
                path: "/${PagesKeys.homePage}",
                pageBuilder: (context, state) =>
                    buildPageWithDefaultTransition<void>(
                      context: context,
                      state: state,
                      child: const HomePage(),
                    ),
              ),
              // Products (nested under Home)
              GoRoute(
                name: PagesKeys.productsPage,
                path: "/${PagesKeys.productsPage}",
                pageBuilder: (context, state) {
                  final title = state.extra is String
                      ? state.extra as String
                      : 'Products';
                  return buildPageWithDefaultTransition<void>(
                    context: context,
                    state: state,
                    child: BlocProvider(
                      create: (_) => sl<ProductsCubit>(),
                      child: ProductsPage(title: title),
                    ),
                  );
                },
              ),
              // Favorites (nested under Home)
              // GoRoute(
              //   name: PagesKeys.favoritesPage,
              //   path: "/${PagesKeys.favoritesPage}",
              //   pageBuilder: (context, state) =>
              //       buildPageWithDefaultTransition<void>(
              //         context: context,
              //         state: state,
              //         child: BlocProvider(
              //           create: (_) => sl<FavoritesCubit>(),
              //           child: const FavoritesPage(),
              //         ),
              //       ),
              // ),
            ],
          ),

          // ------- Branch: Categories
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: PagesKeys.categoriesPage,
                path: "/${PagesKeys.categoriesPage}",
                pageBuilder: (context, state) =>
                    buildPageWithDefaultTransition<void>(
                      context: context,
                      state: state,
                      child: const OrdersPage(),
                    ),
              ),
            ],
          ),

          // ------- Branch: Checkout Steps
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: PagesKeys.checkoutStepsPage,
                path: "/${PagesKeys.checkoutStepsPage}",
                pageBuilder: (context, state) =>
                    buildPageWithDefaultTransition<void>(
                      context: context,
                      state: state,
                      child: const CheckoutStepsPage(),
                    ),
              ),
            ],
          ),

          //--------Branch: profile page (🔒 محمي بالـ AuthGuard)
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: PagesKeys.profilePage,
                path: "/${PagesKeys.profilePage}",
                // redirect: AuthGuard.redirect, // هنا الحماية
                pageBuilder: (context, state) =>
                    buildPageWithDefaultTransition<void>(
                      context: context,
                      state: state,
                      child: const ProfilePage(),
                    ),
              ),
            ],
          ),
        ],
      ),

      // ----------------resturant Layout + Tabs via StatefulShellRoute
      // StatefulShellRoute.indexedStack(
      //   parentNavigatorKey: _rootNavigatorKey,
      //   builder: (context, state, navigationShell2) => MultiBlocProvider(
      //     providers: [
      //       BlocProvider(create: (_) => sl<ResturantLayoutCubit>()),
      //       BlocProvider(create: (_) => sl<ResturantHomeCubit>()),
      //       BlocProvider(create: (_) => sl<ResturantFoodListCubit>()),
      //       // BlocProvider(create: (_) => sl<>()),
      //       // BlocProvider(create: (_) => sl<>()),
      //     ],
      //     child: ResturantLayout(shell: navigationShell2),
      //   ),
      //   branches: [
      //     // ------- Branch: Home
      //     StatefulShellBranch(
      //       navigatorKey: _shellNavigatorKey,
      //       routes: [
      //         GoRoute(
      //           name: PagesKeys.resturantHomePage,
      //           path: "/${PagesKeys.resturantHomePage}",
      //           pageBuilder: (context, state) =>
      //               buildPageWithDefaultTransition<void>(
      //                 context: context,
      //                 state: state,
      //                 child: const ResturantHomePage(),
      //               ),
      //         ),

      //         // Products (nested under Home)
      //       ],
      //     ),

      //     // ------- Branch: Categories
      //     StatefulShellBranch(
      //       routes: [
      //         GoRoute(
      //           name: PagesKeys.resturantFoodListPage,
      //           path: "/${PagesKeys.resturantFoodListPage}",
      //           pageBuilder: (context, state) {
      //             return buildPageWithDefaultTransition<void>(
      //               context: context,
      //               state: state,
      //               child: const ResturantFoodListPage(),
      //             );
      //           },
      //         ),
      //       ],
      //     ),

      //     // ------- Branch: Checkout Steps
      //     StatefulShellBranch(
      //       routes: [
      //         GoRoute(
      //           name: PagesKeys.resturantWorkTimePage,
      //           path: "/${PagesKeys.resturantWorkTimePage}",
      //           pageBuilder: (context, state) =>
      //               buildPageWithDefaultTransition<void>(
      //                 context: context,
      //                 state: state,
      //                 child: const ResturantWorkTimePage(),
      //               ),
      //         ),
      //       ],
      //     ),

      //     //--------Branch: profile page (🔒 محمي بالـ AuthGuard)
      //     StatefulShellBranch(
      //       routes: [
      //         GoRoute(
      //           name: PagesKeys.resturantAccountPage,
      //           path: "/${PagesKeys.resturantAccountPage}",
      //           // redirect: AuthGuard.redirect, // هنا الحماية
      //           pageBuilder: (context, state) =>
      //               buildPageWithDefaultTransition<void>(
      //                 context: context,
      //                 state: state,
      //                 child: const ResturantAccountPage(),
      //               ),
      //         ),
      //       ],
      //     ),
      //   ],
      // ),

      // ---------------- Product Details (خارج الـ Shell)
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        name: PagesKeys.productDetailsPage,
        path: "/${PagesKeys.productDetailsPage}",
        pageBuilder: (context, state) {
          if (state.extra is! List || (state.extra as List).length < 2) {
            return buildPageWithDefaultTransition<void>(
              context: context,
              state: state,
              child: const ErorPage(),
            );
          }
          final data = state.extra as List;
          final productModel = data[0];
          final heroModel = data[1];

          if (productModel is! ProductModel || heroModel is! HeroModel) {
            return buildPageWithDefaultTransition<void>(
              context: context,
              state: state,
              child: const ErorPage(),
            );
          }

          return buildPageWithDefaultTransition<void>(
            context: context,
            state: state,
            child: const Scaffold(),
            // BlocProvider(
            //   create: (context) => sl<ProductDetailsCubit>(),
            //   child: ProductDetailsPage(
            //     productModel: productModel,
            //     heroModel: heroModel,
            //   ),
            // ),
          );
        },
      ),

      // ---------------- Map (خارج الـ Shell)
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        name: PagesKeys.mapScreen,
        path: "/${PagesKeys.mapScreen}",
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const MapScreen(),
        ),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        name: PagesKeys.categoryInfoScreen,
        path: "/${PagesKeys.categoryInfoScreen}",
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: BlocProvider(
            create: (context) => CategoriesInfoCubit(),
            child: const CategoriesInfoScreen(),
          ),
        ),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        name: PagesKeys.categoryFullInfoScreen,
        path: "/${PagesKeys.categoryFullInfoScreen}",
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: BlocProvider(
            create: (context) {
              final data = state.extra as Map<String, dynamic>;
              return CategoryFullInfoCubit(food: data["food"] as FoodEntity);
            },
            child: const CategoryFullInfoScreen(),
          ),
        ),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        name: PagesKeys.homeRiderPage,
        path: "/${PagesKeys.homeRiderPage}",
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: BlocProvider(
            create: (context) {
              return HomeRiderCubit();
            },
            child: const HomeRiderScreen(),
          ),
        ),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        name: PagesKeys.riderAccound,
        path: "/${PagesKeys.riderAccound}",
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: BlocProvider(
            create: (context) {
              return AccountCubit();
            },
            child: const RiderAccountPage(),
          ),
        ),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        name: PagesKeys.aboutAppPage,
        path: "/${PagesKeys.aboutAppPage}",
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const AboutAppPage(),
        ),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        name: PagesKeys.termisAndConditions,
        path: "/${PagesKeys.termisAndConditions}",
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const TermisAndConditions(),
        ),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        name: PagesKeys.contactUs,
        path: "/${PagesKeys.contactUs}",
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const ContactUs(),
        ),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        name: PagesKeys.helpPage,
        path: "/${PagesKeys.helpPage}",
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const HelpPage(),
        ),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        name: PagesKeys.notificationPage,
        path: "/${PagesKeys.notificationPage}",
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const NotificationPage(),
        ),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        name: PagesKeys.profileAddressPage,
        path: "/${PagesKeys.profileAddressPage}",
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const ProfileAddressPage(),
        ),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        name: PagesKeys.editProfilePage,
        path: "/${PagesKeys.editProfilePage}",
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const EditProfilePage(),
        ),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        name: PagesKeys.chatPage,
        path: "/${PagesKeys.chatPage}",
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const ChatPage(),
        ),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        name: PagesKeys.subCategory,
        path: "/${PagesKeys.subCategory}",
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const SubCategoriesScreen(),
        ),
      ),
    ],
  );

  /// تنقل سريع بالاسم
  static void goNamed(String name, {Object? extra}) {
    router.goNamed(name, extra: extra);
  }

  /// استبدال المسار الحالي (مفيد كـ reset خفيف)
  static void replaceNamed(String name, {Object? extra}) {
    router.replaceNamed(name, extra: extra);
  }

  /// (اختياري) محاولة تصفية الـ stack ثم الذهاب (قد لا يفضي كل فروع الـ shell)
  static void clearAndNavigate(String name, {Object? extra}) {
    while (router.canPop()) {
      router.pop();
    }
    router.goNamed(name, extra: extra);
  }
}

/// صفحة الخطأ الافتراضية
class ErorPage extends StatelessWidget {
  const ErorPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text("Error")));
  }
}

/// مراقب التنقل لأغراض الـ logging
class MyNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    PrintHelper('Navigate To ${route.settings.name}');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    PrintHelper('Back To ${route.settings.name}');
  }
}

/// صفحة انتقال Fade افتراضية
CustomTransitionPage<T> buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}

/// صفحة انتقال Slide من اليمين لليسار
CustomTransitionPage<T> buildPageWithSlideTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        SlideTransition(
          position: animation.drive(
            Tween<Offset>(
              begin: const Offset(1, 0), // من اليمين
              end: Offset.zero,
            ).chain(CurveTween(curve: Curves.easeInOut)),
          ),
          child: child,
        ),
  );
}
