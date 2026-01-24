import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}
TextEditingController hoursController = TextEditingController();
TextEditingController rateController = TextEditingController();

 double regularPay = 0.0;
 double overtimePay = 0.0;
 double totalPay = 0.0;
 double tax = 0.0;

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Pay Calculator'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: TextField(
                  controller: hoursController,
                  decoration: InputDecoration(
                    hintText: 'Enter number of hours',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: TextField(
                  controller: rateController,
                  decoration: InputDecoration(
                    hintText: 'Hourly ',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              ElevatedButton(onPressed: (){}, child: Text('Calculate')),
              SizedBox(height: 20),
              Center(
                child: Text('Total Salary: '),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
