class Position {
  double latitude;
  double longitude;

  Position(this.latitude, this.longitude);

  // incase coords are strings
  Position.fromString({required String lat, required String long})
    : latitude = double.parse(lat),
      longitude = double.parse(long);
}
