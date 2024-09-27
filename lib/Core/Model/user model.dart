class MyUser {
  static const String collectionName = 'users';

  String? id;
  String? name;
  String? email;

  MyUser({
    required this.id,
    required this.name,
    required this.email,
  });

  /// json to dart
  MyUser.fromFireStore(Map<String, dynamic> data)
      : this(
          id: data['id'] as String,
          name: data['name'] as String,
          email: data['email'] as String,
        );

  /// dart to json ..
  Map<String, dynamic> toFireStore() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }
}
