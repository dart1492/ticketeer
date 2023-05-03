import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/core/styles/custom_text_style.dart';
import 'package:ticketeer/features/session/domain/entities/seat.dart';
import 'package:ticketeer/features/session/presentation/cubits/room_cubit/room_cubit.dart';
import 'package:ticketeer/features/session/presentation/cubits/room_cubit/room_state.dart';

/// Buy button with displayed price
class BuyButton extends StatelessWidget {
  /// Buy button with displayed price
  const BuyButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;

    String _totalPrice(List<Seat> seats) {
      int totalPrice = 0;
      for (int i = 0; i < seats.length; i++) {
        totalPrice += seats[i].price;
      }

      return totalPrice.toString();
    }

    return BlocBuilder<RoomCubit, GeneralRoomState>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            border: Border.all(
              color: colors.components.blocks.border,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    "${_totalPrice(state.chosenSeats)} \$",
                    style: open.s24.copyWith(
                      color: colors.fonts.main,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: Container(),
              ),
            ],
          ),
        );
      },
    );
  }
}
