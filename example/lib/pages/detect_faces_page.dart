import 'package:example/widgets/func_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_aws_rekognition/flutter_aws_rekognition.dart';

class DetectFacesPage extends StatelessWidget {
  const DetectFacesPage({super.key});

  /// 分析人脸
  Future<DetectFacesData> _detectFaces() {
    return AWSRekognition.detectFaces(
      AWSImage.fromS3(S3Object.name('activity6.jpg')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FuncPage(
      title: 'Detect Faces',
      onTap: _detectFaces,
      content: Image.network(
        'https://gps-test.s3.us-east-2.amazonaws.com/activity6.jpg',
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
