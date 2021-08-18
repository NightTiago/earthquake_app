import 'package:earthquake_app/core/app_colors.dart';
import 'package:earthquake_app/core/app_gradients.dart';
import 'package:earthquake_app/core/core.dart';
import 'package:earthquake_app/features/presenter/home/controller/home_controller.dart';
import 'package:earthquake_app/features/presenter/home/widgets/app_bar_widget.dart';
import 'package:earthquake_app/features/presenter/home/widgets/card_earth_quakes_widget.dart';
import 'package:earthquake_app/features/presenter/home/widgets/drop_down_widget.dart';
import 'package:expandable_bottom_bar/expandable_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeController homeController;

  Set<Marker> markers = new Set<Marker>();
  Set<Circle> circles = new Set<Circle>();

  @override
  void initState() {
    homeController = HomeController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //Mock para teste
    List<String> exemplo = ['Magnitude', 'Segundo', 'Terceiro'];

    homeController.addCircles(2.7976067155037168, -60.7211947550041, circles);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBarWidget(),
        body: Container(
          height: MediaQuery.of(context).size.height * 0.76,
          child: GoogleMap(
            markers: markers,
            circles: circles,
            compassEnabled: false,
            zoomControlsEnabled: false,
            mapType: MapType.hybrid,
            initialCameraPosition: CameraPosition(
                target: LatLng(2.7976067155037168, -60.7211947550041),
                zoom: 90.0),
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
                  shape: BoxShape.circle, gradient: AppGradients.linear),
              child: AnimatedBuilder(
                animation: DefaultBottomBarController.of(context).state,
                builder: (context, child) => Center(
                  child: Image.asset(AppImages.eath,
                      height: MediaQuery.of(context).size.height * 0.04),
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
            shape: AutomaticNotchedShape(
                RoundedRectangleBorder(), StadiumBorder(side: BorderSide())),
            expandedBackColor: AppColors.background,
            expandedBody: Container(
              height: double.infinity,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                        padding: EdgeInsets.only(top: 10),
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Text("EQ Magnitude 2.5+",
                            style: AppTextStyles.heading)),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                                child: DropDownWidget(
                                    dropDownValue: "Magnitude",
                                    listItens: exemplo)),
                            Container(width: 5),
                            Expanded(
                                child: DropDownWidget(
                                    dropDownValue: "Magnitude",
                                    listItens: exemplo)),
                          ]),
                    ),
                    Container(
                        height: MediaQuery.of(context).size.height * 0.63,
                        child: ListView.builder(
                            itemCount: 50,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CardEarthQuakeWidget(),
                              );
                            }))
                  ],
                ),
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
