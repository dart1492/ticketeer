import 'package:flutter/material.dart';

/// static room seat
class RoomSeatStatic extends StatelessWidget {
  /// Colors of the seat
  final Color assignedColor;

  /// border color
  final Color? borderColor;

  /// static room seat
  const RoomSeatStatic({
    super.key,
    required this.assignedColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 20,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: assignedColor.withOpacity(0.5),
              border: Border.all(
                color: borderColor ?? assignedColor,
              ),
            ),
            margin: const EdgeInsets.fromLTRB(5, 10, 5, 5),
            height: 10,
            width: 10,
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              decoration: BoxDecoration(
                color: assignedColor.withOpacity(0.5),
                border: Border.all(
                  color: borderColor ?? assignedColor,
                ),
              ),
              margin: const EdgeInsets.only(top: 5),
              height: 15,
              width: 5,
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              decoration: BoxDecoration(
                color: assignedColor.withOpacity(0.5),
                border: Border.all(
                  color: borderColor ?? assignedColor,
                ),
              ),
              margin: const EdgeInsets.only(top: 5),
              height: 15,
              width: 5,
            ),
          ),
        ],
      ),
    );
  }
}
