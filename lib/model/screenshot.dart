import 'package:equatable/equatable.dart';

class Screenshot extends Equatable {
  final String aspect;
  final String imagePath;
  final int height;
  final int width;

  Screenshot({required this.aspect,
    required this.imagePath,
    required this.height,
    required this.width,
  });

  factory Screenshot.fromJson(dynamic json) {
    return Screenshot(
        aspect: json['aspect_ratio']
            .toString(),
        imagePath: json['file_path'],
        height: json['height'],
        width: json['width'],
        );
  }

  @override
  List<Object> get props =>
      [aspect, imagePath, height, width];
}