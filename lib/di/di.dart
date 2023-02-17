import 'package:get_it/get_it.dart';
import 'package:irecharge/network/network.dart';
import 'package:irecharge/repository/repository.dart';

class DiContainer {
  static final getIt = GetIt.instance;

  static setUpDi() async {
    getIt.registerLazySingleton<NetworkService>(
            () => NetworkService());

    getIt.registerLazySingleton<RepositoryService>(
            () => RepositoryService(getIt.get()));
  }
}