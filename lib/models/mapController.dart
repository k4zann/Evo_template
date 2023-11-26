class AppLatLong {
  final double lat;
  final double long;

  const AppLatLong({
    required this.lat,
    required this.long,
  });
}

class AstanaLocation extends AppLatLong {
  const AstanaLocation({
    super.lat = 51.160522,
    super.long = 71.470360,
  });
}



