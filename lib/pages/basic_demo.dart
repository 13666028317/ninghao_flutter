import 'package:flutter/material.dart';

class BasicDemo extends StatefulWidget {
  BasicDemo({Key key}) : super(key: key);

  @override
  _BasicDemoState createState() => _BasicDemoState();
}

class _BasicDemoState extends State<BasicDemo> {
  @override
  Widget build(BuildContext context) {
    return Box001();
  }
}


class Box001 extends StatelessWidget {
  const Box001({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        // color: Colors.grey[100],
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://resources.ninghao.org/images/say-hello-to-barry.jpg"),
            alignment: Alignment.topCenter,
            // repeat: ImageRepeat.repeatY,
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.indigoAccent[400].withOpacity(0.3), BlendMode.hardLight),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Icon(Icons.pool, size: 32.0, color: Colors.white),
              padding: EdgeInsets.all(16.0),
              margin: EdgeInsets.all(8.0),
              width: 90.0,
              height: 90.0,
              decoration: BoxDecoration(
                color: Color.fromRGBO(3, 54, 255, 1.0),
                border: Border.all(
                  color: Colors.indigoAccent[100],
                  width: 3.0,
                  style: BorderStyle.solid,
                ),
                // borderRadius: BorderRadius.circular(16.0),
                // borderRadius: BorderRadius.only(
                //   topLeft: Radius.circular(16.0),
                // ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(6.0, 7.0),
                    color: Color.fromRGBO(16, 20, 188, 1.0),
                    blurRadius: 25.0,
                    spreadRadius: -9.0,
                  )
                ],
                shape: BoxShape.circle,
                // gradient: RadialGradient(
                //   colors: [
                //     Color.fromRGBO(7, 102, 255, 1.0),
                //     Color.fromRGBO(3, 28, 128, 1.0),
                //   ],
                // ),
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(7, 102, 255, 1.0),
                    Color.fromRGBO(3, 28, 128, 1.0),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}