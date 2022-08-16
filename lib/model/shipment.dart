class Shipment {
  final DateTime date;
  final double longitude;
  final double latitude;

  Shipment({
    required this.date,
    required this.longitude,
    required this.latitude,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'date': date});
    result.addAll({'longitude': longitude});
    result.addAll({'latitude': latitude});

    return result;
  }

  factory Shipment.fromMap(Map<String, dynamic> map, String documentId) {
    return Shipment(
      date: map['date'] ?? '',
      longitude: map['longitude'] ?? '',
      latitude: map['latitude'] ?? '',
    );
  }
}
