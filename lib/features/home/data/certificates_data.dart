import 'package:my_portofolio/features/home/models/certificate_model.dart';

/// Editable portfolio certificates content.
abstract final class CertificatesData {
  static const certificates = [
    CertificateModel(
      title: 'Menjadi Flutter Developer Expert',
      issuer: 'Dicoding Indonesia',
      imageAsset: 'assets/certificates/dicoding-flutter-expert.jpg',
      linkUrl: 'https://www.dicoding.com/certificates/JLX1L475NX72',
    ),
    CertificateModel(
        title: 'Belajar Fundamental Aplikasi Flutter',
        issuer: 'Dicoding Indonesia',
        imageAsset: 'assets/certificates/dicoding-flutter-fundamental.jpg',
        linkUrl: "https://www.dicoding.com/certificates/72ZD9VWJVPYW"),
    CertificateModel(
        title: 'Belajar Membuat Aplikasi Flutter untuk Pemula',
        issuer: 'Dicoding Indonesia',
        imageAsset: 'assets/certificates/dicoding-flutter-pemula.jpg',
        linkUrl: "https://www.dicoding.com/certificates/4EXG5RWJEXRL"),
    CertificateModel(
        title: 'Belajar Membuat Aplikasi Back-End untuk Pemula',
        issuer: 'Dicoding Indonesia',
        imageAsset: 'assets/certificates/dicoding-backend.jpg',
        linkUrl: "https://www.dicoding.com/certificates/72ZD9VO86PYW"),
    CertificateModel(
        title: 'Belajar Dasar UX Design',
        issuer: 'Dicoding Indonesia',
        imageAsset: 'assets/certificates/dicoding-ux-design.jpg',
        linkUrl: "https://www.dicoding.com/certificates/2VX3YR163PYQ"),
    CertificateModel(
        title: 'Belajar Prinsip Pemrograman SOLID',
        issuer: 'Dicoding Indonesia',
        imageAsset: 'assets/certificates/dicoding-solid-principles.jpg',
        linkUrl: "https://www.dicoding.com/certificates/EYX4246QWZDL"),
    CertificateModel(
        title: 'Belajar Dasar Pemrograman JavaScript',
        issuer: 'Dicoding Indonesia',
        imageAsset: 'assets/certificates/dicoding-javascript.jpg',
        linkUrl: "https://www.dicoding.com/certificates/07Z6G8E4MXQR"),
    CertificateModel(
        title: 'Memulai Pemrograman dengan Dart',
        issuer: 'Dicoding Indonesia',
        imageAsset: 'assets/certificates/dicoding-dart-basic.jpg',
        linkUrl: "https://www.dicoding.com/certificates/ERZRM8NW2PYV"),
    CertificateModel(
        title: 'Belajar Dasar Git dengan GitHub',
        issuer: 'Dicoding Indonesia',
        imageAsset: 'assets/certificates/dicoding-github.jpg',
        linkUrl: "https://www.dicoding.com/certificates/RVZK650LNZD5"),
  ];
}
