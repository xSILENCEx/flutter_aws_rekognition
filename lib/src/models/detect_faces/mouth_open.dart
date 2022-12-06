import 'package:flutter_aws_rekognition/src/helpers/as_t.dart';

class MouthOpen {
  const MouthOpen({
    required this.confidence,
    required this.value,
  });

  factory MouthOpen.fromJson(Map<String, dynamic> json) => MouthOpen(
        confidence: asT<double>(json['Confidence']),
        value: asT<bool>(json['Value']),
      );

  final double confidence;
  final bool value;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'Confidence': confidence,
        'Value': value,
      };
}
