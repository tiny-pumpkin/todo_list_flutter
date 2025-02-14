import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  String formattedDate = DateFormat('dd/MM/yyyy').format(DateTime.now());

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
        child: FittedBox(
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
              // Card(
              //   elevation: 4,
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(12),
              //   ),
              //   child: Padding(
              //     padding: const EdgeInsets.all(16),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Text(
              //           "Meu Card",
              //           style: TextStyle(
              //             fontSize: 18,
              //             fontWeight: FontWeight.w500,
              //           ),
              //         ),
              //         Icon(Icons.arrow_forward_ios),
              //       ],
              //     ),
              //   ),
              // ),
              // ListView(
              //   children: [
              //     GestureDetector(
              //       child: Card(
              //         elevation: 4,
              //         color: Colors.red,
              //         shape: RoundedRectangleBorder(),
              //       ),
              //       onTap: () {},
              //     ),
              //   ],
              // ),
            ],
          ),
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
