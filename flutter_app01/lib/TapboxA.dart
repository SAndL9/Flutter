
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TapBoxA extends StatefulWidget{

  @override
  _TapboxAState createState() => new _TapboxAState();
}

class _TapboxAState extends State<TapBoxA>{

  bool _active = false;

  void _handleTap(){
    setState(() {
      _active = !_active;
    });
  }

  Widget build(BuildContext context){
    return new GestureDetector(
      onTap: _handleTap,
      child:  new Container(
        child: new Center(
          child: new Text(
            _active ? 'Active' :'Inactive',
            style: new TextStyle(fontSize:  20.0, color: Colors.red),
          ),
        ),
        width: _active ? 150.0 : 100.0,
        height: _active ? 150.0 : 100.0,
        decoration: new BoxDecoration(
          color: _active ? Colors.green : Colors.grey,

        ),
      ),
    );
  }

}


