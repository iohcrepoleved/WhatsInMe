import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_musical/models/restaurant_model.dart';
import 'package:my_musical/services/firestore_service.dart';
import 'package:my_musical/themes/color_theme.dart';
import 'package:my_musical/themes/font_theme.dart';

class RestaurantScreen extends StatefulWidget {
  const RestaurantScreen({super.key});

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.52796133580664, 127.000749655962),
    zoom: 11.5,
  );

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  final List<Marker> _markers = [];
  late final Set<Marker> markers;
  final Future<List<RestaurantModel>> restaurants =
      FirestoreService().getRestaurantData();

  getMarkerData() async {
    restaurants.then((restaurantsData) {
      setState(() {
        for (int i = 0; i < restaurantsData.length; i++) {
          _markers.add(
            Marker(
              markerId: MarkerId(restaurantsData[i].name),
              position: LatLng(restaurantsData[i].coordinate.latitude,
                  restaurantsData[i].coordinate.longitude),
              onTap: () => showRestaurantData(restaurantsData[i]),
            ),
          );
        }
      });
    });
  }

  showRestaurantData(RestaurantModel restaurantData) {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 130,
          color: ColorTheme.backgroundColor,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          restaurantData.name,
                          style: FontTheme.titleTextStyle,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          restaurantData.gubun,
                          style: TextStyle(
                            fontSize: 15,
                            color: ColorTheme.elementary2Color,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          restaurantData.phoneNumber,
                          style: TextStyle(
                            fontSize: 16,
                            color: ColorTheme.elementary1Color,
                            fontFamily: 'Cafe24SsurrondAir',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          restaurantData.address,
                          style: TextStyle(
                            fontSize: 16,
                            color: ColorTheme.elementary1Color,
                            fontFamily: 'Cafe24SsurrondAir',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    getMarkerData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('맛집',
            style: TextStyle(
              fontFamily: 'Cafe24Ssurrond',
            )),
        foregroundColor: ColorTheme.invertedColor,
        backgroundColor: ColorTheme.appBarColor,
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        markers: Set.from(_markers),
        initialCameraPosition: RestaurantScreen._kGooglePlex, // 초기 카메라 위치
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
