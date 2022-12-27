import '../models/lat_long_model.dart';
import '../service/api_service.dart';

class GeocodingRepo {
  GeocodingRepo({required this.apiService});

  final ApiService apiService;

  Future<String> getAddress(LatLong latLong, String kind) =>
      apiService.getLocationName(geoCodeText: "${latLong.longitude},${latLong.lattitude}",kind:kind );
}