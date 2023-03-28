import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Random Number List Demo',
      theme: ThemeData.from(colorScheme: ColorScheme.light()),
      home: RandomNumberList(),
    );
  }
}

class RandomNumberList extends StatefulWidget {
  @override
  _RandomNumberListState createState() => _RandomNumberListState();
}

class _RandomNumberListState extends State<RandomNumberList> {
  int randomNumber = Random().nextInt(100);

  List<int> numberList = [];

  @override
  void initState() {
    super.initState();
    generateRandomNumberList();
  }

  void generateRandomNumberList() {
    numberList.clear();
    for (int i = 0; i < 10; i++) {
      int randomNumber = Random().nextInt(100);
      numberList.add(randomNumber);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 139, 121, 94),
        title: Center(
          child: Text(
            'Random Number List',
            style: TextStyle(
              color: Color.fromARGB(255, 205, 133, 63),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      backgroundColor: Color.fromARGB(200, 255, 228, 196),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                generateRandomNumberList();
                randomNumber = Random().nextInt(100);
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                "Generate Random Numbers",
                style: TextStyle(
                    fontSize: 36.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(190, 154, 205, 50)),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: numberList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Center(
                    //alttaki kod sayı listesindeki indexleri string yapar
                    child: Text(numberList[index].toString()),
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                      size: 30.0,
                    ),
                    onPressed: () {
                      setState(() {
                        numberList.removeAt(index);
                      });
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
