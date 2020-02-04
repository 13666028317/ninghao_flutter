import 'package:flutter/material.dart';

class SetpperDemo extends StatefulWidget {
  SetpperDemo({Key key}) : super(key: key);

  @override
  _SetpperDemoState createState() => _SetpperDemoState();
}

class _SetpperDemoState extends State<SetpperDemo> {
  int _currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('SetpperDemo'),
          elevation: 0.0,
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Theme(
                data: Theme.of(context).copyWith(
                  primaryColor: Colors.black,
                ),
                child: Stepper(
                  currentStep: _currentStep,
                  onStepTapped: (int value) {
                    setState(() {
                      _currentStep = value;
                    });
                  },
                  onStepContinue: (){
                    if (_currentStep<2) {
                      setState(() {
                        _currentStep++;
                      });
                    }
                  },
                  onStepCancel: (){
                    if (_currentStep>0) {
                      setState(() {
                        _currentStep--;
                      });
                    }
                  },
                  steps: [
                  Step(
                      isActive: _currentStep==0,
                      title: Text('Login'),
                      subtitle: Text('Login first'),
                      content: Text(
                          'Login first Login first Login first Login first')),
                          Step(
                      isActive: _currentStep==1,
                      title: Text('Login'),
                      subtitle: Text('Login first'),
                      content: Text(
                          'Login first Login first Login first Login first')),
                          Step(
                      isActive: _currentStep==2,
                      title: Text('Login'),
                      subtitle: Text('Login first'),
                      content: Text(
                          'Login first Login first Login first Login first')),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
