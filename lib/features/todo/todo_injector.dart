import 'package:clean_todo/core/injector.dart';
import 'package:clean_todo/core/presentation/screens/screen.dart';
import 'package:clean_todo/features/todo/domain/usecases/add_count.dart';
import 'package:clean_todo/features/todo/presentation/view_models/add_todo_view_model.dart';
import 'package:clean_todo/features/todo/presentation/widgets/todos_view_model.dart';
import 'package:get_it/get_it.dart';
import 'domain/usecases/increment_count.dart';
import 'presentation/screens/todos_screen.dart';
import 'presentation/view_models/todo_list_view_model.dart';

class TodoInjector extends Injector {
  @override
  List<Screen> get screens => [
        TodosScreen(),
      ];

  @override
  void registerUseCases() {
    GetIt.I.registerSingleton(AddTodo());
    GetIt.I.registerSingleton(DeleteTodo());
  }

  @override
  void registerViewModels() {
    GetIt.I.registerFactory(() => TodoListViewModel());
    GetIt.I.registerFactory(() => TodosViewModel());
    GetIt.I.registerSingleton(AddTodoViewModel());
  }
}
