import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  TextEditingController so1Controller = TextEditingController();
  TextEditingController so2Controller = TextEditingController();
  String result = '';

  void calculate(String operation) {
    double num1 = double.tryParse(so1Controller.text) ?? 0;  // Chuyển chuỗi nhập thành số
    double num2 = double.tryParse(so2Controller.text) ?? 0;
    double? res;

    switch (operation) {
      case '+':
        res = num1 + num2;
        break;
      case '-':
        res = num1 - num2;
        break;
      case '*':
        res = num1 * num2;
        break;
      case '/':
        if (num2 != 0) {
          res = num1 / num2;
        } else {
          result = 'Không thể chia cho 0';
          res = null;
        }
        break;
    }

    setState(() {
      if (res != null) {
        result = 'Kết quả: $res';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: so1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Số thứ nhất',
              ),
            ),
            TextField(
              controller: so2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Số thứ hai',
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: () => calculate("+"), child: Text("+")),
                ElevatedButton(onPressed: () => calculate("-"), child: Text("-")),
                ElevatedButton(onPressed: () => calculate("*"), child: Text("*")),
                ElevatedButton(onPressed: () => calculate("/"), child: Text("/")),
              ],
            ),
            SizedBox(height: 20),
            Text(
              result,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
