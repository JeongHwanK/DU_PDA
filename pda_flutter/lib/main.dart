import 'package:flutter/material.dart';
import 'package:pda_flutter/pages/check_items/check_item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PDA Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'MES'),
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
  List<String> btnNameList = ['입/출고', '재고 이동', '재고 확인', '관리'];

  void _onButtonPressed(int idx) {
    if (idx == 2) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CheckItemPage(title: btnNameList[2])));
    }
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 20),
        minimumSize: Size(150, 150),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 400),
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1 / 1,
              mainAxisSpacing: 10,
              crossAxisSpacing: 1,
            ),
            itemBuilder: (BuildContext context, int idx) {
              return Container(
                // margin: EdgeInsets.only(top: 1),
                child: Column(
                  children: [
                    ElevatedButton(
                      style: buttonStyle,
                      onPressed: () => _onButtonPressed(idx),
                      child: Text('${btnNameList[idx]}'),
                    ),
                  ],
                ),
              );
            },
            itemCount: btnNameList.length,
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.chat),
      // ),
    );
  }
}
