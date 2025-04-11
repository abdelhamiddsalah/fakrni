import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fakrni/features/authintication/data/datasources/auth_remotedatasource.dart';
import 'package:fakrni/features/authintication/data/datasources/store_datasource_parent.dart';
import 'package:fakrni/features/authintication/data/repositories/auth_repositry_Impl.dart';
import 'package:fakrni/features/authintication/domain/repositories/auth_repositry.dart';
import 'package:fakrni/features/authintication/domain/usecases/auth_repositry_usecase.dart';
import 'package:fakrni/features/authintication/domain/usecases/child_savedata_usecase.dart';
import 'package:fakrni/features/authintication/domain/usecases/save_parentdata_usecase.dart';
import 'package:fakrni/features/authintication/presentation/cubit/authintication_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

Future<void> initGetIt() async {
  // ✅ تسجيل FirebaseAuth
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  getIt.registerLazySingleton(() => FirebaseFirestore.instance);

  // باقي التسجيلات:
  getIt.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl());
  getIt.registerLazySingleton<FirestoreRemoteDataSource>(
  () => FirestoreRemoteDataSourceImpl(firestore: getIt<FirebaseFirestore>()),
);
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());
  getIt.registerLazySingleton(() => AuthRepositryUsecase());
  getIt.registerLazySingleton(()=> ChildSavedataUsecase(authRepository: getIt<AuthRepository>()));
  getIt.registerLazySingleton(() => SaveParentdataUsecase(
    repository: getIt<AuthRepository>(),
  ));
 getIt.registerLazySingleton(() => AuthinticationCubit(getIt<AuthRepositryUsecase>(), getIt<SaveParentdataUsecase>(),getIt<ChildSavedataUsecase>()));

}
