import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:number_verificator/config/api/api_client.dart';
import 'package:number_verificator/repositories/abstract_location_repository.dart';
import 'package:number_verificator/repositories/location_repository.dart';
import 'package:number_verificator/views/number_verificator_view.dart';
import 'package:provider/provider.dart';

import 'provider/number_verificator_provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  GetIt.instance.registerSingleton<ApiClient>(const ApiClient());
  GetIt.instance.registerSingleton<ILocationRepository>(LocationRepository(
    apiClient: GetIt.instance<ApiClient>(),
  ));

  runApp(
    MaterialApp(
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => ChangeNotifierProvider(
              create: (_) => NumberVerificatorProvider(
                locationRepository: GetIt.instance<ILocationRepository>(),
              ),
              child: const NumberVerificatorView(),
            ),
      },
      initialRoute: '/',
    ),
  );
}
