
import 'package:flutter/cupertino.dart';

enum TabItem { home, list, user }
class TabManager with ChangeNotifier {
  TabItem _currentTab = TabItem.list;

  TabItem get currentTab => _currentTab;

  void setTab(TabItem tabItem) {
    _currentTab = tabItem;
    notifyListeners();
  }
}
