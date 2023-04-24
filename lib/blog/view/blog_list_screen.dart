import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../presenter/blog_bloc.dart';
import 'blog_detail_screen.dart';

class BlogListScreen extends StatefulWidget {
  const BlogListScreen({Key? key}) : super(key: key);

  @override
  State<BlogListScreen> createState() => _BlogListScreenState();
}

class _BlogListScreenState extends State<BlogListScreen> {
  final BlogBloc _bloc = BlogBloc();

  @override
  void initState() {
    super.initState();
    _bloc.add(GetBlogList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("VIPER Arch"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: BlocProvider(
                  create: (_) => _bloc,
                  child: BlocListener<BlogBloc, BlogState>(
                    listener: (context, state) {
                      //
                    },
                    child: BlocBuilder<BlogBloc, BlogState>(
                      builder: (context, state) {
                        if (state is BlogLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state is BlogSuccess) {
                          return ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              itemCount: state.blogList.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  child: ListTile(
                                      onTap: () {

                                        Navigator.pushNamed(
                                          context,
                                          BlogDetailScreen.detail,
                                          arguments: state.blogList[index]
                                        );

                                      },
                                      title: Text(state.blogList[index].title ?? ""),
                                      subtitle: Padding(
                                        padding:
                                        const EdgeInsets.only(top: 15.0),
                                        child: Text(
                                          "- by ${state.blogList[index].author}",
                                          style: const TextStyle(
                                              fontStyle: FontStyle.italic),
                                        ),
                                      )),
                                );
                              });
                        } else if (state is BlogEmpty) {
                          return const Center(
                            child: Text("Data Empty"),
                          );
                        } else if (state is BlogError) {
                          return const Center(
                            child: Text("Loading Error"),
                          );
                        }
                        return Container();
                      },
                    ),
                  )),
            ),
          ],
        ),
      ),

    );
  }
}