import 'package:flutter/material.dart';

class LayoutDemo extends StatefulWidget {
  LayoutDemo({Key key}) : super(key: key);

  @override
  _LayoutDemoState createState() => _LayoutDemoState();
}

class _LayoutDemoState extends State<LayoutDemo> {
  @override
  Widget build(BuildContext context) {
    return AspectRatioDemo();
  }
}

class IconBadge extends StatelessWidget {
  final IconData icon;
  final double size;

  IconBadge(this.icon, {this.size = 32.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(icon, size: size, color: Colors.white),
      width: size + 60,
      height: size + 60,
      color: Color.fromRGBO(3, 54, 255, 1.0),
    );
  }
}

class StackSemo extends StatelessWidget {
  const StackSemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //  IconBadge(Icons.pool),
          //  IconBadge(Icons.beach_access),
          //  IconBadge(Icons.airplanemode_active),
          Stack(
            alignment: Alignment.topRight,
            children: <Widget>[
              SizedBox(
                child: Container(
                  width: 200.0,
                  height: 300.0,
                  alignment: Alignment(-0.80, -0.80),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(3, 54, 255, 1.0),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Icon(Icons.ac_unit, color: Colors.white, size: 32.0),
                ),
              ),
              SizedBox(
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  // alignment: Alignment(-0.80, -0.80),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(3, 54, 255, 1.0),
                    // borderRadius: BorderRadius.circular(8.0),
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        Color.fromRGBO(7, 102, 255, 1.0),
                        Color.fromRGBO(3, 54, 255, 1.0),
                      ],
                    )
                  ),
                  child: Icon(Icons.branding_watermark,
                      color: Colors.white, size: 32.0),
                ),
              ),
              Positioned(
                bottom: 20.0,
                right: 20.0,
                child: Icon(Icons.ac_unit, color: Colors.white, size: 32.0),
              )
            ],
          )
        ],
      ),
    );
  }
}


class AspectRatioDemo extends StatelessWidget {
  const AspectRatioDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 16.0/9.0,
            child: Container(
              color: Color.fromRGBO(3, 54, 255, 1.0),
            ),
          ),
          SizedBox(height: 30.0),
          ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 200.0,
              maxHeight: 200.0,
            ),
            child: Container(
              color: Color.fromRGBO(3, 54, 255, 1.0),
            ),
          ),
        ],
      ),
    );
  }
}