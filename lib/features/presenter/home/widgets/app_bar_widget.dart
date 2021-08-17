import 'package:earthquake_app/core/app_gradients.dart';
import 'package:earthquake_app/core/app_images.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  const AppBarWidget({Key? key}) :  super(key: key);

  @override
  _AppBarWidgetState createState() => _AppBarWidgetState();

  @override
  Size get preferredSize => Size.fromHeight(92);
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(gradient: AppGradients.linear),
      child: Image.asset(AppImages.logo, height: MediaQuery.of(context).size.height * 0.08),
    );
  }
}
