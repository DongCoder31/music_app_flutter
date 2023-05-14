import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/detailAlbumb/detail_albumb_page.dart';
import '../pages/home_viewmodel.dart';
import '../pages/index_detail_albumb.dart';

class CartAlbumModel extends StatelessWidget {
  const CartAlbumModel(
      {super.key,
      required this.tile,
      required this.describe,
      required this.imageUrl,
      required this.id});

  final String imageUrl, tile, describe;
  final int id;

  @override
  Widget build(BuildContext context) {
    var index = context.watch<IndexAlbum>();
    return Consumer<MyDataModel>(builder: (context, md, child) {
     return GestureDetector(
        onTap: () {
          index.index = id;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const DetailAlbumbScreen()),
          );
        },


        child:   Stack(
          children: [ Container(
            width: 240.0,
            height: 280.0,
            alignment: Alignment.bottomLeft,
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                    color: Color.fromRGBO(255, 165, 0, 0.5),
                  offset: Offset(1, 10),
                  blurRadius: 25,
                  spreadRadius: 1,
                )
              ],
              color: Theme
                  .of(context)
                  .bottomAppBarColor,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(imageUrl),
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            margin: const EdgeInsets.only(right: 30),
            child:
            Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(114, 237, 241, 241),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),


                ),
              ),
              height: 60.0,
              width: double.infinity,
              padding: const EdgeInsets.only(left: 20.0, top: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: Text(
                      tile,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      describe ,
                      style: const TextStyle(
                        fontSize: 10.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),],
        )

      );
    });
  }
}
