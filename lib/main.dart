import 'package:flutter/material.dart';
import 'package:go_router_02/news_app.dart';
import 'package:go_router_02/news_app_router.dart';

void main() {
  final router = NewsAppRouter();

  router.routerDelegate.addListener(() {
    debugPrint('Current location: ${router.state.uri}');
  });

  runApp(NewsApp(router: router));
}
