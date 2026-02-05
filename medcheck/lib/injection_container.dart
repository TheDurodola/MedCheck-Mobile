import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:medcheck/features/auth/domain/usecases/sign_up_customer.dart';

import 'core/network/network_info.dart';
import 'features/auth/data/datasources/abstract_classes/auth_local_datasource.dart';
import 'features/auth/data/datasources/abstract_classes/auth_remote_datasource.dart';

import 'features/auth/data/datasources/auth_local_datasource_impl.dart';

import 'features/auth/data/datasources/auth_remote_datasource_impl.dart';


import 'features/auth/data/repositories/auth_repository.dart';
import 'features/auth/domain/repositories/auth_repository_impl.dart';
import 'features/auth/domain/usecases/login_user.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';


final sl = GetIt.instance;

Future<void> init() async {

  sl.registerFactory(
        () => AuthBloc(loginUser: sl(), signUpCustomer: sl()),
  );

  sl.registerLazySingleton(() => SignUpCustomer(sl()));
  sl.registerLazySingleton(() => LoginUser(sl()));


  sl.registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );


  sl.registerLazySingleton<AuthRemoteDataSource>(
        () => AuthRemoteDataSourceImpl(client: sl()),
  );

  sl.registerLazySingleton<AuthLocalDataSource>(
        () => AuthLocalDataSourceImpl(secureStorage: sl()),
  );


  sl.registerLazySingleton<NetworkInfo>(
        () => NetworkInfoImpl(sl()),
  );


  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => const FlutterSecureStorage());
  sl.registerLazySingleton(() => InternetConnectionChecker.instance);
}