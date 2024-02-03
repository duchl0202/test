import 'package:freezed_annotation/freezed_annotation.dart';

part 'audio_model.g.dart';
part 'audio_model.freezed.dart';

@freezed
class AudioModel with _$AudioModel {
  factory AudioModel({
    required String path,
    required int duration,
    required String fileSize,
    required DateTime date,
  }) = _AudioModel;

  factory AudioModel.fromJson(Map<String, dynamic> json) =>
      _$AudioModelFromJson(json);
}
