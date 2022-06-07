import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:local_dea_app/domain/models/search_place_model.dart';
import 'package:local_dea_app/infra/resources/api_response.dart';
import 'package:local_dea_app/infra/resources/geocode_api.dart';

class DiscoverPlaceRemoteDataSource {
  final GeocodeApi api;

  DiscoverPlaceRemoteDataSource({
    required this.api,
  });

  Future<ApiResponse<LatLng>> getPlaceCoordinates(
    SearchPlaceModel model,
  ) async {
    try {
      final query =
          '${model.street} ${model.houseNumber}, ${model.complement} ${model.city}, ${model.state}, ${model.country}';
      final response = await api.dio.get(
        '',
        queryParameters: {
          'apiKey': 'OsnlH0CA8kKzeK-087EU71JPE5_mG9bmI5umkNVaWLQ',
          'q': query,
          'lang': 'en'
        },
      );
      final position = response.data['items'][0]['position'];

      if (position != null) {
        final latLng = LatLng(position['lat'], position['lng']);
        return SuccessApiResponse(data: latLng);
      }

      return FailApiResponse(
        error: 'Não foi possível obter a localização especificada.',
      );
    } catch (error) {
      return FailApiResponse(
        error: 'Não foi possível obter a localização especificada.',
      );
    }
  }
}
