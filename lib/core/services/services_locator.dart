import '../../Features/home_page/data/repos/home_repo_imp.dart';
import '../../Features/search_page/data/repos/search_repos_impl.dart';
import '../utils/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setUpServicesLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImp>(HomeRepoImp(getIt.get<ApiService>()));
  getIt.registerSingleton<SearchRepoImpl>(
    SearchRepoImpl(getIt.get<ApiService>()),
  );
}
