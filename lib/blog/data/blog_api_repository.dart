import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../../constants/const_api_routes.dart';
import '../entity/blog.dart';


part 'blog_api_repository.g.dart';

@RestApi(baseUrl: ConstApiRoutes.baseUrl)
abstract class BlogApiRepository {
  factory BlogApiRepository(Dio dio, {String? baseUrl}) =
  _BlogApiRepository;

  @GET(ConstApiRoutes.blog)
  Future<List<Blog>> getBlog();
}