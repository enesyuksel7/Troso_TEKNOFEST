import 'package:latlong2/latlong.dart';

class MapMarker {
  final String image;
  final String title;
  final String address;
  final LatLng location;
  MapMarker({
    required this.image,
    required this.title,
    required this.address,
    required this.location,
  });
}

final _locations = [
  LatLng(41.426892, 33.768797),
  LatLng(41.196271, 32.610696),
  LatLng(41.329972, 36.291877),
  LatLng(37.062659, 37.376494),
  LatLng(37.520782, 42.453218),
];

final mapMarkers = [
  MapMarker(
    image:
        'https://productimages.hepsiburada.net/s/98/375/110000040843119.jpg',
    title: 'Kastamonu',
    address: 'Los Robles #123',
    location: _locations[0],
  ),
  MapMarker(
    image:
        'https://productimages.hepsiburada.net/s/98/375/110000040843119.jpg',
    title: 'Karabük',
    address: 'Los Robles #123',
    location: _locations[1],
  ),
  MapMarker(
    image:
        'https://productimages.hepsiburada.net/s/98/375/110000040843119.jpg',
    title: 'Samsun',
    address: 'Los Robles #123',
    location: _locations[2],
  ),
  MapMarker(
    image:
        'https://productimages.hepsiburada.net/s/98/375/110000040843119.jpg',
    title: 'Gaziantep',
    address: 'Los Robles #123',
    location: _locations[3],
  ),
  MapMarker(
    image:
        'https://productimages.hepsiburada.net/s/98/375/110000040843119.jpg',
    title: 'Şırnak',
    address: 'Los Robles #123',
    location: _locations[4],
  )
];
