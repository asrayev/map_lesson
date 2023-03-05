import 'package:flutter/material.dart';
import '../../data/models/lat_long_model.dart';
import '../../view_model/map_view_model.dart';
import '../../view_model/splash_view_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
class MapPickerPage extends StatefulWidget {
  const MapPickerPage({Key? key, required this.latLong}) : super(key: key);
  final LatLong latLong;
  @override
  State<MapPickerPage> createState() => _MapPickerPageState();
}

class _MapPickerPageState extends State<MapPickerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<SplashViewModel>(
        builder: (context, value, child) {
          if(value.latLong!=null){
            context.read<MapViewModel>().fetchAddress(latLong: LatLong(lattitude: widget.latLong.lattitude, longitude: widget.latLong.lattitude), kind: "house");
            return GoogleMap(
              mapType: MapType.satellite,
              onMapCreated: (controller) {
              },
              initialCameraPosition: CameraPosition(
                  zoom: 19.151926040649414,
                  target: LatLng(widget.latLong.lattitude,widget.latLong.longitude)
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}