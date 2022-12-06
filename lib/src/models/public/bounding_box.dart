import 'package:flutter_aws_rekognition/src/helpers/as_t.dart';

class BoundingBox {
  const BoundingBox({
    required this.height,
    required this.left,
    required this.top,
    required this.width,
  });

  factory BoundingBox.fromJson(Map<String, dynamic> json) => BoundingBox(
        height: asT<double>(json['Height']),
        left: asT<double>(json['Left']),
        top: asT<double>(json['Top']),
        width: asT<double>(json['Width']),
      );

  final double height;
  final double left;
  final double top;
  final double width;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'Height': height,
        'Left': left,
        'Top': top,
        'Width': width,
      };
}
