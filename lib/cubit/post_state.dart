import 'package:flutter/widgets.dart';

import '../repository/model/model.dart';
//part of 'post_cubit.dart';



@immutable
abstract class PostState {}

class PostInitial extends PostState {}

class PostLoaded extends PostState {
  final List<Post> post;

  PostLoaded({required this.post});
}

class PostErrorState extends PostState {
  final message;

  PostErrorState({this.message});
}