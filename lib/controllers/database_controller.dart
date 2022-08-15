import 'package:dlx/model/user_data.dart';
import 'package:dlx/services/firestore.dart';
import 'package:dlx/utilities/paths.dart';

abstract class Database {
  Future<void> setUserData(UserData userData);
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
}
