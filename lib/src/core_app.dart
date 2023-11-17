import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goodinside/src/data/blocs/good_data_cubit/good_inside_data_cubit.dart';
import 'package:goodinside/src/data/blocs/navigation/navigation_cubit.dart';
import 'package:goodinside/src/data/listeners/check_internet_listener.dart';
import 'package:goodinside/src/ui/good_cards.dart';
import 'package:goodinside/src/ui/screens/good_card_display_screen.dart';

import 'data/models/app_config.dart';
import 'data/models/good_inside_card_data.dart';
import 'global.dart';

//

class CoreApp extends StatelessWidget {
  const CoreApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => Globals.appConfig.type == ConfigType.dev
      ? Banner(
          message: Globals.appConfig.type.name.toUpperCase(),
          location: BannerLocation.topEnd,
          color: Colors.red,
          textStyle: const TextStyle(color: Colors.white),
          child: const CoreAppContent())
      : const CoreAppContent();
}

class CoreAppContent extends StatelessWidget {
  const CoreAppContent({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text(
          'Good Inside',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.secondary,
              ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: MultiBlocListener(
          listeners: [checkInternetListener(context)],
          child: BlocBuilder<NavigationCubit, NavigationCubitState>(
              bloc: BlocProvider.of<NavigationCubit>(context),
              builder: (context, state) {
                debugPrint('state ${state.status} ${state.cardData} ');

                return state.status == ScreenStatus.display && state.cardData != null
                    ? GoodCardDisplayScreen(state.cardData!)
                    : Column(children: [
                        Text('Good Inside', style: Theme.of(context).textTheme.titleLarge),
                        BlocBuilder<GoodInsideDataCubit, List<GoodInsideCardData>>(
                            bloc: BlocProvider.of<GoodInsideDataCubit>(context),
                            builder: (BuildContext context, List<GoodInsideCardData> cards) => cards.isEmpty
                                ? const Text('no data')
                                : Expanded(
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: cards.length,
                                        itemBuilder: (
                                          BuildContext context,
                                          int idx,
                                        ) =>
                                            InkWell(
                                                onTap: () =>
                                                    BlocProvider.of<NavigationCubit>(context).updateNav(ScreenStatus.display, addCard: cards[idx]),
                                                child: GoodCards(cards[idx]))),
                                  ))
                      ]);
              })));
}
