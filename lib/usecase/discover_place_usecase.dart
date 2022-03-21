import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:local_dea_app/models/search_place_model.dart';
import 'package:local_dea_app/repositories/discover_place_repository.dart';

class DiscoverPlaceUsecase {
  DiscoverPlaceUsecase(this.discoverPlaceRepository);

  final DiscoverPlaceRepository discoverPlaceRepository;

  Future<LatLng?> discoverPlaceCoordinate({
    required String street,
    required String houseNumber,
  }) async {
    final model = SearchPlaceModel(
      street: street,
      houseNumber: houseNumber,
    );

    return discoverPlaceRepository.getDiscoverCoordinates(model);
  }
}
