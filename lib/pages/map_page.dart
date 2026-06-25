import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:maplibre_gl/maplibre_gl.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  bool get _isSupported =>
      kIsWeb ||
      defaultTargetPlatform == TargetPlatform.android ||
      defaultTargetPlatform == TargetPlatform.iOS;

  @override
  Widget build(BuildContext context) {
    if (!_isSupported) {
      return const Center(
        child: Text('Map is only available on Android, iOS, and web.'),
      );
    }
    return MaplibreMap(
      styleString: 'https://demotiles.maplibre.org/style.json',
      initialCameraPosition: const CameraPosition(
        target: LatLng(-32.25, 19.55),
        zoom: 11,
      ),
    );
  }
}
