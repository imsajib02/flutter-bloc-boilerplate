import 'package:go_router/go_router.dart';

import '../../presentation/pages/page_barrel.dart';
import '../constants/route_constants.dart';

final _appRouter = GoRouter(
  initialLocation: routeInitial,
  routes: [

    GoRoute(
      name: routeInitial,
      path: routeInitial,
      builder: (context, state) => const Todos(),
    ),
  ]
);

get appRouter => _appRouter;