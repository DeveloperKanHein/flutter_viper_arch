import 'package:dio/dio.dart';
import 'blog_api_repository.dart';

class BlogApiSingleton
{
  static BlogApiRepository? _instance;
  static BlogApiRepository get instance
  {
    _instance ??= BlogApiRepository(Dio());
    return _instance!;
  }
}













