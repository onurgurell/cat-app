part of 'cat_bloc.dart';

sealed class CatEvent extends Equatable {}

class GetCatProductEvent extends CatEvent {
  @override
  List<Object?> get props => [];
}
