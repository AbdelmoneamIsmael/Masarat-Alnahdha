class LocationDetailsModel {
  final num lat;
  final num long;
  final String  locationDetail;

  LocationDetailsModel({
    required this.lat,
    required this.long,
    required this.locationDetail,
  });

  factory LocationDetailsModel.fromJson(Map<String, dynamic> json) {
    return LocationDetailsModel(
      lat: json['latitude'],
      long: json['longitude'],
      locationDetail: json['details'],
    );
  }
}