import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class stepper extends StatelessWidget {
  const stepper({super.key});


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        body: const Center(
          child: StepperExample(),
        ),
      ),
    );
  }
}

class StepperExample extends StatefulWidget {
  const StepperExample({super.key});

  @override
  State<StepperExample> createState() => _stepperState();
}

class _stepperState extends State<StepperExample> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Stepper(
      currentStep: _index,
      onStepCancel: () {
        if (_index > 0) {
          setState(() {
            _index -= 1;
          });
        }
      },
      onStepContinue: () {
        if (_index <= 0) {
          setState(() {
            _index += 1;
          });
        }
      },
      onStepTapped: (int index) {
        setState(() {
          _index = index;
        });
      },

      steps: <Step>[
        Step(
          title: const Text('itinerary '),
          content: Column(
            children: <Widget>[
              const SizedBox(height: 2),
              CheckboxListTile(
                title: null, // Remove the label text
                value: false, // You can set an initial value or use a variable.
                onChanged: (bool? value) {
                  // Handle checkbox state changes here.
                  setState(() {

                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
