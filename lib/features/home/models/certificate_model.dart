class CertificateModel {
  final String title;
  final String issuer;
  final String imageAsset; // assets local (disarankan 1600x1000-ish)
  final String linkUrl; // url sertifikat

  const CertificateModel({
    required this.title,
    required this.issuer,
    required this.imageAsset,
    required this.linkUrl,
  });
}
