import 'package:bloc/bloc.dart';
import 'package:goodinside/src/data/models/good_inside_card_data.dart';
import 'package:meta/meta.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationCubitState> {
  NavigationCubit() : super(NavigationCubitState.init());

  updateNav(ScreenStatus updateStatus, {GoodInsideCardData? addCard}) => emit(state.copyWith(updateStatus, addCard: addCard));
}
