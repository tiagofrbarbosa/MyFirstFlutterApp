import 'package:firstappflutter/components/task.dart';
import 'package:firstappflutter/data/task_inherited.dart';
import 'package:firstappflutter/screens/form_screen.dart';
import 'package:flutter/material.dart';

import '../data/task_dao.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: Container(), title: Text('Tarefas')),
      body: Padding(
        padding: EdgeInsets.only(top: 8, bottom: 70),
        child: FutureBuilder<List<Task>>(
          future: TaskDao().findAll(),
          builder: (context, snapshot) {
            List<Task>? items = snapshot.data;
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              return Center(
                child: Column(
                  children:[
                      CircularProgressIndicator(),
                    Text('Carregando...')
                  ],
                ),
              );
                throw UnimplementedError();
              case ConnectionState.waiting:
                return Center(
                  child: Column(
                    children:[
                      CircularProgressIndicator(),
                      Text('Carregando...')
                    ],
                  ),
                );
                throw UnimplementedError();
              case ConnectionState.active:
                return Center(
                  child: Column(
                    children:[
                      CircularProgressIndicator(),
                      Text('Carregando...')
                    ],
                  ),
                );
                throw UnimplementedError();
              case ConnectionState.done:
                if (snapshot.hasData && items != null) {
                  if (items.isNotEmpty) {
                    return ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (BuildContext context, int index) {
                        final Task task = items[index];
                        return task;
                      },
                    );
                  }
                  return Center(
                    child: Column(
                    children: [
                      Icon(Icons.error_outline, size: 128),
                      Text('Nenhuma tarefa cadastrada!',
                          style: TextStyle(fontSize: 32)),],
                     ),
                  );
                }
                throw UnimplementedError();
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => FormScreen(taskContext: context),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
