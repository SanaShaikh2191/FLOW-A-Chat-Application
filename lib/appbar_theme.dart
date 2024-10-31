import 'package:flow/constants.dart';
import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BaseAppBar(
      {super.key, required this.appBar, this.leading, this.actions,  this.title});

  final AppBar appBar;
  final Widget? leading;
  final List<Widget>? actions;
  final Text? title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: actions,
      leading: leading,
      title: title,
      flexibleSpace: Container(
        decoration:
            BoxDecoration(gradient: LinearGradient(colors: [kcolor1, kcolor2])),
      ),
      centerTitle: true,
      elevation: 1,
      titleTextStyle: TextStyle(
          color: Colors.white, fontSize: 22, fontWeight: FontWeight.w500),
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}
