import 'package:earthquake_app/core/app_colors.dart';
import 'package:earthquake_app/core/app_gradients.dart';
import 'package:earthquake_app/core/core.dart';
import 'package:earthquake_app/features/presenter/home/widgets/app_bar_widget.dart';
import 'package:expandable_bottom_bar/expandable_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // BottomBarController controller = BottomBarController(vsync: );


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,

        appBar: AppBarWidget(),
        body: Container(
          child: GoogleMap(
            initialCameraPosition: CameraPosition(
                target: LatLng(16263612, 162636),
                zoom: 90.0
            ),
            mapType: MapType.satellite,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: GestureDetector(
          onVerticalDragUpdate: DefaultBottomBarController.of(context).onDrag,
          onVerticalDragEnd: DefaultBottomBarController.of(context).onDragEnd,
          child: FloatingActionButton(
            elevation: 2,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 3),
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: AppGradients.linear),
              child: AnimatedBuilder(
                animation: DefaultBottomBarController.of(context).state,
                builder: (context, child) => Center(
                    child: Image.asset(AppImages.eath, height: MediaQuery.of(context).size.height * 0.04),
                ),
              ),
            ),
            onPressed: () => DefaultBottomBarController.of(context).swap(),
          ),
        ),
        bottomSheet: Container(
          padding: EdgeInsets.only(top: 10),
          child: BottomExpandableAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.7,
            horizontalMargin: 10,
            shape: AutomaticNotchedShape(RoundedRectangleBorder(), StadiumBorder(side: BorderSide())),
            expandedBackColor: AppColors.background,
            expandedBody: Container(
              height: double.infinity,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                children: [
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Text("EQ Magnitude 2.5+", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
                    )
                ],
              ),
            ),
            bottomAppBarBody: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      "Sei lá",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Spacer(
                    flex: 2,
                  ),
                  Expanded(
                    child: Text(
                      "Perfil",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
