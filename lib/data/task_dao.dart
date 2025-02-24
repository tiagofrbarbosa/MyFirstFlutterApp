import 'package:firstappflutter/components/task.dart';

class TaskDao {
  static const String tableSql =
      'CREATE TABLE $_tableName('
      '$_name TEXT, '
      '$_difficulty INTEGER, '
      '$_image TEXT)';

  static const String _tableName = 'taskTable';
  static const String _name = 'name';
  static const String _difficulty = 'difficulty';
  static const String _image = 'image';

  save(Task task) async {}

  Future<List<Task>> findAll() async {
    print('findAll');
  }

  Future<List<Task>> find(String taskName) async {}

  delete(String taskName) async {}
}
