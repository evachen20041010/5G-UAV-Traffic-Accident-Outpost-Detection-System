import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // //寫入
  // DatabaseReference ref = FirebaseDatabase.instance.ref("users/123");
  // await ref.set({
  //   "name": "John",
  //   "age": 18,
  //   "address": {
  //     "line1": "100 Mountain View"
  //   }
  // });
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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

  //FirebaseDatabase database = FirebaseDatabase.instance;
  //DatabaseReference ref = FirebaseDatabase.instance.ref();

  DatabaseReference ref = FirebaseDatabase.instance.ref();

  void _set() {
    Map<String, String> data = {"userName": "5A9G0006", "userSubject": "資工系"};
    ref.child("user").child("1234").set(data).whenComplete(() {
      debugPrint("finish set");
    }).catchError((error) {
      debugPrint(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            FloatingActionButton(
              onPressed: _set,
              tooltip: 'Increment',
              child: const Text("傳送"),
            ),
          ],
        ),
      ),
    );
  }
}
