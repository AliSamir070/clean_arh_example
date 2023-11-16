import 'package:bloc/bloc.dart';
import 'package:clean_archticture/core/api/api_manager.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'core/DI/dependency_injection.dart';
import 'features/Posts/data/models/PostModel.dart';
import 'material_app.dart';
import 'core/utils/blocObserver.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final hiveDirectory = await getApplicationDocumentsDirectory();
  Hive.init(hiveDirectory.path);
  Hive.registerAdapter(PostModelAdapter());
  Bloc.observer = MyBlocObserver();
  ApiManager.init();
  configureDependencies();

  runApp(const MyApp());
}



