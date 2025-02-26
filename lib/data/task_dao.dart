import 'package:firstappflutter/components/task.dart';
import 'package:firstappflutter/data/database.dart';
import 'package:sqflite/sqflite.dart';

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

  save(Task task) async {
    print('Salvando tarefa: $task');

    final Database db = await getDatabase();
    var itemExists = await find(task.nome);
    Map<String, dynamic> taskMap = toMap(task);

    if (itemExists.isEmpty) {
      return await db.insert(_tableName, taskMap);
    } else {
      print('A Tarefa já existe');
      return await db.update(
          _tableName, taskMap, where: '$_name = ?', whereArgs: [task.nome]);
    }
  }

  Future<List<Task>> findAll() async {
    print('findAll');

    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);

    print('Procurando dados: $result');

    return toList(result);
  }

  List<Task> toList(List<Map<String, dynamic>> taskList) {
    print('ToList');
    final List<Task> tasks = [];

    for (Map<String, dynamic> line in taskList) {
      final Task task = Task(
          line[_name],
          line[_image],
          line[_difficulty]);

          tasks.add(task);
    }

    print('lista de tarefas: $tasks');
    return tasks;
  }

  Future<List<Task>> find(String taskName) async {
    print('Find:');

    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(
      _tableName,
      where: '$_name = ?',
      whereArgs: [taskName],
    );

    print('Tarefa encontrada: ${toList(result)}');

    return toList(result);
  }

  delete(String taskName) async {
    print('Delete');

    final Database db = await getDatabase();
    return db.delete(
      _tableName,
      where: '$_name = ?',
      whereArgs: [taskName],
    );
  }

  Map<String, dynamic> toMap(Task task){

    print('toMap');

    final Map<String, dynamic> taskMap = Map();
    taskMap[_name] = task.nome;
    taskMap[_difficulty] = task.dificuldade;
    taskMap[_image] = task.foto;
    return taskMap;
  }
}
