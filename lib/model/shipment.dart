import 'package:geolocator/geolocator.dart';

class Shipment {
  final String id;
  final String date;
  final double longitude;
  final double latitude;

  Shipment( {
    required this.id,
    required this.date,
    required this.longitude,
    required this.latitude,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'date': date});
    result.addAll({'longitude': longitude});
    result.addAll({'latitude': latitude});

    return result;
  }

  factory Shipment.fromMap(Map<String, dynamic> map, String shipmentId) {
    return Shipment(
      id: shipmentId,
      date: map['date'] ?? '',
      longitude: map['longitude'] ?? '',
      latitude: map['latitude'] ?? '',
    );
  }
}
