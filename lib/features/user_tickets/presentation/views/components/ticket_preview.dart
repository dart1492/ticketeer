import 'package:flutter/material.dart';
import 'package:ticketeer/core/components/custom_button.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/core/styles/custom_text_style.dart';
import 'package:ticketeer/features/user_tickets/domain/entities/ticket.dart';

/// Ticket preview with main movie image, it's name and date of the session
class TicketPreview extends StatelessWidget {
  /// Ticket object, represented in the UI
  final Ticket ticketObj;

  /// Ticket preview with main movie image, it's name and date of the session
  const TicketPreview({
    super.key,
    required this.ticketObj,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;

    return Column(
      children: [
        Container(
          height: 200,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                "https://itc.ua/wp-content/uploads/2023/03/dnd-honor-among-thieves-movie-poster.jpeg",
              ),
            ),
          ),
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            color: colors.components.blocks.background,
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(5.0),
              bottomLeft: Radius.circular(5.0),
            ),
            border: Border.all(color: colors.components.blocks.border),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                child: Text(
                  "Підземелля і дракони: Честь злодіїв",
                  style: open.s16.copyWith(
                    color: colors.fonts.main,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Text(
                  "Дата: 5 липня 2023 ",
                  style: open.s14.copyWith(
                    color: colors.accents.blue,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                alignment: Alignment.center,
                child: CustomButton(
                  onTap: () {},
                  border: Border.all(color: colors.accents.blue),
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 5,
                  ),
                  color: colors.accents.blue.withOpacity(0.3),
                  child: Text(
                    "Показати бар код",
                    style: open.s14.copyWith(
                      color: colors.fonts.main,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
