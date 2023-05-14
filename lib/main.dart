import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retrofitapi_flutter/pages/detailAlbumb/detail_albumb_viewmodel.dart';
import 'package:retrofitapi_flutter/pages/detailAlbumb/load.dart';
import 'package:retrofitapi_flutter/pages/detailAlbumb/navigation_viewmodel.dart';
import 'package:retrofitapi_flutter/pages/detailAlbumb/audio_provider_viewmodel.dart';
import 'package:retrofitapi_flutter/pages/home_viewmodel.dart';
import 'package:retrofitapi_flutter/pages/index_detail_albumb.dart';
import 'package:retrofitapi_flutter/constants/navigation.dart';

import 'base/di/locator.dart';
import 'main_viewmodel.dart';
import 'pages/home_page.dart';

void main() {
  setUpInjector();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MyDataModel>(create: (_) => MyDataModel()),
        ChangeNotifierProvider<IndexAlbum>(create: (_) => IndexAlbum()),
        ChangeNotifierProvider<AudioProvider>(create: (_) => AudioProvider()),
        ChangeNotifierProvider<TabManager>(create: (_) => TabManager()),
      ],
      child: MaterialApp(
        title: 'FULL API - RETROFIT',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}
