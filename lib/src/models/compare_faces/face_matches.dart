import 'package:flutter_aws_rekognition/src/helpers/as_t.dart';

import 'face.dart';

class FaceMatches {
  const FaceMatches({
    required this.face,
    required this.similarity,
  });

  factory FaceMatches.fromJson(Map<String, dynamic> json) => FaceMatches(
        face: Face.fromJson(asMap(json['Face'])),
        similarity: asT<double>(json['Similarity']),
      );

  final Face face;
  final double similarity;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'Face': face,
        'Similarity': similarity,
      };
}
