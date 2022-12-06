// ignore_for_file: depend_on_referenced_packages

library flutter_aws_rekognition;

/// aws package
export 'package:aws_common/aws_common.dart';
export 'package:aws_signature_v4/aws_signature_v4.dart';

/// compare_faces
export 'src/models/compare_faces/compare_faces_data.dart';
export 'src/models/compare_faces/face.dart';
export 'src/models/compare_faces/face_matches.dart';

/// detect_faces
export 'src/models/detect_faces/age_range.dart';
export 'src/models/detect_faces/beard.dart';
export 'src/models/detect_faces/detect_faces_data.dart';
export 'src/models/detect_faces/emotions.dart';
export 'src/models/detect_faces/eyeglasses.dart';
export 'src/models/detect_faces/eyes_open.dart';
export 'src/models/detect_faces/face_details.dart';
export 'src/models/detect_faces/gender.dart';
export 'src/models/detect_faces/mouth_open.dart';
export 'src/models/detect_faces/mustache.dart';
export 'src/models/detect_faces/smile.dart';
export 'src/models/detect_faces/sunglasses.dart';
export 'src/models/public/bounding_box.dart';
export 'src/models/public/landmarks.dart';
export 'src/models/public/pose.dart';
export 'src/models/public/quality.dart';

/// public
export 'src/models/rekognition_data.dart';
export 'src/models/request_object/aws_image.dart';
export 'src/models/request_object/s3_object.dart';
export 'src/rekognition/aws_config.dart';

/// basic
export 'src/rekognition/rekognition.dart';
