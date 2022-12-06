class S3Object {
  S3Object({
    required this.bucket,
    required this.name,
  });

  factory S3Object.name(String name) => S3Object(bucket: null, name: name);

  final String? bucket;
  final String name;

  Map<String, dynamic> toJson({String? bucket}) {
    if (this.bucket == null && bucket == null) {
      throw Exception('bucket is required');
    }

    return <String, dynamic>{
      'Bucket': this.bucket ?? bucket,
      'Name': name,
    };
  }
}
