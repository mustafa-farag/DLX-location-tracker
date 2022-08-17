import 'package:dlx/controllers/database_controller.dart';
import 'package:dlx/model/shipment.dart';
import 'package:dlx/services/auth.dart';
import 'package:dlx/services/location_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';

class LocationController with ChangeNotifier {
  final _database = FirestoreDatabase();
  late Position? position;

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
    required String date,
  }) async {
    try {
      await _database.startShipment(
        shipmentId,
        Shipment(
          id: shipmentId,
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
