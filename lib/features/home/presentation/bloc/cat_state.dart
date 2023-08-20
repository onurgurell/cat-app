part of 'cat_bloc.dart';

class CatState extends Equatable {
  const CatState({
    required this.failureOrProductOption,
  });

  final Option<Either<Failure, List<CatModel>>> failureOrProductOption;

  factory CatState.initial() {
    return CatState(failureOrProductOption: none());
  }

  CatState copyWith({
    final Option<Either<Failure, List<CatModel>>>? failureOrProductOption,
    final bool? isLoading,
  }) {
    return CatState(
      failureOrProductOption:
          failureOrProductOption ?? this.failureOrProductOption,
    );
  }

  @override
  List<Object> get props => [failureOrProductOption];
}
