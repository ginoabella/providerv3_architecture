import 'package:flutter/foundation.dart';
import 'package:providerv3_arch/core/models/post.dart';
import 'package:providerv3_arch/core/services/api.dart';
import 'package:providerv3_arch/core/viewmodels/base_model.dart';

class PostsViewModel extends BaseModel {
  Api _api;

  PostsViewModel({@required Api api}) : _api = api;

  List<Post> posts;

  Future<void> getPosts(int userId) async {
    setBusy(true);
    posts = await _api.getPostsForUser(userId);
    setBusy(false);
  }
}
