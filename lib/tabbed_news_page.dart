import 'package:flutter/material.dart';
import 'package:go_router_02/news_app_router.dart';

class TabbedNewsPage extends StatefulWidget {
  const TabbedNewsPage({super.key, required this.tabIndex});

  final int tabIndex;

  @override
  State<TabbedNewsPage> createState() => _TabbedNewsPageState();
}

class _TabbedNewsPageState extends State<TabbedNewsPage>
    with SingleTickerProviderStateMixin {
  late final _controller = TabController(
    length: 2,
    vsync: this,
    initialIndex: widget.tabIndex,
  );

  late int currentTabIndex;

  @override
  void initState() {
    super.initState();

    currentTabIndex = _controller.index;

    _controller.addListener(() {
      if (_controller.indexIsChanging) return;

      if (currentTabIndex != _controller.index) {
        debugPrint('Tab changed to: ${_controller.index}');

        switch (_controller.index) {
          case 0:
            context.newsAppRouter.goToLatest();
          case 1:
            context.newsAppRouter.goToTrending();
        }
      }
    });
  }

  @override
  void didUpdateWidget(covariant TabbedNewsPage oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.tabIndex != widget.tabIndex) {
      _controller.index = widget.tabIndex;
      currentTabIndex = widget.tabIndex;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News'),
        bottom: TabBar(
          controller: _controller,
          tabs: [Tab(text: 'Latest'), Tab(text: 'Trending')],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          Center(child: Text('Content for Latest News')),
          Center(child: Text('Content for Trending News')),
        ],
      ),
    );
  }
}
