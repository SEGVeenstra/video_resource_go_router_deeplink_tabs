import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_02/tabbed_news_page.dart';

class NewsAppRouter extends GoRouter {
  NewsAppRouter()
    : super.routingConfig(
        initialLocation: '/',
        routingConfig: ValueNotifier(RoutingConfig(routes: _routes)),
      );

  void goToLatest() {
    go('/latest');
  }

  void goToTrending() {
    go('/trending');
  }

  static NewsAppRouter of(BuildContext context) {
    return GoRouter.of(context) as NewsAppRouter;
  }
}

extension NewsAppRouterExt on BuildContext {
  NewsAppRouter get newsAppRouter => NewsAppRouter.of(this);
}

final _routes = <RouteBase>[
  GoRoute(path: '/', redirect: (context, state) => '/latest'),
  GoRoute(
    path: '/:tab',
    builder: (context, state) {
      final tab = state.pathParameters['tab'];
      final tabIndex = tab == 'latest' ? 0 : 1;
      return TabbedNewsPage(key: Key('news'), tabIndex: tabIndex);
    },
  ),
];
