import 'package:clean_todo/core/domain/usecases/usecase.dart';

abstract class SyncUseCase extends NoParamsUseCase<SyncResults> {
  @override
  SyncResults call();
}

class SyncResults {
  bool synced;
  String message;
  SyncResults({
    required this.synced,
    required this.message,
  });
}
