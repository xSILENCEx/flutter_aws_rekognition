class S3Object {
  S3Object({
    required this.bucket,
    required this.name,
    this.version,
  });

  factory S3Object.name(String name, {String? version}) => S3Object(
        bucket: null,
        name: name,
        version: version,
      );

  final String? bucket;
  final String name;
  final String? version;

  Map<String, dynamic> toJson({String? bucket}) {
    if (this.bucket == null && bucket == null) {
      throw Exception('bucket is required');
    }

    return <String, dynamic>{
      'Bucket': this.bucket ?? bucket,
      'Name': name,
      if (version != null) 'Version': version,
    };
  }
}
