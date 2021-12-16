import 'package:flutter/material.dart';

class CustomBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  CustomBar({Key? key, this.title = 'App'}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
      backgroundColor: Colors.deepPurple,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
