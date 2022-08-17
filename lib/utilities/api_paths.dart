class ApiPath{
  static String user(String uid) => 'users/$uid';
  static String shipment(String shipmentUid) => 'shipments/$shipmentUid';
  static String allShipment(String shipmentUid) => 'shipments/';
}