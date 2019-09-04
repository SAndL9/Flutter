

import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';

class Two extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TwoViewState();
  }

}


class _TwoViewState extends State<Two> {

  //声明一个list 存放image Widget
  List <Widget> imageList = List();

  List secondList = List();

  void initState(){
    
    imageList
      ..add(Image.network(
        'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3485348007,2192172119&fm=26&gp=0.jpg',
        fit: BoxFit.fill,
      ))
      ..add(Image.network(
        'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2594792439,969125047&fm=26&gp=0.jpg',
        fit: BoxFit.fill,
      ))
      ..add(Image.network(
        'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=190488632,3936347730&fm=26&gp=0.jpg',
        fit: BoxFit.fill,
      ));

    secondList.add(
        'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3485348007,2192172119&fm=26&gp=0.jpg');
    secondList.add(
    'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2594792439,969125047&fm=26&gp=0.jpg');
    secondList.add(
        'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=190488632,3936347730&fm=26&gp=0.jpg');




    super.initState();
    
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.black12,
      body: ListView(
        children: <Widget>[
          secondSwiperView(),
          firstSwiperView(),
        ],
      ),
    );
  }


  Widget firstSwiperView(){
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 0, 0 , 5),
      color: Colors.greenAccent,
      width: MediaQuery.of(context).size.width,
      height: 200,
      child: Swiper(
          itemCount: imageList.length,
        itemBuilder: _swiperBuilder,
        pagination: SwiperPagination(
          alignment: Alignment.bottomRight,
          margin: const EdgeInsets.fromLTRB(0, 0, 10, 10),
          builder: DotSwiperPaginationBuilder(
            color: Colors.black54,
            activeColor: Colors.white
          )
        ),
        controller: SwiperController(),
        scrollDirection: Axis.horizontal,
        autoplay: true,
        onTap: (index) => print('点击了第$index'),
      ),
    );
  }


  Widget secondSwiperView(){
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 30, 25, 30),
      color: Colors.deepOrange,
      width: MediaQuery.of(context).size.width,
      height: 200,
      child: Swiper(
        itemBuilder: (BuildContext context, int index){
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(secondList[index]),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
          );
        },
        onTap: (index) => print('bottom点击了第$index'),
        itemCount: secondList.length,

//        itemBuilder: _swiperBuilder,
//        controller: SwiperController(),
//        scrollDirection: Axis.horizontal,
        autoplay: true,
      ),
    );
  }



  Widget _swiperBuilder(BuildContext context, int index){
    return (imageList[index]);
  }



}