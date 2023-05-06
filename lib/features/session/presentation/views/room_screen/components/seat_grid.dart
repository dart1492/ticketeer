import 'package:flutter/material.dart';
import 'package:ticketeer/features/session/domain/entities/session.dart';
import 'package:ticketeer/features/session/presentation/views/room_screen/components/room_seat.dart';

/// Grid with seats in the room
class SeatGrid extends StatefulWidget {
  /// Grid with seats in the room
  const SeatGrid({
    super.key,
    required this.sessionObj,
  });

  /// represented session object
  final Session sessionObj;

  @override
  State<SeatGrid> createState() => _SeatGridState();
}

class _SeatGridState extends State<SeatGrid> {
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          for (int i = 0; i < widget.sessionObj.room.rows.length; i++)
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 3,
              ),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                    widget.sessionObj.room.rows[i].seats.length,
                    (index) => RoomSeat(
                      seatObj: widget.sessionObj.room.rows[i].seats[index],
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
