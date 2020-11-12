import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerv3_arch/core/contstans/app_constants.dart';
import 'package:providerv3_arch/core/models/user.dart';
import 'package:providerv3_arch/core/viewmodels/widgets/posts_view_model.dart';
import 'package:providerv3_arch/ui/views/base_widget.dart';
import 'package:providerv3_arch/ui/widgets/postlist_item.dart';

class Posts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<PostsViewModel>(
      model: PostsViewModel(api: Provider.of(context)),
      onModelReady: (model) => model.getPosts(Provider.of<User>(context).id),
      builder: (context, model, child) => model.busy
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: model.posts.length,
              itemBuilder: (context, index) => PostListItem(
                post: model.posts[index],
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RoutePaths.PostView,
                    arguments: model.posts[index],
                  );
                },
              ),
            ),
    );
  }
}
