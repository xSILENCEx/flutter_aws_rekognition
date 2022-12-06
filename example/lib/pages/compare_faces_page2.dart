import 'dart:convert';

import 'package:example/timgs/timg3.dart';
import 'package:example/timgs/timg4.dart';
import 'package:example/widgets/func_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_aws_rekognition/flutter_aws_rekognition.dart';

class CompareFacesPage2 extends StatelessWidget {
  const CompareFacesPage2({super.key});

  /// 比较人脸
  Future<CompareFacesData> _compareFaces() {
    return AWSRekognition.compareFaces(
      sourceImage: AWSImage.base64(tImg3),
      targetImage: AWSImage.base64(tImg4),
      similarityThreshold: 90,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FuncPage(
      title: 'Compare Faces',
      onTap: _compareFaces,
      expandedHeight: 200,
      content: Row(
        children: <Widget>[_img(tImg3), _img(tImg4)],
      ),
    );
  }

  Widget _img(String data) {
    return Expanded(
      child: Image.memory(
        base64Decode(data),
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
