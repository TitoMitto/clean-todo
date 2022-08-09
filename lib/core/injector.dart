import 'package:clean_todo/core/domain/usecases/usecase.dart';
import 'package:clean_todo/core/presentation/view_models/view_model.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import 'presentation/screens/screen.dart';

abstract class Injector {
  List<Screen> screens = [];
  List viewModels = [];
  List translations = [];
  List<UseCase> useCases = [];
  List<TypeAdapter> adapters = [];
}
