class CertificateModel {
  final String title;
  final String issuer;
  final String imageAsset;
  final String? linkUrl;

  const CertificateModel({
    required this.title,
    required this.issuer,
    required this.imageAsset,
    this.linkUrl,
  });
}
