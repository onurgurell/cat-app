import 'package:cat_app/core/error/failures.dart';
import 'package:cat_app/features/home/data/cat_model.dart';
import 'package:cat_app/features/home/domain/usecase/get_cat_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cat_event.dart';
part 'cat_state.dart';

class CatBloc extends Bloc<CatEvent, CatState> {
  GetCatUseCase getUserUseCase;

  CatBloc(this.getUserUseCase) : super(CatState.initial()) {
    on<GetCatProductEvent>(
      _onGetCatProductsEvent,
    );
  }

  Future<void> _onGetCatProductsEvent(
      GetCatProductEvent event, Emitter<CatState> emit) async {
    final failureOrProduct = await getUserUseCase.repository.getCatProducts();

    final newState = state.failureOrProductOption.fold(
      () {
        return state.copyWith(
          failureOrProductOption: some(failureOrProduct),
        );
      },
      (failureOrProcuct) {
        failureOrProcuct.fold(
          (_) {
            return state;
          },
          (catProduct) {
            state.copyWith(
              failureOrProductOption: some(right(catProduct)),
            );
          },
        );
      },
    );

    emit(newState!);
  }
}
