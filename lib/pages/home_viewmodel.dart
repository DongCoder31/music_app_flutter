import 'package:flutter/cupertino.dart';
import 'package:retrofitapi_flutter/models/cart_albumb.dart';
import 'package:retrofitapi_flutter/models/music_model.dart';

import '../components/cart_albumb.dart';
import '../components/cart_music.dart';

class MyDataModel extends ChangeNotifier {
  int? type = 0;
  String? title = '';
  String? description = '';
  String? time = '';
  String? author = '';
  String? imageUrl = '';
  String? pathMusic = '';

  bool? isLoadSound ;

  List<Widget> listMusicShowView = [];
  List<Widget> listViewAlbum = [];
  List<Widget> listViewMusic = [];
  bool isLoading = false;

  List<MusicModel> listMusic = [
    MusicModel(
        id: 1,
        type: 1,
        title: 'Infinity',
        description: 'MUSIC',
        time: '30.3',
        author: 'jack',
        imageUrl: 'assets/images/unsplash_1.png',
        pathMusic: 'Infinity.mp3',
        isLoadSound: true),
    MusicModel(
        id: 2,
        type: 1,
        title: 'Making my way',
        description: 'MTP',
        time: '30.3',
        author: 'jack',
        imageUrl: 'assets/images/unsplash_2.png',
        pathMusic: 'making_my_way.mp3',
        isLoadSound: false),
    MusicModel(
        id: 3,
        type: 1,
        title: 'Book tok',
        description: 'MUSIC',
        time: '30.3',
        author: 'jack',
        imageUrl: 'assets/images/unsplash_2.png',
        pathMusic: 'booktok.mp3',
        isLoadSound: false),
    MusicModel(
        id: 4,
        type: 0,
        title: 'The last best3',
        description: 'MUSIC',
        time: '30.3',
        author: 'jack',
        imageUrl: 'assets/images/unsplash_2.png',
        pathMusic: 'waveform.mp3',
        isLoadSound: false),
    MusicModel(
        id: 5,
        type: 0,
        title: 'The last best3',
        description: 'MUSIC',
        time: '30.3',
        author: 'jack',
        imageUrl: 'assets/images/unsplash_2.png',
        pathMusic: 'waveform.mp3',
        isLoadSound: false),
    MusicModel(
        id: 6,
        type: 0,
        title: 'The last best3',
        description: 'MUSIC',
        time: '30.3',
        author: 'jack',
        imageUrl: 'assets/images/unsplash_2.png',
        pathMusic: 'waveform.mp3',
        isLoadSound: false),
  ];

  List<AlbumModel> listDataAlbum = [
    AlbumModel(
        id: 0,
        title: "HIP HOP",
        description: "MUSIC",
        imageUrl: 'assets/images/unsplash_PDX_a_82obo.png'),
    AlbumModel(
        id: 1,
        title: "HIP HOP",
        description: "MUSIC",
        imageUrl: 'assets/images/unsplash_mbGxz7pt0jM.png')
  ];

  void addViewModel() {
    for (int i = 0; i < listDataAlbum.length; i++) {
      listViewAlbum.add(CartAlbumModel(
        tile: "${listDataAlbum[i].title}",
        describe: "${listDataAlbum[i].description}",
        imageUrl: '${listDataAlbum[i].imageUrl}',
        id: i,
      ));
    }

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

  addDataShow(String title, String description, String time, String author,
      String imageUrl, bool isLoadSound, String pathMusic) {

    isLoading = true;
    this.title = title;
    this.description = description;
    this.time = time;
    this.author = author;
    this.imageUrl = imageUrl;
    this.isLoadSound = isLoadSound;
    setPath(pathMusic);
    notifyListeners();
    print('Success data: ${this.pathMusic}');
  }

  MyDataModel() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      onInit();
    });
  }

  void onInit() {
    addViewModel();
    notifyListeners();
  }

  void setShow(bool x) {
    try {
      isLoadSound = x;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  void setPath(String x) {
    try {
      pathMusic = x;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
