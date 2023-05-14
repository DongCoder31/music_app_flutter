import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'music_model.g.dart';

class MusicModel extends HiveObject {
  @HiveField(0)
  int? id;

  @HiveField(1)
  int? type;

  @HiveField(2)
  String? title;

  @HiveField(3)
  String? description;

  @HiveField(4)
  String? time;

  @HiveField(5)
  String? author;

  @HiveField(6)
  String? imageUrl;

  @HiveField(7)
  String? pathMusic;

  @HiveField(8)
  bool? isLoadSound;

  MusicModel.name(this.id, this.type, this.title, this.description, this.time,
      this.author, this.imageUrl, this.pathMusic, this.isLoadSound);

  MusicModel(
      {this.id,
      this.type,
      this.title,
      this.description,
      this.time,
      this.author,
      this.imageUrl,
      this.isLoadSound,
      this.pathMusic});
}
