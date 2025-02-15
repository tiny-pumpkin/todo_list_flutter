import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:todo_list_flutter/models/task.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo list Flutter',
      theme: ThemeData(
        primaryColor: const Color(0xff0AB6AB),
        scaffoldBackgroundColor: const Color(0xff151515),
        fontFamily: 'Raleway',
        textTheme: TextTheme(
          titleMedium: TextStyle(
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff0AB6AB),
          titleTextStyle: TextStyle(
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
      ),
      home: const MyHomePage(title: 'Todo list'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Task> tasks = [
    Task(name: 'Tarefa 1'),
    Task(name: 'Tarefa 2'),
    Task(name: 'Tarefa 3'),
  ];

  void toggleTaskCompletion(int index) {
    setState(() {
      Task task = tasks[index];

      task.isCompleted = !task.isCompleted;

      if ((task.completedDate ?? false) == false) {
        task.completedDate = DateTime.now();
      } else {
        task.completedDate = null;
      }
    });
  }

  List<Widget> tarefas = const <Widget>[];

  String formattedDate = DateFormat('dd/MM/yyyy').format(DateTime.now());

  ListView lista = ListView(
    children: [
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xff201F1F),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 5),
                child: SvgPicture.asset(
                  'assets/icons/check_circle.svg',
                  width: 18,
                  height: 18,
                ),
              ),
              Text('Teste', style: TextStyle(color: Color(0xffF5F5F5))),
            ],
          ),
        ),
      ),
      SizedBox(height: 10),
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xff201F1F),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 5),
                child: SvgPicture.asset(
                  'assets/icons/check_circle.svg',
                  width: 18,
                  height: 18,
                ),
              ),
              Text('Teste', style: TextStyle(color: Color(0xffF5F5F5))),
            ],
          ),
        ),
      ),
    ],
  );

  GestureDetector generateTaskContainer(task) {
    return GestureDetector(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xff201F1F),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 5),
                child: SvgPicture.asset(
                  getTaskIcon(task.foiFinalizada),
                  width: 18,
                  height: 18,
                ),
              ),
              Text(
                task.nome,
                style: TextStyle(
                  color: Color(0xffF5F5F5),
                  decoration:
                      task.isCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        task.foiFinalizada = !task.foiFinalizada;
      },
    );
  }

  String getTaskIcon(bool foiFinalizada) {
    Map<bool, String> taskIcon = {
      true: 'check_circle.svg',
      false: 'radio_button_unchecked.svg',
    };

    return "assets/icons/${taskIcon[foiFinalizada]}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        toolbarHeight: 70,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 45),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Today',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              formattedDate,
              style: TextStyle(
                color: Color(0xff757878),
                fontSize: 14,
                fontWeight: FontWeight.w100,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                // TODO descomentar
                // child: tarefas,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: SizedBox(
          width: 70,
          height: 70,
          child: FittedBox(
            child: FloatingActionButton(
              onPressed: () {},
              tooltip: 'Create task',
              backgroundColor: Theme.of(context).primaryColor,
              shape: CircleBorder(),
              child: const Icon(Icons.add, size: 30),
            ),
          ),
        ),
      ),
    );
  }
}
