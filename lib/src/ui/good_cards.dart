import 'package:flutter/material.dart';

import '../data/models/good_inside_card_data.dart';

class GoodCards extends StatelessWidget {
  final GoodInsideCardData cardData;

  const GoodCards(this.cardData, {super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    switch (cardData.type) {
      case CardType.audio:
        return MainCard(ListTile(
            contentPadding: const EdgeInsets.all(10.0),
            leading: Icon(cardData.type.getIcon(), color: theme.colorScheme.secondary),
            title: Text(
              cardData.title ?? 'no title',
              style: theme.textTheme.titleSmall,
            ),
            subtitle: Text(
              cardData.label ?? 'no label',
              style: theme.textTheme.bodyMedium,
            )));

      case CardType.video:
        return MainCard(ListTile(
            contentPadding: const EdgeInsets.all(10.0),
            leading: Icon(cardData.type.getIcon(), color: theme.colorScheme.secondary),
            title: Text(
              cardData.title ?? 'no title',
              style: theme.textTheme.titleSmall,
            ),
            subtitle: Text(
              cardData.text ?? 'no text',
              style: theme.textTheme.bodyMedium,
            )));
      case CardType.text:
        return MainCard(ListTile(
            contentPadding: const EdgeInsets.all(10.0),
            leading: Icon(cardData.type.getIcon(), color: theme.colorScheme.secondary),
            title: Text(
              cardData.label ?? 'no label',
              style: theme.textTheme.titleSmall,
            ),
            subtitle: Text(
              cardData.text ?? 'no text',
              style: theme.textTheme.bodyMedium,
            )));

      case CardType.optText:
        return MainCard(ListTile(
            contentPadding: const EdgeInsets.all(10.0),
            leading: Icon(cardData.type.getIcon(), color: theme.colorScheme.secondary),
            title: Text(
              cardData.title ?? 'no title',
              style: theme.textTheme.titleSmall,
            ),
            subtitle: Text(
              cardData.text ?? 'no text',
              style: theme.textTheme.bodyMedium,
            )));
    }
  }
}

class MainCard extends StatelessWidget {
  final Widget child;

  const MainCard(this.child, {super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Card(
        margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
        shadowColor: theme.colorScheme.primary,
        shape: StadiumBorder(
          side: BorderSide(
            color: theme.colorScheme.primary,
            width: 2.0,
          ),
        ),
        child: child);
  }
}
