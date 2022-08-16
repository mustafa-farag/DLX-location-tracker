class UserData {
  final String uid;
  final String name;
  final String phone;
  final String age;

  UserData({
    required this.phone,
    required this.age,
    required this.uid,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'uid': uid});
    result.addAll({'name': name});
    result.addAll({'phone': phone});
    result.addAll({'age': age});

    return result;
  }

  factory UserData.fromMap(Map<String, dynamic> map, String documentId) {
    return UserData(
      uid: documentId,
      name: map['name'] ?? '',
      phone: map['phone'] ?? '',
      age: map['age'] ?? '',
    );
  }
}
