import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animate_do/animate_do.dart';

import '../../components/cart_albumb.dart';
import '../../components/cart_music.dart';
import '../../gen/assets.gen.dart';
import '../../models/cart_albumb.dart';
import '../../models/music_model.dart';
import '../home_viewmodel.dart';
import '../index_detail_albumb.dart';


class DetailAlbumbScreen extends StatefulWidget {
  const DetailAlbumbScreen({super.key});

  @override
  State<DetailAlbumbScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<DetailAlbumbScreen> {

  List<Widget> listViewAlbum = [];
  List<Widget> listViewMusic = [];
  List<MusicModel> listMusic = [
    MusicModel(
        id: 1,
        title: 'The last best1',
        description: 'MUSIC',
        time: '30.3',
        author: 'jack',
        imageUrl: 'assets/images/unsplash_1.png',
        pathMusic: 'Infinity.mp3',
        isLoadSound: true),
    MusicModel(
        id: 2,
        title: 'The last best2',
        description: 'MUSIC',
        time: '30.3',
        author: 'jack',
        imageUrl: 'assets/images/unsplash_2.png',
        pathMusic: 'Infinity.mp3',
        isLoadSound: false),
    MusicModel(
        id: 3,
        title: 'The last best3',
        description: 'MUSIC',
        time: '30.3',
        author: 'jack',
        imageUrl: 'assets/images/unsplash_2.png',
        pathMusic: 'Infinity.mp3',
        isLoadSound: false),
  ];


  addViewModel() {
    for (int i = 0; i < listMusic.length; i++) {
      listViewMusic.add(CartMusicModel(
        title: '${listMusic[i].title}',
        description: '${listMusic[i].description}',
        time: '${listMusic[i].time}',
        author: '${listMusic[i].author}',
        imageUrl: '${listMusic[i].imageUrl}',
        pathMusic: '${listMusic[i].pathMusic}',
        isLoadSound: false,
      ));
    }
  }

  @override
  void initState() {
    addViewModel();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    var indexAlbum = context.watch<IndexAlbum>();

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
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
      body: Stack(
        children: [
          FadeInDown(
            delay: const Duration(milliseconds: 100),
            child: Container(
              width: width,
              height: height / 2.1,
              decoration: const BoxDecoration(
                  color: Colors.orangeAccent,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(1000),
                      bottomLeft: Radius.circular(1000))),
            ),
          ),
         Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             const SizedBox(
               height: 35.0,
             ),
             Padding(
               padding: const EdgeInsets.only(left: 140.0),
               child: SizedBox(
                 height: 320,
                 child:  Consumer<MyDataModel>(builder: (context, md, child) {
                   return  Container(
                       width: 240.0,
                       height: 300.0,
                       alignment: Alignment.bottomLeft,
                       decoration: BoxDecoration(
                         boxShadow: kElevationToShadow[4],
                         color: Theme
                             .of(context)
                             .bottomAppBarColor,
                         image: DecorationImage(
                           fit: BoxFit.fill,
                           image: AssetImage(md.listDataAlbum[indexAlbum.index].imageUrl.toString()),
                         ),
                         borderRadius: BorderRadius.circular(20.0),
                       ),
                       margin: const EdgeInsets.only(right: 30));

                 }
                 ),
               ),
             ),

             const SizedBox(
               height: 40.0,
             ),
             const Padding(
               padding: EdgeInsets.only(left: 30, bottom: 8.0),
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
                     child: SizedBox(
                         height: MediaQuery.of(context).size.height,
                         width: MediaQuery.of(context).size.width,
                         child: ListView(children: listViewMusic)))),
             Container(
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
                           'assets/images/unsplash_1.png',
                           fit: BoxFit.cover,
                         ),
                         Padding(
                           padding: const EdgeInsets.only(
                               left: 14.0, top: 8.0, bottom: 16.0),
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: const [
                               Text(
                                 'The Last beat',
                                 style: TextStyle(
                                   fontWeight: FontWeight.bold,
                                   fontSize: 15.0,
                                 ),
                               ),
                               Text('Jazz'),
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
                         Container(
                           child: Assets.icons.vtPlay.svg(),
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
             ),
           ],
         )
        ],
      ),
    );
  }
}
