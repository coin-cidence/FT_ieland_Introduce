import 'package:flutter/material.dart';

// 모듈 분리
class BinPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("빈페이지"), // 수정됨
        actions: [
          IconButton(
            onPressed: (){
              Navigator.of(context).popUntil((route) => route.isFirst);  //스택의 가장 바닥에 있는 첫번째 화면으로 돌아갈 때 사용
            },
            icon: Icon(Icons.home),
          )
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.deepOrange, // 수정됨
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '페이지 공사 중입니다.', // 수정됨
              style: TextStyle(fontSize: 40),
            ),
          ],
        ),
      ),
    );
  }
}

