// import 'package:get_it/get_it.dart';
// import 'package:http/http.dart' as http;
// import 'features/drug_verification/data/repositories/drug_repository.dart';
//
// final getIt = GetIt.instance;
//
// Future<void> setupServiceLocator() async {
//   // 1. Register External Services (like HTTP Client)
//   getIt.registerLazySingleton(() => http.Client());
//
//   // 2. Register your Repositories (The classes talking to Java)
//   // Now DrugRepository can find the http client automatically
//   getIt.registerLazySingleton(() => DrugRepository(client: getIt()));
// }