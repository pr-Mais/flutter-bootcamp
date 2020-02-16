
import 'package:social_app/pages/albums_page.dart';
import 'package:social_app/pages/posts_page.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);
  
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController( length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Social App'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Latest Posts'),
            Tab(text: 'Latest Albums'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          PostsPage(),
          AlbumsPage(),
        ],
      ),
    );
  }
}
