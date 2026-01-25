import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {

TextEditingController hoursController = TextEditingController();
TextEditingController rateController = TextEditingController();

double regularPay = 0.0;
 double overtimePay = 0.0;
 double totalPay = 0.0;
 double tax = 0.0;

 void calculatePay() {
    double hours = double.tryParse(hoursController.text) ?? 0.0;
    double rate = double.tryParse(rateController.text) ?? 0.0;

    if (hours <= 40) {
      regularPay = hours * rate;
      overtimePay = 0.0;
    } else {
      regularPay = 40 * rate;
      overtimePay = (hours - 40) * rate * 1.5;
    }

    totalPay = regularPay + overtimePay;
    tax = totalPay * 0.18; 
    totalPay -= tax;

    setState(() {});
  }

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
                    hintText: 'Hourly rate',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              ElevatedButton(
                onPressed: calculatePay, 
                child: Text('Calculate')
                ),
              SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    Text('Total Salary: '),
                    Text("Regular Pay: \$${regularPay.toStringAsFixed(2)}"),
                    Text("Overtime Pay: \$${overtimePay.toStringAsFixed(2)}"),
                    Text("Total Pay: \$${totalPay.toStringAsFixed(2)}"),
                    Text("Tax (18%): \$${tax.toStringAsFixed(2)}"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ), 
    );
  }
}
