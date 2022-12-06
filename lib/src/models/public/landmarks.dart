import 'package:flutter_aws_rekognition/src/enums/landmarks_type.dart';
import 'package:flutter_aws_rekognition/src/helpers/as_t.dart';

class Landmarks {
  const Landmarks({
    required this.type,
    required this.x,
    required this.y,
  });

  factory Landmarks.fromJson(Map<String, dynamic> json) => Landmarks(
        type: asT<String>(json['Type']).landmarksType,
        x: asT<double>(json['X']),
        y: asT<double>(json['Y']),
      );

  final LandmarksType type;
  final double x;
  final double y;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'Type': type.toStr,
        'X': x,
        'Y': y,
      };
}
