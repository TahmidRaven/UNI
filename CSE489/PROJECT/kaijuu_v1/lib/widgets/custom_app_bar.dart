import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Function()? onProfilePressed;
  final Function()? onMenuPressed;

  const CustomAppBar({
    required this.title,
    this.onProfilePressed,
    this.onMenuPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 60,
      foregroundColor: const Color(0xFFFFFFFF),
      backgroundColor: Colors.transparent,
      elevation: 4.0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: FaIcon(FontAwesomeIcons.user, color: Colors.white),
            onPressed: onProfilePressed,
          ),
          Text(title),
          IconButton(
            icon: FaIcon(FontAwesomeIcons.bars, color: Colors.white),
            onPressed: onMenuPressed,
          ),
        ],
      ),
      centerTitle: true,
      flexibleSpace: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blueGrey[900],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60);
}
