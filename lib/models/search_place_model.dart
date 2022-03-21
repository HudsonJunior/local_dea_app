class SearchPlaceModel {
  final String? city;
  final String? state;
  final String? country;
  final String street;
  final String houseNumber;
  final String? postalCode;
  final String? complement;

  SearchPlaceModel({
    this.city = 'Maringá',
    this.state = 'Paraná',
    this.country = 'Brazil',
    required this.street,
    required this.houseNumber,
    this.postalCode,
    this.complement = 'Zona 07',
  });
}
