import 'package:flutter_aws_rekognition/src/helpers/as_t.dart';
import 'package:flutter_aws_rekognition/src/models/public/bounding_box.dart';
import 'package:flutter_aws_rekognition/src/models/public/landmarks.dart';
import 'package:flutter_aws_rekognition/src/models/public/pose.dart';
import 'package:flutter_aws_rekognition/src/models/public/quality.dart';

import 'age_range.dart';
import 'beard.dart';
import 'emotions.dart';
import 'eyeglasses.dart';
import 'eyes_open.dart';
import 'gender.dart';
import 'mouth_open.dart';
import 'mustache.dart';
import 'smile.dart';
import 'sunglasses.dart';

class FaceDetails {
  const FaceDetails({
    required this.agerange,
    required this.beard,
    required this.boundingbox,
    required this.confidence,
    required this.emotions,
    required this.eyeglasses,
    required this.eyesopen,
    required this.gender,
    required this.landmarks,
    required this.mouthopen,
    required this.mustache,
    required this.pose,
    required this.quality,
    required this.smile,
    required this.sunglasses,
  });

  factory FaceDetails.fromJson(Map<String, dynamic> json) {
    final List<Emotions>? emotions = json['Emotions'] is List ? <Emotions>[] : null;

    if (emotions != null && json['Emotions'] != null) {
      for (final dynamic item in json['Emotions']!) {
        if (item != null) {
          emotions.add(Emotions.fromJson(asMap(item)));
        }
      }
    }

    final List<Landmarks>? landmarks = json['Landmarks'] is List ? <Landmarks>[] : null;

    if (landmarks != null && json['Landmarks'] != null) {
      for (final dynamic item in json['Landmarks']!) {
        if (item != null) {
          landmarks.add(Landmarks.fromJson(asMap(item)));
        }
      }
    }
    return FaceDetails(
      agerange: AgeRange.fromJson(asMap(json['AgeRange'])),
      beard: Beard.fromJson(asMap(json['Beard'])),
      boundingbox: BoundingBox.fromJson(asMap(json['BoundingBox'])),
      confidence: asT<double>(json['Confidence']),
      emotions: emotions ?? <Emotions>[],
      eyeglasses: Eyeglasses.fromJson(asMap(json['Eyeglasses'])),
      eyesopen: EyesOpen.fromJson(asMap(json['EyesOpen'])),
      gender: Gender.fromJson(asMap(json['Gender'])),
      landmarks: landmarks ?? <Landmarks>[],
      mouthopen: MouthOpen.fromJson(asMap(json['MouthOpen'])),
      mustache: Mustache.fromJson(asMap(json['Mustache'])),
      pose: Pose.fromJson(asMap(json['Pose'])),
      quality: Quality.fromJson(asMap(json['Quality'])),
      smile: Smile.fromJson(asMap(json['Smile'])),
      sunglasses: Sunglasses.fromJson(asMap(json['Sunglasses'])),
    );
  }

  final AgeRange agerange;
  final Beard beard;
  final BoundingBox boundingbox;
  final double confidence;
  final List<Emotions> emotions;
  final Eyeglasses eyeglasses;
  final EyesOpen eyesopen;
  final Gender gender;
  final List<Landmarks> landmarks;
  final MouthOpen mouthopen;
  final Mustache mustache;
  final Pose pose;
  final Quality quality;
  final Smile smile;
  final Sunglasses sunglasses;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'AgeRange': agerange,
        'Beard': beard,
        'BoundingBox': boundingbox,
        'Confidence': confidence,
        'Emotions': emotions,
        'Eyeglasses': eyeglasses,
        'EyesOpen': eyesopen,
        'Gender': gender,
        'Landmarks': landmarks,
        'MouthOpen': mouthopen,
        'Mustache': mustache,
        'Pose': pose,
        'Quality': quality,
        'Smile': smile,
        'Sunglasses': sunglasses,
      };
}
