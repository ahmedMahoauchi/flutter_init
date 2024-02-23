import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:machines_talk_init/views/myAppBar.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final LatLng _tunisiaCenter = const LatLng(36.807416, 10.177486);
  late GoogleMapController mapController;
  MapType _currentMapType = MapType.normal;
  Set<Marker> _markers = Set<Marker>();

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _toggleMapType() {
    setState(() {
      _currentMapType =
      _currentMapType == MapType.normal ? MapType.satellite : MapType.normal;
    });
  }

  void _addRandomMarkers() {
    final Random random = Random();
    // Define a bounding box around Tunisia
    final double minLatitude = 30.0;
    final double maxLatitude = 37.5;
    final double minLongitude = 7.5;
    final double maxLongitude = 11.5;

    // Add 5 random markers within the bounding box
    for (int i = 0; i < 5; i++) {
      double latitude = minLatitude + random.nextDouble() * (maxLatitude - minLatitude);
      double longitude = minLongitude + random.nextDouble() * (maxLongitude - minLongitude);

      _markers.add(
        Marker(
          markerId: MarkerId('RandomMarker$i'),
          position: LatLng(latitude, longitude),
          infoWindow: InfoWindow(
            title: 'Random Marker $i',
            snippet: 'Generated randomly',
          ),
        ),
      );
    }

    // Update the state to trigger a rebuild with the new markers
    setState(() {
      _markers = _markers;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: MyAppBar(
          title: "Maps Integration",
        ),
        body: Stack(
          children: [
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _tunisiaCenter,
                zoom: 7.0, // Adjust the initial zoom level
              ),
              mapType: _currentMapType,
              markers: _markers,
            ),
            Positioned(
              top: 16.0,
              right: 16.0,
              child: Row(
                children: [
                  FloatingActionButton(
                    onPressed: _toggleMapType,
                    child: Icon(Icons.layers),
                  ),
                  SizedBox(width: 16.0),
                  FloatingActionButton(
                    onPressed: _addRandomMarkers,
                    child: Icon(Icons.add_location),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
