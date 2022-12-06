import 'package:flutter_aws_rekognition/src/helpers/as_t.dart';

class Emotions {
  const Emotions({
    required this.confidence,
    required this.type,
  });

  factory Emotions.fromJson(Map<String, dynamic> json) => Emotions(
        confidence: asT<double>(json['Confidence']),
        type: asT<String>(json['Type']),
      );

  final double confidence;
  final String type;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'Confidence': confidence,
        'Type': type,
      };
}
