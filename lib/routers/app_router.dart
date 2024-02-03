import 'package:auto_route/auto_route.dart';
import 'package:emi_calculator/routers/app_router.gr.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          page: AppNavigationRoute.page,
          initial: true,
          children: [
            RedirectRoute(path: '', redirectTo: 'home'),
            AutoRoute(path: 'home', page: HomeRoute.page),
            AutoRoute(path: 'other', page: OtherRoute.page),
            AutoRoute(path: 'emi-calculator', page: EmiCalculatorRoute.page),
          ],
        ),
      ];

  @override
  RouteType get defaultRouteType => const RouteType.material();
}
