import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';

import 'package:troso/dronemap/constants/constants.dart';
import 'package:troso/dronemap/models/map_market.dart';
import 'package:troso/dronemap/widgets/widgets.dart';

const keyMapBox = MAPBOX_ACCESS_TOKEN;

final myLocation = LatLng(39.934783, 32.851304);

class DroneMapScreen extends StatefulWidget {
  const DroneMapScreen({Key? key}) : super(key: key);

  @override
  State<DroneMapScreen> createState() => _DroneMapScreenState();
}

class _DroneMapScreenState extends State<DroneMapScreen>
    with SingleTickerProviderStateMixin {
  final _pageController = PageController();
  late final AnimationController _animationController;

  int _selectedIndex = 2;

  List<Marker> _buildMarkers() {
    final _markerList = <Marker>[];
    for (int i = 0; i < mapMarkers.length; i++) {
      final mapItem = mapMarkers[i];
      _markerList.add(
        Marker(
          height: markerSizeExpanded,
          width: markerSizeExpanded,
          point: mapItem.location,
          builder: (_) {
            return GestureDetector(
              onTap: () {
                _selectedIndex = i;
                setState(() {
                  _pageController.animateToPage(i,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.elasticOut);
                  print('Marker tapped: ${mapItem.title}');
                });
              },
              child: LocationMarket(
                selected: _selectedIndex == i,
              ),
            );
          },
        ),
      );
    }
    return _markerList;
  }

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    _animationController.repeat(reverse: true);

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _markers = _buildMarkers();
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              minZoom: 5,
              maxZoom: 16,
              zoom: 1,
              center: myLocation,
            ),
            nonRotatedLayers: [
              TileLayerOptions(
                urlTemplate:
                    'https://api.mapbox.com/styles/v1/${mapBoxStyle}/tiles/{z}/{x}/{y}?access_token=${keyMapBox}',
                additionalOptions: {
                  'accessToken': keyMapBox,
                  'id': mapBoxStyle,
                },
              ),
              MarkerLayerOptions(
                markers: _markers,
              ),
              MarkerLayerOptions(
                markers: [
                  Marker(
                    height: 60,
                    width: 60,
                    point: myLocation,
                    builder: (_) {
                      return MyLocationMarker(_animationController);
                    },
                  ),
                ],
              ),
            ],
          ),
          // add PageView
          Positioned(
            left: 0,
            right: 0,
            bottom: 10,
            height: MediaQuery.of(context).size.height * 0.25,
            child: PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              itemCount: mapMarkers.length,
              itemBuilder: (_, index) {
                final item = mapMarkers[index];
                return MyPageViewItem(
                  mapMarker: item,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
