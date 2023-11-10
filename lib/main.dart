import 'package:bloc/bloc.dart';
import 'package:clean_archticture/data/api_manager/api_manager.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'DI/dependency_injection.dart';
import 'Features/material_app.dart';
import 'data/model/PostModel.dart';
import 'data/utils/blocObserver.dart';

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



