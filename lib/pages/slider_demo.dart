import 'package:flutter/material.dart';

class SliderDemo extends StatefulWidget {
  SliderDemo({Key key}) : super(key: key);

  @override
  _SliderDemoState createState() => _SliderDemoState();
}

class _SliderDemoState extends State<SliderDemo> {
  double _sliderValue = 0.5;
  void _sliderValueAction(value) {
    setState(() {
      _sliderValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('SliderDemo'),
          elevation: 0.0,
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Slider Value : $_sliderValue'),
              SizedBox(height: 32.0),
              Slider(
                value: _sliderValue,
                onChanged: _sliderValueAction,
                activeColor: Theme.of(context).accentColor,
                inactiveColor: Theme.of(context).accentColor.withOpacity(0.3),
                min: 0.0,
                max: 10.0,
                divisions: 10,
                label: '${_sliderValue.toInt()}',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
