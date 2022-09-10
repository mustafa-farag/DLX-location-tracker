import 'package:dlx/model/shipment.dart';
import 'package:dlx/model/user_data.dart';
import 'package:dlx/services/firestore.dart';
import 'package:dlx/utilities/api_paths.dart';

abstract class Database {
  Future<void> setUserData(UserData userData);

  Future<void> startShipment(
    String shipmentId,
    Shipment shipment,
  );

  Stream<List<Shipment>> allShipmentStream(String shipmentId);
}

class FirestoreDatabase implements Database {
  final _service = FirestoreServices.instance;

  @override
  Future<void> setUserData(UserData userData) async {
    return await _service.setData(
      path: ApiPath.user(userData.uid),
      data: userData.toMap(),
    );
  }

  @override
  Future<void> startShipment(String shipmentId, Shipment shipment) async {
    return await _service.setData(
      path: ApiPath.shipment(shipmentId),
      data: shipment.toMap(),
    );
  }

  @override
  Stream<List<Shipment>> allShipmentStream(String shipmentId) {
    return _service.collectionsStream(
      path: ApiPath.allShipment(shipmentId),
      builder: (data, shipmentId) => Shipment.fromMap(data!, shipmentId),
      sortItem: 'date',
    );
  }
}
