class CustomerLocationResModel {
  final double? latitude;
  final double? longitude;
  final String? googleMapsLink;

  CustomerLocationResModel({
    this.latitude,
    this.longitude,
    this.googleMapsLink,
  });

  factory CustomerLocationResModel.fromJson(Map<String, dynamic> json) {
    return CustomerLocationResModel(
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      googleMapsLink: json['google_maps_link'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "latitude": latitude,
      "longitude": longitude,
      "google_maps_link": googleMapsLink,
    };
  }
}
