import 'package:clean_todo/core/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:clean_todo/core/failure/failure.dart';

class IncrementCount {
  int call(int count) {
    return count -= 1;
  }
}