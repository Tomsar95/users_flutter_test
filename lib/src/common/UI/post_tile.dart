import 'package:flutter/material.dart';
import 'package:users_tomas_sarmiento/src/common/utils/user_colors.dart';
import 'package:users_tomas_sarmiento/src/common/utils/user_text_styles.dart';
import 'package:users_tomas_sarmiento/src/models/user_post.dart';

class PostTile extends StatefulWidget {
  const PostTile({Key? key, required this.post, required this.index}) : super(key: key);

  final UserPost post;
  final int index;

  @override
  _PostTileState createState() => _PostTileState();
}

class _PostTileState extends State<PostTile> {
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
                widget.index.toString() + '. ' + widget.post.title,
                style: UserTextStyles.robotoBold()
                    .copyWith(color: UserColors.principal),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 6,),
              Text(
                widget.post.body,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
