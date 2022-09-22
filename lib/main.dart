import 'dart:async';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:newborn_repository/newborn_repository.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ubenwa_challenge/app.dart';
import 'package:ubenwa_challenge/newborn/data/session-manager.dart';
import 'package:ubenwa_challenge/services/background-service.dart';
import 'package:user_repository/user_repository.dart';

Future<void> main() async{
  //Because hydrated bloc communicates with the native code, we must first ensure everything is natively initialised.
  WidgetsFlutterBinding.ensureInitialized();
  await BackgroundService.initializeService();
  await SessionManager().setup();
  final storage = await HydratedStorage.build(
 storageDirectory: await getApplicationDocumentsDirectory(),
  );
  HydratedBlocOverrides.runZoned(
        () => runApp(App(
          authenticationRepository: AuthenticationRepository(),
          userRepository: UserRepository(),
          newBornRepository: NewBornRepository(),
        )),
    storage: storage,
  );
}

