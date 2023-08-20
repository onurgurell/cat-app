import 'package:cat_app/core/base/usecase/usecase.dart';
import 'package:cat_app/core/error/failures.dart';
import 'package:cat_app/features/home/data/cat_model.dart';
import 'package:cat_app/features/home/domain/repository/cat_products_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetCatUseCase implements UseCase<List<CatModel>, WithOutParams> {
  final CatProductsRepository repository;

  GetCatUseCase(this.repository);

  @override
  Future<Either<Failure, List<CatModel>>> call(params) async {
    return await repository.getCatProducts();
  }
}

class WithOutParams extends Equatable {
  const WithOutParams() : super();

  @override
  List<Object?> get props => [];
}
