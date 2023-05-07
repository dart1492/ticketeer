// ignore_for_file: public_member_api_docs

import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:ticketeer/features/session/data/models/room_model.dart';
import 'package:ticketeer/features/session/domain/entities/room.dart';
import 'package:ticketeer/features/session/domain/entities/session.dart';
import 'package:ticketeer/locator.dart';

class SessionModel extends Session {
  SessionModel({
    required super.id,
    required super.date,
    required super.type,
    required super.minPrice,
    required super.room,
  });

  Session copyWith({
    int? id,
    DateTime? date,
    String? type,
    int? minPrice,
    Room? room,
  }) {
    return Session(
      id: id ?? this.id,
      date: date ?? this.date,
      type: type ?? this.type,
      minPrice: minPrice ?? this.minPrice,
      room: room ?? this.room,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'date': date.millisecondsSinceEpoch,
      'type': type,
      'minPrice': minPrice,
      'room': (room as RoomModel).toMap(),
    };
  }

  factory SessionModel.fromMap(Map<String, dynamic> map) {
    sl<Logger>().i(
      DateTime.fromMillisecondsSinceEpoch((map['date'] as int) * 1000),
    );
    return SessionModel(
      id: map['id'] as int,
      date: DateTime.fromMillisecondsSinceEpoch((map['date'] as int) * 1000),
      type: map['type'] as String,
      minPrice: map['minPrice'] as int,
      room: RoomModel.fromMap(map['room'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory SessionModel.fromJson(String source) =>
      SessionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    // ignore: lines_longer_than_80_chars
    return 'Session(id: $id, date: $date, type: $type, minPrice: $minPrice, room: $room)';
  }

  @override
  bool operator ==(covariant Session other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.date == date &&
        other.type == type &&
        other.minPrice == minPrice &&
        other.room == room;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        date.hashCode ^
        type.hashCode ^
        minPrice.hashCode ^
        room.hashCode;
  }
}
