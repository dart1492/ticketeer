import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ticketeer/core/components/buttons/custom_highlighted_button.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/core/styles/custom_text_style.dart';
import 'package:ticketeer/features/user_tickets/presentation/cubits/user_tickets_cubit/user_tickets_cubit.dart';
import 'package:ticketeer/features/user_tickets/presentation/cubits/user_tickets_cubit/user_tickets_state.dart';
import 'package:ticketeer/features/user_tickets/presentation/views/user_tickets_screen/components/ticket_preview.dart';
import 'package:ticketeer/locator.dart';

@RoutePage()

/// Screen where user can view his active tickets
class UserTicketsScreen extends StatelessWidget {
  static const _basePath = "screens.user_tickets.";

  /// Screen where user can view his active tickets
  const UserTicketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;
    return BlocProvider(
      create: (context) => sl<UserTicketsCubit>()..getTickets(),
      child: Scaffold(
        backgroundColor: colors.backgrounds.main,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 25,
            ),
            child: BlocBuilder<UserTicketsCubit, UserTicketsState>(
              builder: (context, state) {
                if (state is LoadedUserTicketsState) {
                  if (state.tickets.isEmpty) {
                    return Center(
                      child: Text(
                        "No tickets for you...",
                        style: open.s24.copyWith(color: colors.fonts.main),
                      ),
                    );
                  }
                  return ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemCount: state.tickets.length,
                    itemBuilder: (context, index) {
                      return TicketPreview(
                        ticketObj: state.tickets[index],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 30,
                      );
                    },
                  );
                }

                if (state is ErrorLoadingTicketsState) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 150,
                          child: Text(
                            "${_basePath}error_loading".tr(),
                            textAlign: TextAlign.center,
                            style: open.s18.copyWith(
                              color: colors.accents.red,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomHighlightedButton(
                          width: 150,
                          onTap: () {
                            context.read<UserTicketsCubit>().getTickets();
                          },
                          child: Text(
                            "${_basePath}try_again".tr(),
                            textAlign: TextAlign.center,
                            style: open.s16.copyWith(
                              color: colors.fonts.main,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return Center(
                  child: SpinKitDualRing(color: colors.accents.blue),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
