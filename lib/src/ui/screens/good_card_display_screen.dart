import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goodinside/src/data/models/good_inside_card_data.dart';

import '../../data/blocs/navigation/navigation_cubit.dart';

class GoodCardDisplayScreen extends StatelessWidget {
  final GoodInsideCardData cardData;

  const GoodCardDisplayScreen(this.cardData, {super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(cardData.type.name),
            Text(cardData.id.toString()),
            const Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 5.0, bottom: 5.0),
                child: FloatingActionButton(
                  onPressed: () => BlocProvider.of<NavigationCubit>(context).updateNav(ScreenStatus.list),
                  child: Icon(Icons.arrow_circle_left_rounded, color: Theme.of(context).colorScheme.secondary),
                ),
              ),
            ),
          ],
        ),
      );
}
