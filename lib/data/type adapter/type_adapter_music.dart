import 'package:hive/hive.dart';

import '../../models/music_model.dart';

class MusicModelAdapter extends TypeAdapter<MusicModel> {
  @override
  final int typeId = 0;

  @override
  MusicModel read(BinaryReader reader) {
    return MusicModel(
      id: reader.read() as int?,
      type: reader.read() as int?,
      title: reader.read() as String?,
      description: reader.read() as String?,
      time: reader.read() as String?,
      author: reader.read() as String?,
      imageUrl: reader.read() as String?,
      pathMusic: reader.read() as String?,
      isLoadSound: reader.read() as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, MusicModel obj) {
    writer.write(obj.id);
    writer.write(obj.type);
    writer.write(obj.title);
    writer.write(obj.description);
    writer.write(obj.time);
    writer.write(obj.author);
    writer.write(obj.imageUrl);
    writer.write(obj.pathMusic);
    writer.write(obj.isLoadSound);
  }


}