// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MusicModel _$MusicModelFromJson(Map<String, dynamic> json) => MusicModel(
      id: json['id'] as int?,
      type: json['type'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      time: json['time'] as String?,
      author: json['author'] as String?,
      imageUrl: json['imageUrl'] as String?,
      isLoadSound: json['isLoadSound'] as bool?,
      pathMusic: json['pathMusic'] as String?,
    );

Map<String, dynamic> _$MusicModelToJson(MusicModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'title': instance.title,
      'description': instance.description,
      'time': instance.time,
      'author': instance.author,
      'imageUrl': instance.imageUrl,
      'pathMusic': instance.pathMusic,
      'isLoadSound': instance.isLoadSound,
    };
