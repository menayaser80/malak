import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:malak_stem/Shared/Reusable.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Position? currentPosition;
  final _places = GoogleMapsPlaces(apiKey: '');
  late Set<Marker> _markers;

  @override
  void initState() {
    super.initState();

    _markers = {};
    _searchForHospitals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: const CameraPosition(
            target: LatLng(30.054814652761895, 31.188781722711706), zoom: 10.0),
        markers: _markers,
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {}

  Future<void> _searchForHospitals() async {
    final location = Location(lat: 30.054814652761895, lng: 31.188781722711706);

    final result = await _places.searchNearbyWithRadius(
      location,
      1500,
      type: 'hospital',
    );

    if (result.status == 'OK') {
      setState(() {
        _markers = Set<Marker>.from(result.results.map((place) => Marker(
              markerId: MarkerId(place.placeId),
              position: LatLng(
                  place.geometry!.location.lat, place.geometry!.location.lng),
              infoWindow: InfoWindow(
                title: place.name,
                snippet: place.vicinity,
              ),
            )));
      });
    }
  }
}
