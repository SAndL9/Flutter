


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app01/TapboxA.dart';

class One extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new OnePageState();
  }
}

class OnePageState extends State<One>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    List <Widget> _list = new List();
    for(int  i = 0; i < titleItems.length;i++ ){
      _list.add(buildListData(context, titleItems[i], iconItems[i],subTitleItems[i]));
    }

    //分割线
    var divideTiles = ListTile.divideTiles(tiles: _list,context: context).toList();


    return new Container(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Column (
        children: <Widget>[
//          new Text('123'),
          new ListView.builder(
              padding: new EdgeInsets.all(5.0),
              itemExtent: 50.0,
              itemBuilder: (context, item){
                return buildListData(context, titleItems[item], iconItems[item], subTitleItems[item]);
              },
              itemCount: iconItems.length,
          ),
        ],
      ),

    );




    return new Center(
      child: new Column(
        children: <Widget>[
          new Container(

          ),
          new Text('234264'),
          new Scrollbar(
            child: new ListView.separated(
                itemBuilder: (context, item){
                  return buildListData(context, titleItems[item], iconItems[item], subTitleItems[item]);
                },
                separatorBuilder: (BuildContext context, int index) => new Divider(),
                itemCount: iconItems.length),
          ),
        ],
      ),
    );

//    return new Column(
//      children: <Widget>[
//         new Text('234264'),
//         new Scrollbar(
//             child: new ListView.separated(
//                  itemBuilder: (context, item){
//                  return buildListData(context, titleItems[item], iconItems[item], subTitleItems[item]);
//                  },
//                separatorBuilder: (BuildContext context, int index) => new Divider(),
//                  itemCount: iconItems.length),
//          ),
//      ],
//    );

//    return new Scrollbar(
//      child: new ListView.separated(
//          itemBuilder: (context, item){
//            return buildListData(context, titleItems[item], iconItems[item], subTitleItems[item]);
//      },
//          separatorBuilder: (BuildContext context, int index) => new Divider(),
//          itemCount: iconItems.length),
//    );

  }


  Widget buildListData(BuildContext context,String titleItem, Icon iconItem, String subTitleItem){
    return new ListTile(
      leading: iconItem,
      title: new Text(
        titleItem,
        style: TextStyle(fontSize: 18),
      ),
      subtitle: new Text(subTitleItem),
      trailing: new Icon(Icons.keyboard_arrow_right),
      onTap: (){
        showDialog(
            context: context,
            builder: (BuildContext context){
            return new AlertDialog(
              title:  new Text('ListViewAlert',
              style: new TextStyle(color: Colors.black54,fontSize: 18.0),),
                content: new Text('你选择的item内容是：$titleItem'),
            );
        });
      },

    );
  }

  List<String>titleItems = <String>[
    '键盘', '打印机',
    '路由器', '页码器',
    '扩大', '缩小',
    '刷新', 'wifi发射器',
    'wifi加锁', '卡片',
    '沙发', '网页',
    '专用通道', '雪花',
  ];

  List<Icon> iconItems = <Icon>[
    new Icon(Icons.keyboard), new Icon(Icons.print),
    new Icon(Icons.router), new Icon(Icons.pages),
    new Icon(Icons.zoom_out_map), new Icon(Icons.zoom_out),
    new Icon(Icons.youtube_searched_for), new Icon(Icons.wifi_tethering),
    new Icon(Icons.wifi_lock), new Icon(Icons.widgets),
    new Icon(Icons.weekend), new Icon(Icons.web),
    new Icon(Icons.accessible), new Icon(Icons.ac_unit),
  ];

  List<String> subTitleItems = <String>[
    'subTitle: 这个一个高大上的键盘', 'subTitle: 新的打印机器',
    'subTitle: 路由器', 'subTitle: 页面编辑器',
    'subTitle: 扩大系列', 'subTitle: 缩小系列',
    'subTitle: 刷新页面', 'subTitle: wifi发射器',
    'subTitle: wifi被加锁了', 'subTitle: 卡片标识器',
    'subTitle: 舒服的沙发', 'subTitle: H5页面',
    'subTitle: 这是爱心专用通道', 'subTitle: 雪花飘飘',
  ];
  
}