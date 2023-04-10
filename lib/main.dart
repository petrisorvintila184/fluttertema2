
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const CursFlutterTema2());
}

class CursFlutterTema2 extends StatelessWidget {
  const CursFlutterTema2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      home: CursFlutterTema2Home(),
    );
  }
}

class CursFlutterTema2Home extends StatefulWidget {
  const CursFlutterTema2Home({Key? key}) : super(key: key);

  @override
  State<CursFlutterTema2Home> createState() => CursFlutterTema2HomeState();
}

class CursFlutterTema2HomeState extends State<CursFlutterTema2Home>{
  final numberController = TextEditingController();
  bool isSquare = false;
  bool isTriangle = false;

  void checkNumber() {
    int number = int.tryParse(numberController.text) ?? 0;
    int squareRoot = sqrt(number).toInt();
    int z = 0;
    String val = 'enter a number';

    setState(() {
      if (number != 0) {
        isSquare = (squareRoot * squareRoot == number);

        for (int i = 1; i < number; i++) {
          if ((i * i * i) == number) {
            z = z + 1;
          } else {
            z = z + 0;
          }
        }

        if (z == 1) {
          isTriangle = true;
        } else {
          isTriangle = false;
        }

        if (isTriangle) {
          if (isSquare) {
            val = "Number is square and triangle.";
          } else {
            val = "Number is triangle.";
          }
        } else {
          if (isSquare) {
            val = "Number is square.";
          } else {
            val = 'Number is no square or triangle';
          }
        }
      }else{
        val = 'Insert a correct number!';
      }
    }
      );

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Number Checker'),
          content: Text(
            'The number ${numberController.text} is: ${val}'
          ),

          );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(
      appBar: AppBar(
        title: const Text('Number Shapes'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          const Text('Please enter a number to see if it is square or triangular.',
            style:TextStyle(
              fontSize: 25,
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              controller: numberController,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter your number',
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
          padding: const EdgeInsets.all(2),
          height: 70,
          margin: const EdgeInsets.only(left: 20.0, right: 40.0, bottom: 40.0),
          color: Colors.white,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            textDirection: TextDirection.rtl,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.check_circle_rounded,
                  color:Colors.blue,
                  size: 70,
                ),
                onPressed: checkNumber,
              ),
            ],
          )
      ),
    ),
    );
  }
}