

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget{

  Widget build (BuildContext context){

    return new GestureDetector(
      onTap: (){
        print('MyButton Is Clicked');
      },
      child:  new Container(
        height: 36.0,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration:  new BoxDecoration(
          borderRadius:  new BorderRadius.circular(5.0),
          color: Colors.lightBlue,
        ),
        child:  new Center(
          child: new Text('MyButton'),
        ),
      ),
    );

  }

}