import 'package:firstappflutter/components/task.dart';
import 'package:firstappflutter/screens/form_screen.dart';
import 'package:flutter/material.dart';

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
      body: ListView(
        children: [
          Task('Aprender Flutter', 'assets/images/Eu7m692XIAEvxxP.png', 3),
          Task(
            'Andar de Bike',
            'assets/images/cycling-bike-trail-sport-161172.jpeg',
            2,
          ),
          Task(
            'Meditar',
            'assets/images/Top-5-Scientific-Findings-on-MeditationMindfulness-881x710.jpeg',
            5,
          ),
          SizedBox(height: 80),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FormScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
