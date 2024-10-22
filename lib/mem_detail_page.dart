import 'package:flutter/material.dart';

class MemberDetailPage extends StatelessWidget {
  final String name;
  final String imagePath;

  MemberDetailPage({super.key, required this.name, required this.imagePath});

  // 팀원 설명을 담은 딕셔너리
  var memberDesc = {
    "수진": "수진이는 발레를 좋아합니다.",
    "연우": "연우는 팀장입니다.",
    "나린": "나린이는 코딩을 좋아합니다.",
    "상현": "상현이는 농구를 좋아합니다.",
    "현지": "현지는 독서를 좋아합니다.",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: name, // Hero 위젯에 동일한 tag 설정
              child: Image.asset(
                imagePath,
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              name,
              style: const TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 10),
            Text(
              ("${memberDesc[name]}"), // 설명 표시
              style: const TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orangeAccent,
              ),
              onPressed: () {
                Navigator.pop(context); // 이전 페이지로 돌아가기
              },
              child: const Text(
                "홈페이지로 이동",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
