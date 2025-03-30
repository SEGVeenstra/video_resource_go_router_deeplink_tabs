import 'package:flutter/material.dart';
import 'package:go_router_02/news_app_router.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({super.key, required this.router});

  final NewsAppRouter router;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: router);
  }
}
