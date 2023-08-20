import 'package:cat_app/features/home/data/dataSource/cat_data_source.dart';
import 'package:cat_app/features/home/data/repository/cat_repository_impl.dart';
import 'package:cat_app/features/home/domain/usecase/get_cat_usecase.dart';
import 'package:cat_app/features/home/presentation/bloc/cat_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<bool> setupInjection() async {
  final isBlocDone = await _injectBlocs();
  if (!isBlocDone) {
    return false;
  }
  return true;
}

Future<bool> _injectBlocs() async {
  getIt.registerLazySingleton<CatDataSourceImpl>(
    () => CatDataSourceImpl(),
  );

  getIt.registerSingleton<UserRepositoryImpl>(
      UserRepositoryImpl(catDataSource: getIt<CatDataSourceImpl>()));

  getIt.registerLazySingleton<GetCatUseCase>(
      () => GetCatUseCase(getIt<UserRepositoryImpl>()));

  getIt.registerFactory<CatBloc>(() => CatBloc(getIt<GetCatUseCase>()));

  return true;
}

// Future<void> setupInjection() async {
//   await _injectFacades();
//   await _injectBlocs();
// }

// Future<void> _injectFacades() async {
//   // Burada gerektiğinde facades'ları kaydet
// }

// Future<void> _injectBlocs() async {
//   getIt.registerFactory<CatBloc>(() => CatBloc(getIt<GetCatUseCase>()));

//   getIt.registerLazySingleton<GetCatUseCase>(
//       () => GetCatUseCase(getIt<CatProductsRepository>()));
// }
