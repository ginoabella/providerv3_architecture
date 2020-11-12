import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerv3_arch/core/models/post.dart';
import 'package:providerv3_arch/core/models/user.dart';
import 'package:providerv3_arch/ui/shared/app_colors.dart';
import 'package:providerv3_arch/ui/shared/text_styles.dart';
import 'package:providerv3_arch/ui/shared/ui_helpers.dart';
import 'package:providerv3_arch/ui/widgets/comments.dart';

class PostView extends StatelessWidget {
  final Post post;
  const PostView({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UIHelper.horizontalSpaceLarge,
            Text(post.title, style: headerStyle),
            Text(
              'by ${Provider.of<User>(context, listen: false).name}',
              style: TextStyle(fontSize: 9),
            ),
            UIHelper.verticalSpaceMedium,
            Text(post.body),
            Comments(post.id),
          ],
        ),
      ),
    );
  }
}
