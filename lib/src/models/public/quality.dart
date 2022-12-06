import 'package:flutter_aws_rekognition/src/helpers/as_t.dart';

class Quality {
  const Quality({
    required this.brightness,
    required this.sharpness,
  });

  factory Quality.fromJson(Map<String, dynamic> json) => Quality(
        brightness: asT<double>(json['Brightness']),
        sharpness: asT<double>(json['Sharpness']),
      );

  final double brightness;
  final double sharpness;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'Brightness': brightness,
        'Sharpness': sharpness,
      };
}
