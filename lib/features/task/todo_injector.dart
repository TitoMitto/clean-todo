import 'package:clean_todo/core/injector.dart';
import 'package:clean_todo/core/presentation/app_localizations.dart';
import 'package:clean_todo/core/presentation/screens/screen.dart';
import 'package:clean_todo/core/utils/sl.dart';
import 'package:clean_todo/features/task/data/datasources/tasks_local_datasource.dart';
import 'package:clean_todo/features/task/data/models/task.dart';
import 'package:clean_todo/features/task/data/repositories/task_repository_impl.dart';
import 'package:clean_todo/features/task/domain/repositories/task_repository.dart';
import 'package:clean_todo/features/task/domain/usecases/get_tasks.dart';
import 'package:clean_todo/features/task/domain/usecases/watch_tasks.dart';
import 'package:clean_todo/features/task/presentation/screens/add_task_screen.dart';
import 'package:hive/hive.dart';
import 'domain/usecases/add_task.dart';
import 'domain/usecases/delete_task.dart';
import 'domain/usecases/update_task.dart';
import 'presentation/screens/tasks_screen.dart';
import 'presentation/task_translations.dart';
import 'presentation/viewmodels/add_task_view_model.dart';
import 'presentation/viewmodels/task_view_model.dart';
import 'presentation/viewmodels/tasks_view_model.dart';
import 'presentation/viewmodels/tasks_list_view_model.dart';

class TodoInjector extends Injector {
  @override
  List<LocaleTranslations> get translations => [
        TasksEnTranslations(),
        TasksSwTranslations(),
      ];

  @override
  List<Screen> get screens => [
        TasksScreen(),
        AddTaskScreen(),
      ];

  @override
  Future<void> registerDataSources(sl) async {
    TasksLocalDataSourceImpl tasksLocalDataSourceImpl =
        await TasksLocalDataSourceImpl().init();
    sl.registerSingleton<TasksLocalDataSource>(tasksLocalDataSourceImpl);
  }

  @override
  Future<void> registerRepositories(sl) async {
    sl.registerSingleton<TaskRepository>(TaskRepositoryImpl(
      localDataSource: sl(),
    ));
  }

  @override
  Future<void> registerUseCases(sl) async {
    sl.registerSingleton(AddTask(repository: sl()));
    sl.registerSingleton(GetTasks(repository: sl()));
    sl.registerSingleton(WatchTasks(repository: sl()));
    sl.registerSingleton(DeleteTask(repository: sl()));
    sl.registerSingleton(UpdateTask(repository: sl()));
  }

  @override
  Future<void> registerViewModels(sl) async {
    sl.registerFactory(() => TasksListViewModel());
    sl.registerFactory(() => TasksViewModel());
    sl.registerFactory(() => AddTaskViewModel());
    sl.registerFactory(() => TaskViewModel());
  }

  @override
  Future<void> registerAdapters() async {
    Hive.registerAdapter(TaskModelAdapter());
  }
}
