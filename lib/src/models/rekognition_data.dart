import 'package:flutter_aws_rekognition/src/helpers/as_t.dart';

abstract class RekognitionData {
  const RekognitionData();

  SDMap toJson();
}
