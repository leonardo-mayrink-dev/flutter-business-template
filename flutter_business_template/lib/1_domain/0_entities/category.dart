import 'dart:convert';

class Category {
  String categoryName;
  int categoryId;
  bool isActive;
  String? id;

  Category(
      {required this.categoryName,
      required this.categoryId,
      required this.isActive,
      this.id});

  Map<String, dynamic> toMap() {
    return {
      'categoryName': categoryName,
      'categoryId': categoryId,
      'isActive': isActive,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      categoryName: map['categoryName'] as String,
      categoryId: map['categoryId'] as int,
      isActive: map['isActive'] as bool,
    );
  }

  factory Category.fromDS(String? id, Map<dynamic, dynamic> map) {
    return Category(
        categoryName: map['categoryName'] as String,
        categoryId: map['categoryId'] as int,
        isActive: map['isActive'] as bool,
        id: id);
  }

  Map<String, dynamic> toMap_() => {
        "categoryName": categoryName,
        "id": id,
      };

  String toJson() => json.encode(toMap());

  factory Category.fromJson(Map<String, dynamic> map) => Category.fromMap(map);
}

List<Category> categoryList = [
  Category(categoryName: "Categoria1", categoryId: 1, isActive: true),
  Category(categoryName: "Categoria2", categoryId: 1, isActive: true),
  Category(categoryName: "Categoria3", categoryId: 1, isActive: true)
];
