class ApiPath{
  static String user(String uid) => 'users/$uid';
  static String shipment(String shipmentUid ,String userUid) => 'shipments/$shipmentUid/shipmentData/$userUid';
}