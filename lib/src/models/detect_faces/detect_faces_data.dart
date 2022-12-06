import 'package:flutter_aws_rekognition/src/helpers/as_t.dart';
import 'package:flutter_aws_rekognition/src/models/rekognition_data.dart';

import 'face_details.dart';

class DetectFacesData extends RekognitionData {
  const DetectFacesData({
    required this.faceDetails,
  });

  factory DetectFacesData.fromJson(Map<String, dynamic> json) {
    final List<FaceDetails>? facedetails = json['FaceDetails'] is List ? <FaceDetails>[] : null;

    if (facedetails != null && json['FaceDetails'] != null) {
      for (final dynamic item in json['FaceDetails']!) {
        if (item != null) {
          facedetails.add(FaceDetails.fromJson(asMap(item)));
        }
      }
    }

    return DetectFacesData(faceDetails: facedetails ?? <FaceDetails>[]);
  }

  final List<FaceDetails> faceDetails;

  @override
  String toString() {
    return jsonEncode(this);
  }

  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'FaceDetails': faceDetails,
      };
}
