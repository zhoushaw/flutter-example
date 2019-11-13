import 'package:flutter/material.dart';

class StepWid extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StepWidState();
  }
}

class StepWidState extends State<StepWid> {
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(title: Text('步骤')),
      body: Container(
        child: Stepper(
          steps: [
            Step(title: Text('step1'), content: Text('hello'), isActive: true),
            Step(title: Text('step2'), content: Text('wrold'),state: StepState.editing, isActive: currentStep>0),
            Step(title: Text('step3'), content: Text('!'), isActive: currentStep>1),
          ],
          type: StepperType.horizontal,
          currentStep: currentStep,
          onStepTapped: (int index) {
            setState(() {
              currentStep = index;
            });
          },
          onStepContinue: () {
            if (currentStep < 3 - 1) {
              currentStep++;
            }
            setState(() {
              currentStep = currentStep;
            });
          },
          onStepCancel: () {
            if (currentStep > 0) {
              currentStep--;
            }
            setState(() {
              currentStep = currentStep;
            });
          },
        ),
      ),
    );
  }
}
