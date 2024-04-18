import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  // The routes of the app
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: MovieListRoute.page,
          initial: true,
        ),
        AutoRoute(
          page: MovieDetailsRoute.page,
        ),
        AutoRoute(
          page: TwoButtonsRoute.page,
        ),
      ];
}
