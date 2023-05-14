import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../gen/assets.gen.dart';
import 'detailAlbumb/audio_provider_viewmodel.dart';
import 'home_viewmodel.dart';

class ListMusicPage extends StatelessWidget {
  const ListMusicPage({super.key});

  @override
  Widget build(BuildContext context) {
    var myDataController = context.watch<MyDataModel>();

    return ChangeNotifierProvider<MyDataModel>(
      //      <--- ChangeNotifierProvider
      create: (context) => MyDataModel(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          leading: Container(
            margin: const EdgeInsets.only(left: 30),
            child: Assets.icons.drawer.svg(),
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 29),
              child: Assets.icons.search.svg(),
            )
          ],
          title: const Text(
            "Music Player",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w600, fontSize: 15),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 30.0, bottom: 8.0),
              child: Text(
                'Recommended',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
                child: Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 10.0),
                    child: Consumer<MyDataModel>(builder: (context, md, child) {
                      return SizedBox(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child: ListView(
                              scrollDirection: Axis.vertical,
                              children: md.listViewMusic));
                    }))),

          ],
        ),
      ),
    );
  }
}
