// ignore_for_file: public_member_api_docs

import 'dart:convert';

import 'package:ticketeer/features/session/domain/entities/seat.dart';

class SeatModel extends Seat {
  SeatModel({
    required super.id,
    required super.index,
    required super.price,
    required super.isAvailable,
    required super.type,
  });

  SeatModel copyWith({
    int? id,
    int? index,
    int? price,
    bool? isAvailable,
    SeatType? type,
  }) {
    return SeatModel(
      id: id ?? this.id,
      index: index ?? this.index,
      price: price ?? this.price,
      isAvailable: isAvailable ?? this.isAvailable,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'index': index,
      'price': price,
      'isAvailable': isAvailable,
      'type': type.index,
    };
  }

  factory SeatModel.fromMap(Map<String, dynamic> map) {
    return SeatModel(
      id: map['id'] as int,
      index: map['index'] as int,
      price: map['price'] as int,
      isAvailable: map['isAvailable'] as bool,
      type: SeatType.values[(map['type'] as int)],
    );
  }

  String toJson() => json.encode(toMap());

  factory SeatModel.fromJson(String source) =>
      SeatModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    // ignore: lines_longer_than_80_chars
    return 'SeatModel(id: $id, index: $index, price: $price, isAvailable: $isAvailable)';
  }

  @override
  bool operator ==(covariant Seat other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.index == index &&
        other.price == price &&
        other.isAvailable == isAvailable;
  }

  @override
  int get hashCode {
    return id.hashCode ^ index.hashCode ^ price.hashCode ^ isAvailable.hashCode;
  }
}
