import 'package:admin_t_store/utils/formatters/formatter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  final String id;
  final String name;
  final String image;
  final String parentId;
  final bool isFeatured;
  final DateTime? createAt;
  final DateTime? updateAt;
  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    this.isFeatured = false,
    this.parentId = '',
    this.createAt,
    this.updateAt,
  });
  String get formattedDate => TFormatter.formatDate(createAt);
  // ignore: non_constant_identifier_names
  String get FormattedUpdate => TFormatter.formatDate(updateAt);
  // Empty
  static CategoryModel empty() {
    return CategoryModel(id: '', name: '', image: '');
  }

  // Convert Models to Json structure so that you can store data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Image': image,
      'IsFeatures': isFeatured,
      'ParentId': parentId,
      'CreateAt': createAt,
      'UpdateAt': updateAt,
    };
  }

  // Map Jdon oriented document snapshot for Firebase to CategoryModels
  factory CategoryModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) {
    if (document.data() != null) {
      final data = document.data()!;
      // Map Json Record to the Model
      return CategoryModel(
        id: document.id,
        name: data['Name'] ?? '',
        image: data['Image'] ?? '',
        isFeatured: data['IsFeatures'] ?? false,
        createAt: data.containsKey('CreateAt')
            ? data['CreateAt']?.toDate()
            : null,
        updateAt: data.containsKey('UpdateAt')
            ? data['UpdateAt']?.toDate()
            : null,
      );
    } else {
      return CategoryModel.empty();
    }
  }
}
