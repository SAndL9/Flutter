


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app01/TapboxA.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class One extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new OnePageState();
  }
}

//创建并布局
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
        child: new Column(
          children: <Widget>[
            secondSwiperView(),
            new Flexible(child: new ListView.separated(
            itemBuilder: (context, item){
              return buildListData(context, titleItems[item], iconItems[item], subTitleItems[item]);
              },
               separatorBuilder: (BuildContext context, int index) => new Divider(),
                itemCount: iconItems.length),
            ),
          ],
        )
    );

  }

//cell且 点击事件
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

//轮播图
  Widget secondSwiperView(){
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      color: Colors.deepOrange,
      width: MediaQuery.of(context).size.width,
      height: 200,
      child: Swiper(
        itemBuilder: (BuildContext context, int index){
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(secondLists[index]),
                fit: BoxFit.fill,
              ),
//              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
          );
        },

        pagination: SwiperPagination(
            alignment: Alignment.bottomRight,
            margin: const EdgeInsets.fromLTRB(0, 0, 10, 10),
            builder: DotSwiperPaginationBuilder(
                color: Colors.black54,
                activeColor: Colors.red,
            )
        ),
        onTap: (index) => print('scrollerView_Index点击了第$index'),
        itemCount: secondLists.length,
        controller: SwiperController(),
        scrollDirection: Axis.horizontal,
        autoplay: true,
      ),
    );
  }


//数据源
  List<String>titleItems = <String>[
    '键盘', '打印机',
    '路由器', '页码器',
    '扩大', '缩小',
    '刷新', 'wifi发射器',
    'wifi加锁', '卡片',
    '沙发', '网页',
    '专用通道', '雪花',
  ];

  List<String>secondLists = <String>[
    'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3485348007,2192172119&fm=26&gp=0.jpg',
    'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2594792439,969125047&fm=26&gp=0.jpg',
    'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=190488632,3936347730&fm=26&gp=0.jpg',
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