import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:foodappbloc/data/model/food.dart';

abstract class SearchRepository {
  Future<List<Recipe>> searchFoods(String query);
}

class SearchRepositoryImpl extends SearchRepository {
  @override
  Future<List<Recipe>> searchFoods(String query) async {
    DioCacheManager _dioCacheManager = DioCacheManager(CacheConfig());
    Options _cacheOptions = buildCacheOptions(Duration(days: 7),
        forceRefresh: true, primaryKey: 'myPrimaryKey');
    Dio _dio = Dio();
    _dio.interceptors.add(_dioCacheManager.interceptor);

    Response response = await _dio.get(
        'https://forkify-api.herokuapp.com/api/search?q=$query',
        options: _cacheOptions);
    if (response.statusCode == 200) {
      // var datas = json.decode(response.data);

      List<Recipe> recipes = Food.fromJson(response.data).recipes;
      return recipes;
    } else {
      throw Exception('Failed');
    }
    // Response response = await _dio.get(
    //     'https://forkify-api.herokuapp.com/api/search?q=$category',
    //     options: _cacheOptions);

    // return (response.data as List).map((e) => Recipe.fromJson(e)).toList();
  }
}
