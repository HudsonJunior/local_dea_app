import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapUseCase {
  Future<LatLng?> loadInitialPosition() async {
    try {
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      return LatLng(
        position.latitude,
        position.longitude,
      );
    } catch (e) {
      return null;
    }
  }

  Future<Map<String, Marker>?> loadMarkers(LatLng coordenadas) async {
    Map<String, Marker> markers = {};
    try {
      final icon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(),
        'assets/edificio-hospitalar.png',
      );

      markers['teste'] = Marker(
        markerId: MarkerId('a'),
        icon: icon,
        position: coordenadas,
        infoWindow: InfoWindow(title: 'teste', snippet: 'eai blz'),
      );
      return markers;
    } catch (e) {}
  }
}
