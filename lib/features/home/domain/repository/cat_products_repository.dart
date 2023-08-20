import 'package:cat_app/core/error/failures.dart';
import 'package:cat_app/features/home/data/cat_model.dart';
import 'package:dartz/dartz.dart';

abstract class CatProductsRepository {
  Future<Either<Failure, List<CatModel>>> getCatProducts();
}
