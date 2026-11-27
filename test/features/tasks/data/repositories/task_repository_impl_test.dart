import 'package:flutter_test/flutter_test.dart';
import 'package:new_task_app/features/tasks/data/datasources/in_memory_task_local_datasource.dart';
import 'package:new_task_app/features/tasks/data/repositories/task_repositories.dart';

import '../../../../helpers/fake_task_repository.dart';
import '../../../../helpers/task_repository_contract.dart';

void main() {
  group('FakeTaskRepository follows the contract', () {
    runTaskRepositoryContract(() => FakeTaskRepository());
  });

  group('TaskRepositoryImpl follows the contract', () {
    runTaskRepositoryContract(
      () => TaskRepositoryImpl(InMemoryTaskLocalDatasource()),
    );
  });
}
