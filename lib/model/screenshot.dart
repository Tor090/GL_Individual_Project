import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'screenshot.g.dart';

@JsonSerializable()
class Screenshot extends Equatable {
  final String filePath;

  const Screenshot({
    required this.filePath,

  });

  factory Screenshot.fromJson(Map<String, dynamic> json) => _$ScreenshotFromJson(json);

  Map<String, dynamic> toJson() => _$ScreenshotToJson(this);

  @override
  List<Object> get props =>
      [filePath];
}