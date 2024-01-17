import 'package:flutter/material.dart';
import 'package:scrollable_widgets/constant/colors.dart';
import 'package:scrollable_widgets/layout/main_layout.dart';

class SingleChildScrollViewScreen extends StatelessWidget {
  const SingleChildScrollViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: "SingChildScrollView",
      body: renderClip(),
    );
  }

  //1. 기본 렌더링
  Widget renderSimple(){
    return SingleChildScrollView(
      child: Column(
        children:
        rainbowColors.map((e) => renderContainer(color: e)).toList(),
      ),
    );
  }

  //2. 화면을 넘어가지 않아도 스크롤 되게하기
  Widget renderAlwaysScroll(){
    return SingleChildScrollView(
      //NeverScrollableScroolPhysics -> 스크롤 안됨
      physics: AlwaysScrollableScrollPhysics(),
      child: Column(
        children:[
          renderContainer(color: Colors.black),
        ]
      ),
    );
  }

  //3. 스크롤시 아랫부분이 잘리지않도록 하기
  Widget renderClip(){
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      clipBehavior: Clip.none,
      child: Column(
          children:[
            renderContainer(color: Colors.black),
          ]
      ),
    );
  }



  Widget renderContainer({
    required Color color,
  }) {
    return Container(
      height: 300,
      color: color,
    );
  }
}
