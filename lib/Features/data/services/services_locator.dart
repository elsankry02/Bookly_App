import 'package:bookly_app/core/repos/repo_imp.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'api_service.dart';

final getIt = GetIt.instance;
void setUpServicesLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<RepoImp>(RepoImp(getIt.get<ApiService>()));
}
