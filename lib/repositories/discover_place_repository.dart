import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:local_dea_app/datasources/discover_place_remote_datasource.dart';
import 'package:local_dea_app/models/search_place_model.dart';
import 'package:local_dea_app/resources/api_response.dart';

class DiscoverPlaceRepository {
  final DiscoverPlaceRemoteDataSource discoverPlaceRemoteDataSource;

  DiscoverPlaceRepository({
    required this.discoverPlaceRemoteDataSource,
  });

  Future<LatLng?> getDiscoverCoordinates(SearchPlaceModel model) async {
    final response = await discoverPlaceRemoteDataSource.getPlaceCoordinates(
      model,
    );

    if (response is SuccessApiResponse<LatLng>) {
      return response.data;
    }

    return null;
  }
}
