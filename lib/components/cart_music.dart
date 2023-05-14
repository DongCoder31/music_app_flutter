import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retrofitapi_flutter/pages/detailAlbumb/audio_provider_viewmodel.dart';

import '../gen/assets.gen.dart';
import '../pages/constants.dart';
import '../pages/home_viewmodel.dart';

class CartMusicModel extends StatelessWidget {
  const CartMusicModel(
      {super.key,
      required this.title,
      required this.description,
      required this.time,
      required this.author,
      required this.imageUrl,
      required this.isLoadSound,
      required this.pathMusic

      });

  final String title, description, time, author, imageUrl,pathMusic;
  final bool isLoadSound;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AudioProvider>(context);


    return Consumer<MyDataModel>( //                  <--- Consumer
        builder: (context, myModel, child)
    { return
      GestureDetector(
        onTap: () {
          myModel.addDataShow(
              title, description, time, author, imageUrl, true,pathMusic);
          provider.playPause(pathMusic);
        },
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Card(
                  shadowColor: Colors.grey,
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                    const Icon(Icons.error),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                      ),
                    ),
                    Text(author),
                  ],
                ),
                Container(
                    margin: const EdgeInsets.only(left: 30), child: Text(time)),
                Container(
                    margin: const EdgeInsets.only(left: 75),
                    child: Assets.icons.group.svg()),
                Container(
                    margin: const EdgeInsets.only(left: 75, right: 25),
                    child: Assets.icons.vector4.svg()),
              ],
            ),
            if (isLoadSound == true)
              Container(
                margin: const EdgeInsetsDirectional.only(top: 10.0),
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                width: double.infinity,
                child: const LinearProgressIndicator(
                  backgroundColor: kLightColor,
                  value: 0.6,
                  valueColor: AlwaysStoppedAnimation(favoriteColor),
                ),
              ),
          ],
        ),
      );
    } );
  }
}
