import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../gen/assets.gen.dart';
import 'detailAlbumb/audio_provider_viewmodel.dart';
import 'home_viewmodel.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var myDataController = context.watch<MyDataModel>();
    return
 //     ChangeNotifierProvider<MyDataModel>(
      //      <--- ChangeNotifierProvider
  //    create: (context) => MyDataModel(),
  //    child:
      Scaffold(
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
            "Music Players",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w600, fontSize: 15),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 30.0, top: 8.0),
              child: Text(
                'Top Albumb',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: Consumer<MyDataModel>(builder: (context, md, child) {
                  return SizedBox(
                    height: 320,
                    child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: md.listViewAlbum),
                  );
                })),
            const SizedBox(
              height: 10.0,
            ),
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
            Consumer<MyDataModel>(builder: (context, md, child) {
              return md.isLoadSound == true
                  ? Expanded(
                      child:  Padding(
                              padding: const EdgeInsets.only(
                                  left: 30.0, right: 10.0),
                              child: Column(
                                children: [
                                  if (md.isLoadSound == true)
                                    Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Card(
                                              shadowColor: Colors.grey,
                                              child: CachedNetworkImage(
                                                imageUrl: md.imageUrl!,
                                                placeholder: (context, url) =>
                                                    const CircularProgressIndicator(),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        const Icon(Icons.error),
                                              ),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  md.title!,
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15.0,
                                                  ),
                                                ),
                                                Text(md.author!),
                                              ],
                                            ),
                                            Container(
                                                margin: const EdgeInsets.only(
                                                    left: 25),
                                                child: Text(md.time!)),
                                            Container(
                                                padding: const EdgeInsets.only(
                                                    left: 175, right: 1),
                                                child:
                                                    Assets.icons.group.svg()),
                                            GestureDetector(
                                                onTap: () {
                                                  md.setShow(false);
                                                  Provider.of<AudioProvider>(
                                                          context,
                                                          listen: false)
                                                      .stop();
                                                },
                                                child: Container(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 4, right: 20),
                                                    child: const Icon(
                                                        Icons.close)))
                                          ],
                                        ),
                                        if (md.isLoadSound == true)
                                          Consumer<AudioProvider>(
                                            builder: (context, audioProvider,
                                                child) {
                                              return Slider(
                                                value: audioProvider
                                                    .position.inSeconds
                                                    .toDouble(),
                                                max: 237,
                                                onChanged: (value) {
                                                  audioProvider.seek(Duration(
                                                      seconds: value.toInt()));
                                                },
                                              );
                                            },
                                          ),
                                      ],
                                    )
                                ],
                              ))

                    )
                  : const Text('');
            }),

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
            Consumer<MyDataModel>(builder: (context, md, child) {
              return md.isLoadSound == true
                  ? Container(
                      height: 60.0,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(203, 197, 197, 0.51),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.0),
                          topRight: Radius.circular(15.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30.0, right: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  md.imageUrl!,
                                  fit: BoxFit.cover,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 14.0, top: 8.0, bottom: 16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        md.title!,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.0,
                                        ),
                                      ),
                                      Text(md.pathMusic!),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  child: Assets.icons.vtLets.svg(),
                                ),
                                const SizedBox(
                                  width: 15.0,
                                ),
                                // Container(
                                //   child: Assets.icons.vtPlay.svg(),
                                // ),
                                ElevatedButton(
                                  onPressed: () {
                                    Provider.of<AudioProvider>(context,
                                            listen: false)
                                        .playPause(md.pathMusic.toString());
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            const Color.fromRGBO(
                                                203, 197, 197, 0.61)),
                                  ),
                                  child: Consumer<AudioProvider>(
                                      builder: (context, audioProvider, child) {
                                    if (audioProvider.audioPlayerState ==
                                        PlayerState.playing) {
                                      return const Icon(Icons.pause);
                                    } else {
                                      return Assets.icons.vtPlay.svg();
                                    }
                                  }),
                                ),
                                const SizedBox(
                                  width: 15.0,
                                ),
                                Container(
                                  margin: const EdgeInsets.only(right: 29),
                                  child: Assets.icons.vtRight.svg(),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  : const Text('');
            }),
          ],
        ),
      );
 //   );
  }
}
