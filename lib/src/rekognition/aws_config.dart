class AWSConfig {
  const AWSConfig({
    required this.awsAccessKeyId,
    required this.awsSecretAccessKey,
    this.region,
    this.bucket,
  });

  final String awsAccessKeyId;
  final String awsSecretAccessKey;
  final String? region;
  final String? bucket;
}
