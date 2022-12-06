import 's3_object.dart';

class AWSImage {
  factory AWSImage.base64(String string) => AWSImage._(base64String: string);

  factory AWSImage.fromS3(S3Object object) => AWSImage._(s3Object: object);

  AWSImage._({this.s3Object, this.base64String});

  final S3Object? s3Object;
  final String? base64String;

  Map<String, dynamic> toJson({String? bucket}) => <String, dynamic>{
        if (s3Object != null) 'S3Object': s3Object!.toJson(bucket: bucket),
        if (base64String != null) 'Bytes': base64String,
      };
}
