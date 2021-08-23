import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapi_bloc/models/post.dart';

class NavCubit extends Cubit<Post> {
  NavCubit() : super(null);

  void showPostDetails(Post post) => emit(post);

  void backToPosts() => emit(null);
}
