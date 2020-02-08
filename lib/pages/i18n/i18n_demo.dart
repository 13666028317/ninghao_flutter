import 'package:flutter/material.dart';
import 'package:ninghao_flutter/pages/i18n/map/localiztions_demo.dart';

class I18nDemo extends StatelessWidget {
  const I18nDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Locale locale = Localizations.localeOf(context);


    return Scaffold(
     appBar: AppBar(
       title: Text('I18nDemo'),
     ), 
     body: Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
           Text(locale.toString()),
           Text(NinghaoLocliztions.of(context).title),
         ],
       ),
     ),
    );
  }
}