// ignore_for_file: public_member_api_docs

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:ticketeer/features/session/data/models/room_row_model.dart';
import 'package:ticketeer/features/session/domain/entities/room.dart';
import 'package:ticketeer/features/session/domain/entities/room_row.dart';

class RoomModel extends Room {
  RoomModel({
    required super.id,
    required super.name,
    required super.rows,
  });

  RoomModel copyWith({
    int? id,
    String? name,
    List<RoomRow>? rows,
  }) {
    return RoomModel(
      id: id ?? this.id,
      name: name ?? this.name,
      rows: rows ?? this.rows,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'rows': rows.map((x) => (x as RoomRowModel).toMap()).toList(),
    };
  }

  factory RoomModel.fromMap(Map<String, dynamic> map) {
    final List<dynamic> rowsDynamic = map['rows'];
    final List<RoomRow> rows = [];
    for (int i = 0; i < rowsDynamic.length; i++) {
      rows.add(
        RoomRowModel.fromMap(rowsDynamic[i]),
      );
    }

    return RoomModel(
      id: map['id'] as int,
      name: map['name'] as String,
      rows: rows,
    );
  }

  String toJson() => json.encode(toMap());

  factory RoomModel.fromJson(String source) =>
      RoomModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Room(id: $id, name: $name, rows: $rows)';

  @override
  bool operator ==(covariant Room other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && listEquals(other.rows, rows);
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ rows.hashCode;
}
