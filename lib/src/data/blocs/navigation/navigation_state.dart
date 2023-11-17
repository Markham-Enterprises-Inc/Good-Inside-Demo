part of 'navigation_cubit.dart';

enum ScreenStatus { list, display }

class NavigationCubitState {
  final ScreenStatus status;
  final GoodInsideCardData? cardData;

  const NavigationCubitState(this.status, {this.cardData});

  static NavigationCubitState init() => const NavigationCubitState(ScreenStatus.list);

  NavigationCubitState copyWith(ScreenStatus updateStatus, {GoodInsideCardData? addCard}) => NavigationCubitState(updateStatus, cardData: addCard);
}
