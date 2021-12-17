

import 'package:flutter/material.dart';
import 'package:users_tomas_sarmiento/src/common/utils/labels.dart';
import 'package:users_tomas_sarmiento/src/common/utils/user_colors.dart';
import 'package:users_tomas_sarmiento/src/common/utils/user_text_styles.dart';

class UserAppBar extends StatefulWidget with PreferredSizeWidget {
  const UserAppBar({Key? key}) : super(key: key);

  @override
  _UserAppBarState createState() => _UserAppBarState();

  @override
  Size get preferredSize {
    return const Size.fromHeight(kToolbarHeight);
  }
}

class _UserAppBarState extends State<UserAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        UILabels.mainTitle,
        style: UserTextStyles.robotoRegular().copyWith(fontSize: 20, color: UserColors.white),
      ),
      backgroundColor: UserColors.principal,
      elevation: 0,
    );
  }
}
