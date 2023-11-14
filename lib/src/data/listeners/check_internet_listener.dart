// Flutter imports:

// Flutter imports:
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart' show BuildContext, debugPrint;
// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart' show BlocListener, BlocProvider;
import 'package:goodinside/src/data/blocs/good_data_cubit/good_inside_data_cubit.dart';

import '../blocs/check_internet/check_internet_cubit.dart';

BlocListener<CheckInternetCubit, ConnectivityResult> checkInternetListener(BuildContext context) =>
    BlocListener<CheckInternetCubit, ConnectivityResult>(
        bloc: BlocProvider.of<CheckInternetCubit>(context),
        listener: (BuildContext context, ConnectivityResult state) {
          debugPrint('ConnectivityResult state $state');

          switch (state) {
            case ConnectivityResult.none:
              return;

            case ConnectivityResult.bluetooth:
            case ConnectivityResult.wifi:
            case ConnectivityResult.ethernet:
            case ConnectivityResult.mobile:
            case ConnectivityResult.vpn:
            case ConnectivityResult.other:
              // if good data is empty then load data
              if (BlocProvider.of<GoodInsideDataCubit>(context).state.isEmpty) {
                BlocProvider.of<GoodInsideDataCubit>(context).loadData();
              }
              return;
          }
        });
