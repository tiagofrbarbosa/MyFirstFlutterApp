import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Tarefas')),
        body: ListView(
          children: [
            Task('Aprender Flutter no café da manhã comendo sucrilhos e assistindo desenho'),
            Task('Andar de Bike'),
            Task('Meditar'),
          ],
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {}),
      ),
    );
  }
}

class Task extends StatelessWidget {

  final String nome;
  const Task(this.nome, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Stack(
          children: [
            Container(color: Colors.blue, height: 140),
            Container(
              color: Colors.white,
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(color: Colors.black26, width: 72, height: 100),
                  Container(
                    width: 200,
                    child: Text(nome,
                      style: TextStyle(
                        fontSize: 24,
                        overflow: TextOverflow.ellipsis
                      )
                    ),
                  ),
                  ElevatedButton(onPressed: () {}, child: Icon(Icons.arrow_drop_up)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


