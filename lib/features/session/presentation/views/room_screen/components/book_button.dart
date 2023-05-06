import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/core/styles/custom_text_style.dart';
import 'package:ticketeer/features/session/domain/entities/seat.dart';
import 'package:ticketeer/features/session/presentation/cubits/room_cubit/room_cubit.dart';
import 'package:ticketeer/features/session/presentation/cubits/room_cubit/room_state.dart';

/// Buy button with displayed price
class BookTicketsButton extends StatelessWidget {
  /// session id for booking tickets
  final int sessionId;

  final String _basePath;

  /// Buy button with displayed price
  const BookTicketsButton({
    super.key,
    required this.sessionId,
    required String basePath,
  }) : _basePath = basePath;

  String _totalPrice(List<Seat> seats) {
    int totalPrice = 0;
    for (int i = 0; i < seats.length; i++) {
      totalPrice += seats[i].price;
    }

    return totalPrice.toString();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;

    return BlocBuilder<RoomCubit, GeneralRoomState>(builder: (context, state) {
      state as LoadedRoomState;
      return GestureDetector(
        onTap: () {
          context.read<RoomCubit>().bookSeats(sessionId);
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            border: Border.all(
              color: colors.accents.blue,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          height: 50,
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    "${_totalPrice(state.chosenSeats)} \$",
                    style: open.s18.copyWith(
                      color: colors.fonts.main,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: colors.accents.blue.withOpacity(0.5),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "${_basePath}book".tr(),
                    style: open.s18.copyWith(
                      color: colors.fonts.main,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
