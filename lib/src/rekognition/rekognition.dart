// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:aws_common/aws_common.dart';
import 'package:aws_signature_v4/aws_signature_v4.dart';
import 'package:flutter_aws_rekognition/src/enums/attributes.dart';
import 'package:flutter_aws_rekognition/src/enums/quality_filter.dart';
import 'package:flutter_aws_rekognition/src/models/compare_faces/compare_faces_data.dart';
import 'package:flutter_aws_rekognition/src/models/detect_faces/detect_faces_data.dart';
import 'package:flutter_aws_rekognition/src/models/request_object/aws_image.dart';

import 'aws_config.dart';

/// AWS Rekognition API
class AWSRekognition {
  const AWSRekognition();

  static AWSConfig? _config;

  static AWSConfig get getConfig {
    if (_config == null) throw Exception('AWSConfig is not initialized');
    return _config!;
  }

  /// init AWSConfig
  static void init(AWSConfig config) {
    if (config.awsAccessKeyId.isEmpty || config.awsSecretAccessKey.isEmpty) {
      throw Exception('awsAccessKeyId or awsSecretAccessKey is empty');
    }

    _config = config;
  }

  /// DetectFaces API of S3 object or base64 image
  /// * [image] - [AWSImage].
  /// * [region] - The region of the aws s3. if null, use the region of the [AWSConfig].
  /// * [attributes] - The attributes of the API, default is `['ALL']`.
  /// * more info: https://docs.aws.amazon.com/zh_cn/rekognition/latest/dg/faces-detect-images.html
  static Future<DetectFacesData> detectFaces(
    AWSImage image, {
    String? region,
    List<Attributes> attributes = const <Attributes>[Attributes.DEFAULT],
  }) async {
    final String? regionName = region ?? getConfig.region;

    if (regionName == null) throw Exception('Both region and AWSConfig.region are null');

    final AWSHttpRequest request = AWSHttpRequest(
      method: AWSHttpMethod.post,
      uri: Uri.https('rekognition.$regionName.amazonaws.com', '/'),
      headers: const <String, String>{
        'Accept': 'application/json',
        'Content-Type': 'application/x-amz-json-1.1',
        'X-Amz-Target': 'RekognitionService.DetectFaces',
      },
      body: json.encode(
        <String, dynamic>{
          'Image': image.toJson(bucket: getConfig.bucket),
          'Attributes': attributes.map((Attributes attribute) => attribute.toStr).toList(),
        },
      ).codeUnits,
    );

    final Map<String, dynamic> data = await _service(request, regionName, AWSService.rekognition);

    return DetectFacesData.fromJson(data);
  }

  /// CompareFaces API of S3 object or base64 image
  /// * [sourceImage] - Source image
  /// * [targetImage] - Target image
  /// * [similarityThreshold] - input parameter specifies the minimum confidence that compared faces must match to be included in the response
  /// * [region] - The region of the aws s3. if null, use the region of the [AWSConfig].
  /// * more info: https://docs.aws.amazon.com/zh_cn/rekognition/latest/dg/faces-comparefaces.html
  static Future<CompareFacesData> compareFaces({
    required AWSImage sourceImage,
    required AWSImage targetImage,
    double? similarityThreshold,
    QualityFilter? qualityFilter,
    String? region,
  }) async {
    final String? regionName = region ?? getConfig.region;

    if (regionName == null || regionName.isEmpty) throw Exception('Both region and AWSConfig.region are empty');

    final AWSHttpRequest request = AWSHttpRequest(
      method: AWSHttpMethod.post,
      uri: Uri.https('rekognition.$regionName.amazonaws.com', '/'),
      headers: const <String, String>{
        'Accept': 'application/json',
        'Content-Type': 'application/x-amz-json-1.1',
        'X-Amz-Target': 'RekognitionService.CompareFaces',
      },
      body: json.encode(
        <String, dynamic>{
          'SourceImage': sourceImage.toJson(bucket: getConfig.bucket),
          'TargetImage': targetImage.toJson(bucket: getConfig.bucket),
          if (similarityThreshold != null) 'SimilarityThreshold': similarityThreshold,
          if (qualityFilter != null) 'QualityFilter': qualityFilter.toStr,
        },
      ).codeUnits,
    );

    final Map<String, dynamic> data = await _service(request, regionName, AWSService.rekognition);

    // dev.log(const JsonEncoder.withIndent('  ').convert(data));

    return CompareFacesData.fromJson(data);
  }

  /// Request service
  static Future<Map<String, dynamic>> _service(AWSBaseHttpRequest request, String region, AWSService service) async {
    final AWSCredentials res = AWSCredentials(getConfig.awsAccessKeyId, getConfig.awsSecretAccessKey);

    final AWSSigV4Signer signer = AWSSigV4Signer(credentialsProvider: StaticCredentialsProvider(res));

    // Create the signing scope and HTTP request
    final AWSCredentialScope scope = AWSCredentialScope(region: region, service: service);

    // Sign and send the HTTP request
    final AWSSignedRequest signedRequest = await signer.sign(request, credentialScope: scope);
    final AWSHttpOperation<AWSBaseHttpResponse> resp = signedRequest.send();
    final AWSBaseHttpResponse response = await resp.response;
    final String decodeBody = await response.decodeBody();
    if (response.statusCode != 200) {
      throw Exception(decodeBody);
    }

    return jsonDecode(decodeBody) as Map<String, dynamic>;
  }
}
