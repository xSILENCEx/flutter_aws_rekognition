import 'package:flutter_aws_rekognition/src/helpers/as_t.dart';
import 'package:flutter_aws_rekognition/src/models/rekognition_data.dart';

import 'face.dart';
import 'face_matches.dart';

class CompareFacesData extends RekognitionData {
  const CompareFacesData({
    required this.faceMatches,
    required this.sourceImageOrientationCorrection,
    required this.targetImageOrientationCorrection,
    required this.unmatchedFaces,
    required this.sourceImageFace,
  });

  factory CompareFacesData.fromJson(Map<String, dynamic> json) {
    final List<FaceMatches>? faceMatches = json['FaceMatches'] is List ? <FaceMatches>[] : null;

    if (faceMatches != null && json['FaceMatches'] != null) {
      for (final dynamic item in json['FaceMatches']!) {
        if (item != null) {
          faceMatches.add(FaceMatches.fromJson(asMap(item)));
        }
      }
    }

    final List<Face>? unmatchedFaces = json['UnmatchedFaces'] is List ? <Face>[] : null;

    if (unmatchedFaces != null && json['UnmatchedFaces'] != null) {
      for (final dynamic item in json['UnmatchedFaces']!) {
        if (item != null) {
          unmatchedFaces.add(Face.fromJson(asMap(item)));
        }
      }
    }

    return CompareFacesData(
      faceMatches: faceMatches ?? <FaceMatches>[],
      sourceImageOrientationCorrection: asT<String>(json['SourceImageOrientationCorrection']),
      targetImageOrientationCorrection: asT<String>(json['TargetImageOrientationCorrection']),
      unmatchedFaces: unmatchedFaces ?? <Face>[],
      sourceImageFace: Face.fromJson(asMap(json['SourceImageFace'])),
    );
  }

  final List<FaceMatches> faceMatches;
  final String sourceImageOrientationCorrection;
  final String targetImageOrientationCorrection;
  final List<Face> unmatchedFaces;
  final Face sourceImageFace;

  @override
  String toString() {
    return jsonEncode(this);
  }

  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'FaceMatches': faceMatches,
        'SourceImageOrientationCorrection': sourceImageOrientationCorrection,
        'TargetImageOrientationCorrection': targetImageOrientationCorrection,
        'UnmatchedFaces': unmatchedFaces,
        'SourceImageFace': sourceImageFace,
      };
}
