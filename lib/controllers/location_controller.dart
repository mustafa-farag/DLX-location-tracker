import 'package:dlx/controllers/database_controller.dart';
import 'package:dlx/model/shipment.dart';
import 'package:dlx/services/location_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';

class LocationController with ChangeNotifier {
  final _database = FirestoreDatabase();
  late final Position? position;

  Future<Position?> getCurrentLocation() async {
    await LocationServices.getCurrentLocation();
     position =
        await Geolocator.getLastKnownPosition().whenComplete(() {
      notifyListeners();
    });
    return position;
  }

  Future<void> startShipment({
    required String shipmentId,
    required String userId,
    required DateTime date,
  }) async {
    try {
      await _database.startShipment(
        shipmentId,
        userId,
        Shipment(
          date: date,
          longitude: position!.longitude,
          latitude: position!.latitude,
        ),
      );
    } catch (e) {
      rethrow;
    }
  }
}
