import 'package:flutter/material.dart';

class TabbedNewsPage extends StatelessWidget {
  const TabbedNewsPage({super.key});

  // TODO: Add tabIndex parameter

  // TODO: Make this a stateful widget

  // TODO: Add a listener to the init state that navigates based on the new index

  // TODO: override didUpdateWidget to update the tab index when the widget is updated

  @override
  Widget build(BuildContext context) {
    // TODO: Remove DefaultTabController
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('News'),
          bottom: TabBar(tabs: [Tab(text: 'Latest'), Tab(text: 'Trending')]),
        ),
        body: TabBarView(
          children: [
            Center(child: Text('Content for Latest News')),
            Center(child: Text('Content for Trending News')),
          ],
        ),
      ),
    );
  }
}
