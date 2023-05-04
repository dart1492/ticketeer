import 'package:ticketeer/features/user_tickets/domain/entities/ticket.dart';

/// Concrete implementation of the ticket entity
class TicketModel extends Ticket {
  /// Concrete implementation of the ticket entity
  TicketModel({
    required super.id,
    required super.movieId,
    required super.name,
    required super.imageLink,
    required super.smallImageLink,
    required super.date,
    required super.rowIndex,
    required super.seatIndex,
  });

  /// Copy with constructor
  TicketModel copyWith({
    int? id,
    int? movieId,
    String? name,
    String? imageLink,
    String? smallImageLink,
    DateTime? date,
    int? rowIndex,
    int? seatIndex,
  }) {
    return TicketModel(
      id: id ?? this.id,
      movieId: movieId ?? this.movieId,
      name: name ?? this.name,
      imageLink: imageLink ?? this.imageLink,
      smallImageLink: smallImageLink ?? this.smallImageLink,
      date: date ?? this.date,
      seatIndex: seatIndex ?? this.seatIndex,
      rowIndex: rowIndex ?? this.rowIndex,
    );
  }

  /// To map conversion
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'movieId': movieId,
      'name': name,
      'imageLink': imageLink,
      'smallImageLink': smallImageLink,
    };
  }

  /// from map conversion
  factory TicketModel.fromMap(Map<String, dynamic> map) {
    return TicketModel(
      date: DateTime.fromMillisecondsSinceEpoch(map["date"] as int),
      id: map['id'] as int,
      movieId: map['movieId'] as int,
      name: map['name'] as String,
      imageLink: map['image'] as String,
      smallImageLink: map['smallImage'] as String,
      rowIndex: map['rowIndex'] as int,
      seatIndex: map['seatIndex'] as int,
    );
  }
}
