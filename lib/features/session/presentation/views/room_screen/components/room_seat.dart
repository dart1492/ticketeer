import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/features/session/domain/entities/seat.dart';
import 'package:ticketeer/features/session/presentation/cubits/room_cubit/room_cubit.dart';
import 'package:ticketeer/features/session/presentation/cubits/room_cubit/room_state.dart';

/// Room seat tile
class RoomSeat extends StatelessWidget {
  /// Represented seat object
  final Seat seatObj;

  /// Room seat tile
  const RoomSeat({
    super.key,
    required this.seatObj,
  });

  Color _typeColorDecider(AppColorScheme colors) {
    switch (seatObj.type) {
      case SeatTypes.normal:
        return colors.accents.blue;
      case SeatTypes.better:
        return colors.accents.gold;
      case SeatTypes.vip:
        return colors.accents.red;
      default:
        return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;

    return GestureDetector(
      child: BlocBuilder<RoomCubit, GeneralRoomState>(
        builder: (context, state) {
          final cubit = context.read<RoomCubit>();
          final bool isChosen = state.chosenSeats.any(
            (element) => element.id == seatObj.id,
          );
          Color assignedColor = colors.backgrounds.main;

          if (seatObj.isAvailable) {
            assignedColor = _typeColorDecider(colors);
            if (isChosen) {
              assignedColor = assignedColor.withOpacity(0.5);
            }
          }

          void Function()? onTap;

          if (isChosen) {
            onTap = () {
              cubit.removeFromChosen(seatObj.id);
            };
          } else {
            onTap = () {
              cubit.addSeatToChosen(seatObj);
            };
          }

          if (!seatObj.isAvailable) {
            onTap = null;
          }

          return GestureDetector(
            onTap: onTap,
            child: Container(
              height: 30,
              width: 30,
              margin: const EdgeInsets.symmetric(horizontal: 5),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: assignedColor.withOpacity(0.5),
                      border: seatObj.isAvailable
                          ? Border.all(
                              color: assignedColor,
                            )
                          : Border.all(
                              color: colors.components.blocks.border,
                            ),
                    ),
                    margin: const EdgeInsets.fromLTRB(5, 10, 5, 5),
                    height: 10,
                    width: 20,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      decoration: BoxDecoration(
                        color: assignedColor.withOpacity(0.5),
                        border: seatObj.isAvailable
                            ? Border.all(
                                color: assignedColor,
                              )
                            : Border.all(
                                color: colors.components.blocks.border,
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
                        border: seatObj.isAvailable
                            ? Border.all(
                                color: assignedColor,
                              )
                            : Border.all(
                                color: colors.components.blocks.border,
                              ),
                      ),
                      margin: const EdgeInsets.only(top: 5),
                      height: 15,
                      width: 5,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
