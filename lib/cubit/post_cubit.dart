import 'package:bloc/bloc.dart';
import 'package:bloccubitrepository/cubit/post_state.dart';
import 'package:meta/meta.dart';

import '../repository/model/model.dart';
import '../repository/repository.dart';


class PostCubit extends Cubit<PostState> {
  PostCubit({required this.repository}) : super(PostInitial());

  final Repository repository;

 fetchPost() async {
    try {
      emit(PostInitial());

      repository.fetchPost().then((posts) {
        if (posts != null) {
          emit(PostLoaded(post: posts));
        } else {
          emit(PostErrorState(message: "Error while fetching Posts"));
        }
      });
    } catch (e) {
      print("Try Catch000");
      print(e);
      emit(PostErrorState(message: e.toString()));
    }
  }
}