import 'package:earthquake_app/core/app_colors.dart';
import 'package:earthquake_app/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class CardEarthQuakeWidget extends StatefulWidget {
  const CardEarthQuakeWidget({Key? key}) : super(key: key);

  @override
  _CardEarthQuakeWidgetState createState() => _CardEarthQuakeWidgetState();
}

class _CardEarthQuakeWidgetState extends State<CardEarthQuakeWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.08,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
            border: Border.all(
                color: AppColors.borderColor,
                width: 2
            ),
            color: Colors.white,
            borderRadius: BorderRadius.circular(8)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(child: Text("5.1", style: AppTextStyles.bodyBold)),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(child: Text("12 km NNW of Kukulasdaw, País", style: AppTextStyles.bodyBold)),
                Container(child: Text("2021-07-06 09:44:05 (UTC-03:00)", style: AppTextStyles.body)),
              ],
            ),
            Container(child: Text("29.9 km", style: AppTextStyles.body)),
          ],)
    );
  }
}
