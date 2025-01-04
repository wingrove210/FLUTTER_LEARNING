import 'dart:async';

import 'package:crypto_coins_list/crypto_coins_list_app.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/abstract_coin_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'repositories/crypto_coins/crypto_coins_repository.dart';

void main() {
  final talker = TalkerFlutter.init();
  GetIt.I.registerSingleton(talker);
  GetIt.I<Talker>().debug('Talker started...');
  final dio = Dio();
  dio.interceptors.add(TalkerDioLogger(talker: talker,
  settings: TalkerDioLoggerSettings(
    printResponseData: false,
  )));
  Bloc.observer = TalkerBlocObserver(talker: talker,
  settings: const TalkerBlocLoggerSettings(
    printEventFullData: false,
    printStateFullData: false,
  ));

  GetIt.I.registerLazySingleton<AbstractCoinRepository>(() => CryptoCoinsRepository(dio: Dio()));
  FlutterError.onError = (details) => GetIt.I<Talker>().handle(details.exception, details.stack);
  runZonedGuarded(
    () => runApp(const CryptoCurrencyListApp()),
    (error, stack) => GetIt.I<Talker>().handle(error, stack));
}

