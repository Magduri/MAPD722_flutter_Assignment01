import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
 String errorMessage = '';

 void calculatePay() {
    double? hours = double.tryParse(hoursController.text);
    double? rate = double.tryParse(rateController.text);

    // Validation Logic 
  if (hours == null || rate == null) {
    setState(() {
      errorMessage = 'Please enter valid numbers';
      totalPay = 0; 
    });
    return;
  }

  
  setState(() {
    errorMessage = '';

    if (hours <= 40) {
      regularPay = hours * rate;
      overtimePay = 0.0;
    } else {
      regularPay = 40 * rate;
      overtimePay = (hours - 40) * rate * 1.5;
    }

    totalPay = regularPay + overtimePay;
    tax = totalPay * 0.18;
    
  });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Pay Calculator'),
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: TextField(
                  controller: hoursController,
                  decoration: InputDecoration(
                    labelText: 'Enter number of hours worked',
                    border: OutlineInputBorder()
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))],
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: TextField(
                  controller: rateController,
                  decoration: InputDecoration(
                    labelText: 'Hourly rate',
                    border: OutlineInputBorder()
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))],
                ),
              ),

              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: calculatePay, 
                child: Text('Calculate')
                ),

              const SizedBox(height: 20),
              if (errorMessage.isNotEmpty)
                Text(
                  errorMessage,
                  style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold),
                ),
                if (errorMessage.isEmpty && totalPay > 0)
                ...[
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
              

               const Spacer(),
              Center(
                child: Column(
                  children: [
                    Text("Name: Iffat Ara Magduri ",
                    style: TextStyle(fontWeight: FontWeight.bold, 
                    color: Colors.blue),
                    ),
                    Text("Student ID: 301499817 ",
                    style: TextStyle(fontWeight: FontWeight.bold, 
                    color: Colors.blue),
                    ),
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
