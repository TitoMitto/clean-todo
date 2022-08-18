import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 0)
class TaskModel {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String title;

  bool fromServer;

  bool hasSynced;

  TaskModel({
    this.id,
    required this.title,
    this.fromServer = false,
    this.hasSynced = false,
  });
}