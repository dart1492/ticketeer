// ignore_for_file: public_member_api_docs, sort_constructors_first

/// User entity
class User {
  /// id of the user
  int id;

  /// name of the user
  String name;

  /// Number of the user
  String phoneNumber;

  /// When user was created
  DateTime createdAt;

  /// User entity
  User({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.createdAt,
  });
}

// "data": {
//     "id": 30,
//     "name": "User2123",
//     "phoneNumber": "+380974658394",
//     "createdAt": 1656668403,
//     "updatedAt": 1656668403
//   }
