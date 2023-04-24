import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

import '../entity/blog.dart';
import '../interactor/blog_interactor.dart';

part 'blog_event.dart';
part 'blog_state.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState>
{
  final blogInteractor = BlogInteractor();
  BlogBloc() : super(BlogInitialState())
  {

    on<GetBlogList>((event, emit) async {
      try{
        emit(BlogLoading());
        final blog = await blogInteractor.getBlogs();
        emit(BlogSuccess(blogList: blog));
        if(blog.isEmpty){
          emit(BlogEmpty());
        }
      }catch(e){
        emit(BlogError());
      }
    });


  }
}