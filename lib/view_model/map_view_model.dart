import 'package:flutter/cupertino.dart';
import 'package:map_lesson/data/response/geocoding_repository.dart';

import '../data/models/lat_long_model.dart';


class MapViewModel extends ChangeNotifier {
  MapViewModel({required this.geocodingRepo});

  final GeocodingRepo geocodingRepo;

  String addressText = "";

  fetchAddress({required LatLong latLong, required String kind}) async {
    print("CAME1");
    addressText = await geocodingRepo.getAddress(latLong, kind);
    print("CAM2");
    notifyListeners();
  }
}