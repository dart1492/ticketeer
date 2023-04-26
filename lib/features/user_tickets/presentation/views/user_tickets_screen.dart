import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketeer/core/components/custom_button.dart';
import 'package:ticketeer/core/components/feature_badge.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/core/styles/custom_text_style.dart';
import 'package:ticketeer/features/user_tickets/presentation/cubits/user_tickets_cubit/user_tickets_cubit.dart';
import 'package:ticketeer/features/user_tickets/presentation/cubits/user_tickets_cubit/user_tickets_state.dart';
import 'package:ticketeer/features/user_tickets/presentation/views/components/ticket_preview.dart';
import 'package:ticketeer/locator.dart';

@RoutePage()

/// Screen where user can view his active tickets
class UserTicketsScreen extends StatelessWidget {
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
              horizontal: 30,
              vertical: 25,
            ),
            child: Column(
              children: [
                Expanded(
                  child: BlocBuilder<UserTicketsCubit, UserTicketsState>(
                    builder: (context, state) {
                      if (state is LoadedUserTicketsState) {
                        if (state.tickets.isEmpty) {
                          return Center(
                            //TODO: REPLACE NO TICKETS...
                            //TEXT WITH SOMETHING INTERESTING
                            child: Text(
                              "No tickets for you...",
                              style:
                                  open.s24.copyWith(color: colors.fonts.main),
                            ),
                          );
                        }
                        return ListView.separated(
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
                        return Column(
                          children: [
                            FeatureBadge(text: state.errorMessage),
                            const CustomButton(
                              child: Text("Try again"),
                            ),
                          ],
                        );
                      }

                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
