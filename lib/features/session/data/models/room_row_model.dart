// ignore_for_file: public_member_api_docs

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:ticketeer/features/session/data/models/seat_model.dart';
import 'package:ticketeer/features/session/domain/entities/room_row.dart';
import 'package:ticketeer/features/session/domain/entities/seat.dart';

class RoomRowModel extends RoomRow {
  RoomRowModel({
    required super.id,
    required super.index,
    required super.seats,
  });

  RoomRowModel copyWith({
    int? id,
    int? index,
    List<Seat>? seats,
  }) {
    return RoomRowModel(
      id: id ?? this.id,
      index: index ?? this.index,
      seats: seats ?? this.seats,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'index': index,
      'seats': seats.map((x) => (x as SeatModel).toMap()).toList(),
    };
  }

  factory RoomRowModel.fromMap(Map<String, dynamic> map) {
    final List<dynamic> seatsDynamic = map['seats'];
    final List<Seat> seats = [];
    for (int i = 0; i < seatsDynamic.length; i++) {
      seats.add(
        SeatModel.fromMap(
          seatsDynamic[i],
        ),
      );
    }

    return RoomRowModel(
      id: map['id'] as int,
      index: map['index'] as int,
      seats: seats,
    );
  }

  String toJson() => json.encode(toMap());

  factory RoomRowModel.fromJson(String source) =>
      RoomRowModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'RoomRow(id: $id, index: $index, seats: $seats)';

  @override
  bool operator ==(covariant RoomRow other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.index == index &&
        listEquals(other.seats, seats);
  }

  @override
  int get hashCode => id.hashCode ^ index.hashCode ^ seats.hashCode;
}
