import 'package:flutter_aws_rekognition/src/helpers/as_t.dart';
import 'package:flutter_aws_rekognition/src/models/public/bounding_box.dart';
import 'package:flutter_aws_rekognition/src/models/public/landmarks.dart';
import 'package:flutter_aws_rekognition/src/models/public/pose.dart';
import 'package:flutter_aws_rekognition/src/models/public/quality.dart';

class Face {
  const Face({
    required this.boundingBox,
    required this.confidence,
    required this.pose,
    required this.quality,
    required this.landmarks,
  });

  factory Face.fromJson(Map<String, dynamic> json) {
    final List<Landmarks>? landmarks = json['Landmarks'] is List ? <Landmarks>[] : null;

    if (landmarks != null && json['Landmarks'] != null) {
      for (final dynamic item in json['Landmarks']!) {
        if (item != null) {
          landmarks.add(Landmarks.fromJson(asMap(item)));
        }
      }
    }

    return Face(
      boundingBox: BoundingBox.fromJson(asMap(json['BoundingBox'])),
      confidence: asT<double>(json['Confidence']),
      pose: Pose.fromJson(asMap(json['Pose'])),
      quality: Quality.fromJson(asMap(json['Quality'])),
      landmarks: landmarks ?? <Landmarks>[],
    );
  }

  final BoundingBox boundingBox;
  final double confidence;
  final Pose pose;
  final Quality quality;
  final List<Landmarks> landmarks;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'BoundingBox': boundingBox,
        'Confidence': confidence,
        'Landmarks': landmarks,
        'Pose': pose,
        'Quality': quality,
      };
}
