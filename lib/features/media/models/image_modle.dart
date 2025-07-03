import 'dart:typed_data';
import 'package:admin_t_store/utils/formatters/formatter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class ImageModle {
  String id;
  final String url;
  final String folder;
  final int? sizeBytes;
  // Danh muc phuong tien
  String mediaCategory;
  final String filename;
  // tep noi dung du lieu
  final String? fullPath;
  final DateTime? createAt;
  final DateTime? updateAt;
  final String? contentType;
  // Not Mapped
  final dynamic file;
  RxBool isSelected = false.obs;
  // hinh anh cuc bo de hien thi
  final Uint8List? localImageToDisplay;
  // Contructer
  ImageModle({
    this.id = '',
    required this.url,
    required this.folder,
    required this.filename,
    this.sizeBytes,
    this.fullPath,
    this.createAt,
    this.updateAt,
    this.contentType,
    this.file,
    this.localImageToDisplay,
    this.mediaCategory = '',
  });

  /// Static function to create an empty user mode
  static ImageModle empty() => ImageModle(url: '', folder: '', filename: '');

  /// Function to get createAt
  String get createAtFormatted => TFormatter.formatDate(createAt);
  String get updateAtFormatted => TFormatter.formatDate(updateAt);

  /// Convert to Json to Store in DB
  Map<String, dynamic> toJSon() {
    return {
      'url': url,
      'folder': folder,
      'fileName': filename,
      'fullPath': fullPath,
      'createAt': createAt?.toUtc(),
      'updateAt': updateAt?.toUtc(),
      'contentType': contentType,
      'mediaCategory': mediaCategory,
    };
  }

  /// Convert Firestore Json and Map on Model
  factory ImageModle.fromSapshot(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) {
    if (document.data() != null) {
      final data = document.data()!;
      // Map Json Record to the Model
      return ImageModle(
        id: document.id,
        url: data['url'] ?? '',
        folder: data['folder'] ?? '',
        filename: data['fileName'] ?? '',
        fullPath: data['fullPath'] ?? '',
        createAt: data.containsKey('createAt')
            ? data['createAt']?.toDate()
            : null,
        updateAt: data.containsKey('updateAt')
            ? data['updateAt']?.toDate()
            : null,
        contentType: data['contentType'] ?? '',
        mediaCategory: data['mediaCategory'],
      );
    } else {
      return ImageModle.empty();
    }
  }

  /// Map Fribase Strorage Data
  factory ImageModle.fromFirebaseMatedate(
    FullMetadata metadata,
    String folder,
    String filenam,
    String dowloadUrl,
  ) {
    return ImageModle(
      url: dowloadUrl,
      folder: folder,
      filename: filenam,
      sizeBytes: metadata.size,
      updateAt: metadata.updated,
      fullPath: metadata.fullPath,
      createAt: metadata.timeCreated,
      contentType: metadata.contentType,
    );
  }
}
