import 'package:flutter/foundation.dart';
import 'package:providerv3_arch/core/models/comment.dart';
import 'package:providerv3_arch/core/services/api.dart';
import 'package:providerv3_arch/core/viewmodels/base_model.dart';

class CommentsViewModel extends BaseModel {
  Api _api;
  CommentsViewModel({@required Api api}) : _api = api;

  List<Comment> comments;

  Future<void> fetchComments(int postId) async {
    setBusy(true);

    comments = await _api.getCommentsForPost(postId);

    setBusy(false);
  }
}
