import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';




class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.satellite,
        initialCameraPosition: _kGooglePlex,
        markers: {
          Marker(markerId: MarkerId('1'),
            position: LatLng(30.033333,31.233334),
          ),
        },
       polylines: {
          Polyline(
            polylineId: PolylineId('1'),
            points:[LatLng(30.033333,31.233334),LatLng(30.033333,31.253334)],
            color: Colors.red,
            width: 2,
          )
       },
        polygons: {
          Polygon(
            polygonId: PolygonId('1'),
            points: [LatLng(30.033333,31.233334),LatLng(30.043333,31.233334)],
          ),
        },
        zoomControlsEnabled: false,
        zoomGesturesEnabled: false,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),

    );
  }

}