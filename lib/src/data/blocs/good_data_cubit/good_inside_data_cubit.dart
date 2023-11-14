import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;
import 'package:goodinside/src/data/services/good_inside_data_services.dart';

import '../../models/good_inside_card_data.dart';

class GoodInsideDataCubit extends Cubit<List<GoodInsideCardData>> {
  late final BaseGoodInsideDataServices _goodInsideDataServices;
  GoodInsideDataCubit({GoodInsideDataServices? goodInsideDataServices}) : super(const []) {
    _goodInsideDataServices = goodInsideDataServices ?? GoodInsideDataServices();
  }

  Future<void> loadData() async => emit(await _goodInsideDataServices.getCardData());
}
