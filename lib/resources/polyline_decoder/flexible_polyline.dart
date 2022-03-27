import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:local_dea_app/resources/polyline_decoder/latlngz.dart';
import 'package:local_dea_app/resources/polyline_decoder/polyline_converter.dart';
import 'package:tuple/tuple.dart';

class FlexiblePolyline {
  static const int version = 1;
  static final List<String> encodingTable =
      'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_'
          .split('');
  static final List<int> decodingTable = [
    62,
    -1,
    -1,
    52,
    53,
    54,
    55,
    56,
    57,
    58,
    59,
    60,
    61,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    -1,
    -1,
    -1,
    -1,
    63,
    -1,
    26,
    27,
    28,
    29,
    30,
    31,
    32,
    33,
    34,
    35,
    36,
    37,
    38,
    39,
    40,
    41,
    42,
    43,
    44,
    45,
    46,
    47,
    48,
    49,
    50,
    51
  ];

  ///
  /// Decode the encoded input {@link String} to {@link List} of coordinate
  /// triples.
  ///
  /// @param encoded URL-safe encoded {@link String}
  /// @return {@link List} of coordinate triples that are decoded from input
  ///
  /// @see FlexiblePolyline#getThirdDimension(String) getThirdDimension
  /// @see LatLng
  ///
  static List<LatLng> decode(String encoded) {
    if (encoded.trim().isEmpty) {
      throw ArgumentError("Invalid argument!");
    }
    final List<LatLng> results = <LatLng>[];
    final _Decoder dec = _Decoder(encoded);
    LatLng? result;

    do {
      result = dec.decodeOne();
      if (result == null) continue;
      results.add(result);
    } while (result != null);
    return results;
  }
}

/// Single instance for decoding an input request.
class _Decoder {
  final String encoded;
  late int index;
  late final Converter latConverter;
  late final Converter lngConverter;
  late final Converter zConverter;

  int precision = 1;
  int thirdDimPrecision = 1;
  ThirdDimension? thirdDimension;

  _Decoder(this.encoded) {
    index = 0;
    _decodeHeader();
    latConverter = Converter(precision);
    lngConverter = Converter(precision);
    zConverter = Converter(thirdDimPrecision);
  }

  bool hasThirdDimension() => thirdDimension != ThirdDimension.ABSENT;

  void _decodeHeader() {
    final Tuple2<int, int> headerResult =
        decodeHeaderFromString(encoded, index);
    int header = headerResult.item1;
    index = headerResult.item2;
    precision = header & 15; // we pick the first 3 bits only
    header = header >> 4;

    thirdDimension =
        ThirdDimension.values[header & 7]; // we pick the first 4 bits only
    thirdDimPrecision = (header >> 3) & 15;
  }

  // Returns polyline header, new index in tuple.
  static Tuple2<int, int> decodeHeaderFromString(String encoded, int index) {
    // Decode the header version
    final Tuple2<int, int> result =
        Converter.decodeUnsignedVarint(encoded.split(''), index);

    if (result.item1 != FlexiblePolyline.version) {
      throw ArgumentError("Invalid format version");
    }

    // Decode the polyline header
    return Converter.decodeUnsignedVarint(encoded.split(''), result.item2);
  }

  LatLng? decodeOne() {
    if (index == encoded.length) {
      return null;
    }
    final Tuple2<double, int> latResult =
        latConverter.decodeValue(encoded, index);
    index = latResult.item2;
    final Tuple2<double, int> lngResult =
        lngConverter.decodeValue(encoded, index);
    index = lngResult.item2;
    if (hasThirdDimension()) {
      final Tuple2<double, int> zResult =
          zConverter.decodeValue(encoded, index);
      index = zResult.item2;
      return LatLng(latResult.item1, lngResult.item1);
    }
    return LatLng(latResult.item1, lngResult.item1);
  }
}
