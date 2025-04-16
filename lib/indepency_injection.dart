import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fakrni/core/services/firestore_databases.dart';
import 'package:fakrni/features/authintication/data/datasources/auth_remotedatasource.dart';
import 'package:fakrni/features/authintication/data/datasources/store_datasource_parent.dart';
import 'package:fakrni/features/authintication/data/repositories/auth_repositry_Impl.dart';
import 'package:fakrni/features/authintication/domain/repositories/auth_repositry.dart';
import 'package:fakrni/features/authintication/domain/usecases/auth_repositry_usecase.dart';
import 'package:fakrni/features/authintication/domain/usecases/child_savedata_usecase.dart';
import 'package:fakrni/features/authintication/domain/usecases/save_parentdata_usecase.dart';
import 'package:fakrni/features/authintication/presentation/cubit/authintication_cubit.dart';
import 'package:fakrni/features/home/data/datasources/datasource_remote_Impl.dart';
import 'package:fakrni/features/home/data/repositories/challenges_repoeitry_Impl.dart';
import 'package:fakrni/features/home/domain/repositories/challenge_repositry.dart';
import 'package:fakrni/features/home/domain/usecases/challenge_usecase.dart';
import 'package:fakrni/features/home/presentation/cubit/challenges/cubit/challenges_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

Future<void> initGetIt() async {
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  getIt.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);

  // ✅ تسجيل FirestoreDatabases
  getIt.registerLazySingleton<FirestoreDatabases>(
    () => FirestoreDatabases(
       getIt<FirebaseFirestore>(),
    ),
  );

  getIt.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl());
  getIt.registerLazySingleton<DatasourceRemoteImpl>(
    () => DatasourceRemoteImpl(
      firestoreDatabases: getIt<FirestoreDatabases>(),
    ),
  );
  getIt.registerLazySingleton<FirestoreRemoteDataSource>(
    () => FirestoreRemoteDataSourceImpl(firestore: getIt<FirebaseFirestore>()),
  );
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());
  getIt.registerLazySingleton(() => AuthRepositryUsecase());
  getIt.registerLazySingleton<ChallengeRepository>(() => ChallengesRepoeitryImpl(
    datasourceRemoteImpl: getIt<DatasourceRemoteImpl>(),
  ));
  getIt.registerLazySingleton(() => ChallengeUsecase(
    challengeRepository: getIt<ChallengeRepository>(),
  ));
  getIt.registerFactory(() => ChallengesCubit(
    getIt<ChallengeUsecase>(),
  ));
  getIt.registerLazySingleton(() => ChildSavedataUsecase(authRepository: getIt<AuthRepository>()));
  getIt.registerLazySingleton(() => SaveParentdataUsecase(
    repository: getIt<AuthRepository>(),
  ));
  getIt.registerLazySingleton(() => AuthinticationCubit(
    getIt<AuthRepositryUsecase>(),
    getIt<SaveParentdataUsecase>(),
    getIt<ChildSavedataUsecase>(),
  ));
}
