import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_02/tabbed_news_page.dart';

class NewsAppRouter extends GoRouter {
  NewsAppRouter()
    : super.routingConfig(
        initialLocation: '/',
        routingConfig: ValueNotifier(RoutingConfig(routes: _routes)),
      );

  // TODO: Add navigation methods for latest and trending tabs

  static NewsAppRouter of(BuildContext context) {
    return GoRouter.of(context) as NewsAppRouter;
  }
}

extension NewsAppRouterExt on BuildContext {
  NewsAppRouter get newsAppRouter => NewsAppRouter.of(this);
}

final _routes = <RouteBase>[
  GoRoute(path: '/', builder: (context, state) => TabbedNewsPage()),

  // TODO: Add routes for tabs
];
