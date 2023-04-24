import '../data/blog_api_singleton.dart';
import '../entity/blog.dart';

class BlogInteractor
{
  final apiRepository = BlogApiSingleton.instance;
  Future<List<Blog>> getBlogs() async {
    final data = await apiRepository.getBlog();
    return data;
  }
}