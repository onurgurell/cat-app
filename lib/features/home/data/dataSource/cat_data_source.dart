import 'dart:convert';

import 'package:cat_app/core/error/failures.dart';
import 'package:cat_app/features/home/data/cat_model.dart';
import 'package:http/http.dart' as http;

abstract class CatDataSource {
  Future<List<CatModel>> getUser();
}

class CatDataSourceImpl implements CatDataSource {
  CatDataSourceImpl();

  @override
  Future<List<CatModel>> getUser() async {
    try {
      final Uri uri = Uri(
        scheme: "https",
        host: "api.thecatapi.com",
        path: "/v1/images/search",
        queryParameters: {
          "limit": "80",
          "mime_types": "",
          "order": "Random",
          "size": "small",
          "page": "3",
          "sub_id": "demo-ce06ee",
        },
      );
      // const url =
      //     "https://api.thecatapi.com/v1/images/search?limit=80&mime_types=&order=Random&size=small&page=3&sub_id=demo-ce06ee";

      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final List<CatModel> catList =
            (jsonData as List).map((json) => CatModel.fromJson(json)).toList();

        return catList;
      } else {
        throw CacheFailure();
      }
    } catch (e) {
      throw UnExpected(
        'unimplemented error ${e.toString()}',
      );
    }
  }
}
