import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/detailAlbumb/navigation_viewmodel.dart';
import '../pages/home_page.dart';
import '../pages/home_viewmodel.dart';
import '../pages/list_music.dart';

class BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tabManager = Provider.of<TabManager>(context);
    return ChangeNotifierProvider<MyDataModel>(
      //      <--- ChangeNotifierProvider
      create: (context) => MyDataModel(),
      child:
      Scaffold(
        body: _buildTabContent(tabManager.currentTab),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: tabManager.currentTab.index,
          onTap: (index) => tabManager.setTab(TabItem.values[index]),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'List',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'User',
            ),
          ],
        ),
      )
    );

  }

  Widget _buildTabContent(TabItem currentTab) {
    switch (currentTab) {
      case TabItem.home:
        return ChangeNotifierProvider<MyDataModel>(
          //      <--- ChangeNotifierProvider
            create: (context) => MyDataModel(),
            child:
            const MyHomePage()
        );
      case TabItem.list:
        return ChangeNotifierProvider<MyDataModel>(
          //      <--- ChangeNotifierProvider
            create: (context) => MyDataModel(),
            child:
            const ListMusicPage()
        );
      case TabItem.user:
        return const MyHomePage();
      default:
        throw ArgumentError('Invalid tab item: $currentTab');
    }
  }
}
