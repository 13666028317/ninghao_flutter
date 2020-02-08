import 'package:flutter/material.dart';

class AnimationDemo extends StatelessWidget {
  const AnimationDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimationDemo'),
      ),
      body: AnimationDemoHome(),
    );
  }
}

class AnimationDemoHome extends StatefulWidget {
  AnimationDemoHome({Key key}) : super(key: key);

  @override
  _AnimationDemoHomeState createState() => _AnimationDemoHomeState();
}

class _AnimationDemoHomeState extends State<AnimationDemoHome>
    with TickerProviderStateMixin {
  AnimationController animationController;
  Animation animation;
  Animation animationColor;
  CurvedAnimation curve;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
        vsync: this,
        // value: 30,
        // lowerBound: 30.0,
        // upperBound: 100.0,
        duration: Duration(milliseconds: 1000));

    curve =
        CurvedAnimation(parent: animationController, curve: Curves.bounceInOut);
    animation = Tween(begin: 30.0, end: 100.0).animate(curve);
    animationColor = ColorTween(begin: Colors.black, end: Colors.red)
        .animate(animationController);

    // animationController.addListener(() {
    //   // print('${animationController.value}');
    //   setState(() {});
    // });

    animationController.addStatusListener((status) {
      print(status);
    });
    // animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      // child: ActionChip(
      //     label: Text('${animationController.value}'),
      //     onPressed: () {
      //       animationController.forward();
      //     }),
      child: AnimationHeart(
        animationController: animationController,
        animations: [animation, animationColor],
      ),
    );
  }
}

class AnimationHeart extends AnimatedWidget {
  final List animations;
  final AnimationController animationController;

  AnimationHeart({this.animations, this.animationController})
      : super(listenable: animationController);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.favorite),
        // iconSize: animationController.value,
        iconSize: animations[0].value,
        color: animations[1].value,
        onPressed: () {
          animationController.forward();
          switch (animationController.status) {
            case AnimationStatus.completed:
              animationController.reverse();
              break;
            default:
              animationController.forward();
          }
        });
  }
}
