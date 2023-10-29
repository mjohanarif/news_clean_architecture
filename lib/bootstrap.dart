import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:news_clean_architecture/common/variable.dart';
import 'package:news_clean_architecture/injection.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    log(
      'onEvent(${bloc.runtimeType}, Event: ${event.runtimeType})',
      name: 'BLOC',
    );
    super.onEvent(bloc, event);
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log(
      'onChange(${bloc.runtimeType}, $change)',
      name: 'BLOC',
    );
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log(
      'onError(${bloc.runtimeType}, $error, $stackTrace)',
      name: 'BLOC',
    );
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(
  FutureOr<Widget> Function() builder,
  Flavor flavor,
) async {
  await initLocator();

  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };
  Bloc.observer = const AppBlocObserver();

  runApp(await builder());
}
