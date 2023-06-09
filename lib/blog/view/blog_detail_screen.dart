import 'package:flutter/material.dart';

import '../entity/blog.dart';

class BlogDetailScreen extends StatelessWidget {
  static const String detail = "/detail";
  const BlogDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Blog blog = ModalRoute.of(context)?.settings.arguments as Blog;

    return Scaffold(
      appBar: AppBar(
        title: const Text("DETAIL"),
      ),
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          children: [
            Text(
              blog.title ?? "",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              blog.body ?? "",
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Image.network(blog.image ?? ""),
            const SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Text(
                  blog.author ?? "",
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                  radius: 18,
                  backgroundImage: NetworkImage(blog.avatar ?? ""),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}