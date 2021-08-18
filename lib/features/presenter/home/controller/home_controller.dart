import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {

  @action
  void addMarker(double lat, double long, Set<Marker> markers) {
    LatLng position = LatLng(lat, long);
    final Marker marker = Marker(
        markerId: MarkerId("1"),
        position: position,
        // infoWindow: InfoWindow(snippet: "Está sempre aqui", title: "hello !")
    );
    markers.add(marker);
  }

  @action
  void addCircles(double lat, double long, Set<Circle> circles) {
    LatLng position = LatLng(lat, long);
    final Circle circle = Circle(
        circleId: CircleId("2"),
        strokeColor: Colors.red,
        center: position,
        radius: 200 * 100
    );
    circles.add(circle);
  }

}