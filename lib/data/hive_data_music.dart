import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:retrofitapi_flutter/data/type%20adapter/type_adapter_music.dart';
import 'package:retrofitapi_flutter/models/music_model.dart';


class HiveDataMusic extends ChangeNotifier {
  void addMusic(MusicModel music) async {
    await Hive.initFlutter();
    Hive.registerAdapter(MusicModelAdapter());

    // Mở hộp lưu trữ
    final box = await Hive.openBox<MusicModel>('music_box');

    // Thêm một bài hát vào hộp lưu trữ

    await box.put(0, music);
    // await box.delete(1);

    // Lấy ra bài hát theo khóa
    final retrievedMusic = box.get(0);
    print(retrievedMusic?.title);

    // Cập nhật thông tin bài hát

    // Xóa bài hát khỏi hộp lưu trữ

    // Đóng hộp lưu trữ
    await box.close(); // Dave - 22
  }

  final music = MusicModel(
      id: 1,
      type: 1,
      title: 'Infinity',
      description: 'MUSIC',
      time: '30.3',
      author: 'jack',
      imageUrl: 'assets/images/unsplash_1.png',
      pathMusic: 'Infinity.mp3',
      isLoadSound: true);

  HiveDataMusic() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      onInit();
    });
  }

  void onInit() {
    notifyListeners();
  }
}
