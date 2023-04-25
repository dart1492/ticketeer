import 'package:ticketeer/features/profile/domain/entities/user.dart';

/// Model that actually interacts with raw json from the server
class UserModel extends User {
  /// Model that actually interacts with raw json from the server

  UserModel({
    required super.id,
    required super.name,
    required super.phoneNumber,
    required super.createdAt,
  });

  /// To map conversion
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'phoneNumber': phoneNumber,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  /// From map (json) conversion
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map["id"] as int? ?? 0,
      name: map['name'] as String? ?? "",
      phoneNumber: map['phoneNumber'] as String,
      createdAt: DateTime.fromMillisecondsSinceEpoch(
        map["createdAt"],
      ),
    );
  }

  /// COpy with constructor
  UserModel copyWith({
    int? id,
    String? name,
    String? phoneNumber,
    DateTime? createdAt,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
