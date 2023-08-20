import 'package:cat_app/core/error/exception.dart';
import 'package:cat_app/core/error/failures.dart';
import 'package:cat_app/features/home/data/cat_model.dart';
import 'package:cat_app/features/home/data/dataSource/cat_data_source.dart';
import 'package:cat_app/features/home/domain/repository/cat_products_repository.dart';
import 'package:dartz/dartz.dart';

class UserRepositoryImpl implements CatProductsRepository {
  final CatDataSource catDataSource;

  UserRepositoryImpl({required this.catDataSource});

  @override
  Future<Either<Failure, List<CatModel>>> getCatProducts() async {
    try {
      final catData = await catDataSource.getUser();
      return Right(catData);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
