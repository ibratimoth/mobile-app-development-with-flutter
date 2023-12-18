
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BMICalculator(),
    );
  }
}

class BMICalculator extends StatefulWidget {
  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  String bmiResult = '';

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/picha.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const Text(
                'YOUR BMI is',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.white),
              ),
              Text(
                bmiResult,
                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold,color: Colors.white),
              ),
              const SizedBox(height: 20),
              const Text(
                'Please enter your height and weight to calculate your BMI',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              const SizedBox(height: 20),
              Container(
                width: deviceWidth * 0.9,
                child: TextField(
                  controller: weightController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Weight (kg)'),
                ),
              ),
              Container(
                width: deviceWidth * 0.9,
                child: TextField(
                  controller: heightController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Height (m)'),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: deviceWidth * 0.9,
                child: ElevatedButton(
                  onPressed: () {
                    calculateBMI();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text('CALCULATE'),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Body Mass index, or BMI, is used to determine whether you are in a healthy weight range for your height.',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              const SizedBox(height: 10),
              const Text(
                'This calculator should not be used for pregnant women or children.',
                style: TextStyle(fontSize: 12, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void calculateBMI() {
    double weight = double.tryParse(weightController.text) ?? 0.0;
    double height = double.tryParse(heightController.text) ?? 0.0;

    if (weight > 0 && height > 0) {
      // Convert height to meters
      height = height / 100;

      double bmi = weight / (height * height);
      setState(() {
        bmiResult = bmi.toStringAsFixed(1);

        // Categorize BMI
        if (bmi < 18.5) {
          bmiResult += '\nUNDERWEIGHT';
        } else if (bmi >= 18.5 && bmi <= 24.9) {
          bmiResult += '\nHEALTHY WEIGHT';
        } else if (bmi >= 25 && bmi <= 29.9) {
          bmiResult += '\nOVERWEIGHT';
        } else if (bmi >= 30 && bmi <= 34.9) {
          bmiResult += '\nOBESE';
        } else if (bmi >= 35 && bmi <= 39.9) {
          bmiResult += '\nSEVERELY OBESE';
        } else {
          bmiResult += '\nMORBIDLY OBESE';
        }
      });
    } else {
      // Handle invalid input
      setState(() {
        bmiResult = 'Invalid input. Please enter valid values.';
      });
    }
  }
}





















