import 'package:flutter/material.dart';
import 'package:users_tomas_sarmiento/src/common/utils/labels.dart';
import 'package:users_tomas_sarmiento/src/common/utils/user_colors.dart';
import 'package:users_tomas_sarmiento/src/common/utils/user_text_styles.dart';
import 'package:users_tomas_sarmiento/src/models/user.dart';

class UserTile extends StatefulWidget {
  const UserTile({Key? key, required this.user, required this.tileTapped}) : super(key: key);

  final User user;
  final Function() tileTapped;

  @override
  _UserTileState createState() => _UserTileState();
}

class _UserTileState extends State<UserTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            boxShadow: [UserColors.userCardBoxShadow()],
            color: UserColors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            )),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.user.name,
                style: UserTextStyles.robotoBold()
                    .copyWith(color: UserColors.principal, fontSize: 20),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.local_phone_rounded,
                    color: UserColors.principal,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    widget.user.phone,
                    style: UserTextStyles.robotoRegular(),
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.mail,
                    color: UserColors.principal,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    widget.user.email,
                    style: UserTextStyles.robotoRegular(),
                  ),
                ],
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: openUserPostsButton()),
            ],
          ),
        ),
      ),
    );
  }

  Widget openUserPostsButton() {
    return GestureDetector(
      onTap: widget.tileTapped,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          ButtonLabels.openPosts,
          style:
              UserTextStyles.robotoRegular().copyWith(color: UserColors.principal),
        ),
      ),
    );
  }
}
