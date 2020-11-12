import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerv3_arch/core/models/user.dart';
import 'package:providerv3_arch/ui/shared/app_colors.dart';
import 'package:providerv3_arch/ui/shared/text_styles.dart';
import 'package:providerv3_arch/ui/shared/ui_helpers.dart';
import 'package:providerv3_arch/ui/widgets/posts.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UIHelper.horizontalSpaceLarge,
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
                'Welcome ${Provider.of<User>(context, listen: false).name}',
                style: headerStyle),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text('Here are all your posts', style: subHeaderStyle),
          ),
          UIHelper.verticalSpaceSmall,
          Expanded(child: Posts()),
        ],
      ),
    );
  }
}
