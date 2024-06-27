import 'package:flutter/material.dart';

class CheckItem extends StatelessWidget {
  const CheckItem({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PDA Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}

class CheckItemPage extends StatefulWidget {
  const CheckItemPage({super.key, required this.title});
  final String title;

  @override
  State<CheckItemPage> createState() => _CheckItemPageState();
}

class _CheckItemPageState extends State<CheckItemPage> {
  List<String> items = List<String>.generate(100, (i) => "Item $i");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Container(
          margin: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                    labelText: '조회 입력', hintText: 'Enter your item_id'),
              ),
              SizedBox(
                height:
                    MediaQuery.of(context).size.height - kToolbarHeight - 80,
                child: ListView.separated(
                  itemBuilder: (BuildContext ctx, int idx) {
                    // List<String> model =
                    return Column(
                      children: [
                        Text(
                          '${items[idx]}',
                          style: const TextStyle(fontSize: 10),
                        )
                      ],
                    );
                  },
                  itemCount: items.length, // itemCount는 실제 값으로 수정해야 합니다.
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider();
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
