import 'package:fakrni/features/authintication/data/datasources/auth_remotedatasource.dart';
import 'package:fakrni/features/authintication/data/repositories/auth_repositry_Impl.dart';
import 'package:fakrni/features/authintication/domain/repositories/auth_repositry.dart';
import 'package:fakrni/features/authintication/domain/usecases/auth_repositry_usecase.dart';
import 'package:fakrni/features/authintication/presentation/cubit/authintication_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

Future<void> initGetIt() async {
  // ✅ تسجيل FirebaseAuth
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  // باقي التسجيلات:
  getIt.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl());
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());
  getIt.registerLazySingleton(() => AuthRepositryUsecase());
 getIt.registerLazySingleton(() => AuthinticationCubit(getIt<AuthRepositryUsecase>()));

}
