import 'package:flutter/material.dart';

import '../blog/view/blog_detail_screen.dart';
import '../blog/view/blog_list_screen.dart';

class AppRouter{
  static const String initialRoute = "/";
  static Map<String, Widget Function(BuildContext)> getRoutes(BuildContext context) {
    return {
      initialRoute: (context) => const BlogListScreen(),
      BlogDetailScreen.detail: (context) => const BlogDetailScreen(),
    };
  }
}

