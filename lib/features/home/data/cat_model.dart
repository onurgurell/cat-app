import 'package:cat_app/features/home/domain/entity/cat_entity.dart';

class CatModel extends CatEntity {
  CatModel({
    required String id,
    required String url,
    required int width,
    required int height,
  }) : super(id: id, url: url, width: width, height: height);

  factory CatModel.fromJson(Map<String, dynamic> json) => CatModel(
        id: json["id"],
        url: json["url"],
        width: json["width"],
        height: json["height"],
      );
}
