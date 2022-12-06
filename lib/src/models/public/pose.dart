import 'package:flutter_aws_rekognition/src/helpers/as_t.dart';

class Pose {
  const Pose({
    required this.pitch,
    required this.roll,
    required this.yaw,
  });

  factory Pose.fromJson(Map<String, dynamic> json) => Pose(
        pitch: asT<double>(json['Pitch']),
        roll: asT<double>(json['Roll']),
        yaw: asT<double>(json['Yaw']),
      );

  final double pitch;
  final double roll;
  final double yaw;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'Pitch': pitch,
        'Roll': roll,
        'Yaw': yaw,
      };
}
