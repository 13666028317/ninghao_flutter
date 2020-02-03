import 'package:flutter/material.dart';

class FormDemo extends StatefulWidget {
  FormDemo({Key key}) : super(key: key);

  @override
  _FormDemoState createState() => _FormDemoState();
}

class _FormDemoState extends State<FormDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FormDemo'),
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
          primaryColor: Colors.black,
        ),
        child: Container(
          child:  Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RigesterFormDemo(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class TextFeildDemo extends StatefulWidget {
  TextFeildDemo({Key key}) : super(key: key);

  @override
  _TextFeildDemoState createState() => _TextFeildDemoState();
}

class _TextFeildDemoState extends State<TextFeildDemo> {

  final textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() { 
    super.initState();
    // textEditingController.text = 'hi';
    textEditingController.addListener(
      () {
        debugPrint('input: ${textEditingController.text}');
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
       child: TextField(
         controller: textEditingController,
        //  onChanged: (value) {
        //    debugPrint('input-value$value');
        //  },
         decoration: InputDecoration(
           icon: Icon(Icons.subject),
           labelText: 'title',
           hintText: 'Enter the post title',
          //  border: InputBorder.none,
          // border: OutlineInputBorder(),
          filled: true,
         ),
       ),
    );
  }
}

class RigesterFormDemo extends StatefulWidget {
  RigesterFormDemo({Key key}) : super(key: key);

  @override
  _RigesterFormDemoState createState() => _RigesterFormDemoState();
}

class _RigesterFormDemoState extends State<RigesterFormDemo> {

  final regiserFormKey = GlobalKey<FormState>();
  String userName, passWord;
  bool autovalidate = false;

  void submitRegisterForm () {
    if (regiserFormKey.currentState.validate()) {
      regiserFormKey.currentState.save();
    
      debugPrint('username == $userName');
      debugPrint('passWord == $passWord');
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text("Register..."),
        )
      );
    }else{
      setState(() {
        autovalidate = true;
      });
    }
  }

  String validatoruserName (value) {
    if (value.isEmpty) {
      return 'userName is required';
    }
    return null;
  }

  String validatorpassWord (value) {
    if (value.isEmpty) {
      return 'passWord is required';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
       child: Form(
         key: regiserFormKey,
         child: Column(
           children: <Widget>[
             TextFormField(
               decoration: InputDecoration(
                 labelText: 'userName',
                 helperText: '',
               ),
               onSaved: (value) {
                 userName = value;
               },
               validator: validatoruserName,
               autovalidate: autovalidate,
             ),
             TextFormField(
               obscureText: true,
               decoration: InputDecoration(
                 labelText: 'passWord',
                 helperText: '',
               ),
               onSaved: (value) {
                 passWord = value;
               },
               validator: validatorpassWord,
               autovalidate: autovalidate,
             ),
             SizedBox(height: 32.0),
             Container(
               width: double.infinity,
               child: RaisedButton(
                 color: Theme.of(context).accentColor,
                 child: Text('Rigester', style: TextStyle(color: Colors.white)),
                 elevation: 0.0,
                 onPressed: submitRegisterForm,
               ),
             )
           ],
         ),
       ),
    );
  }
}

class ThemeDemo extends StatelessWidget {
  const ThemeDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
    );
  }
}