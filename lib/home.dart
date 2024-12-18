import 'package:flutter/material.dart';
import 'main.dart';
import 'yw_detail_page.dart';
import 'hj_detail_page.dart';
import 'nl_detail_page.dart';
import 'sj_detail_page.dart';
import 'sh_detail_page.dart';

class HomeTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: TeamGrid(),
      ),
    );
  }
}

class TeamGrid extends StatelessWidget {
  // 페이지 생성자를 포함하는 members 리스트
  final List<Map<String, dynamic>> members = [
    {
      'name': '문현지',
      'homeImage': 'images/현지.png',
      'detailImage': 'images/현지_i.jpg',
      'notifications': '1', // 알림 숫자
      'page': (String name, String imagePath, int age, int likeCount) =>
          HJDetailPage(name: name, imagePath: imagePath, age: age, likeCount: likeCount),
      'age': '27',
      'likeCount': 0 // 초기 좋아요 수
    },
    {
      'name': '김나린',
      'homeImage': 'images/나린.jpg',
      'detailImage': 'images/나린_i.jpg',
      'notifications': '3', // 알림 숫자
      'page': (String name, String imagePath, int age, int likeCount) =>
          NLDetailPage(name: name, imagePath: imagePath, age: age, likeCount: likeCount),
      'age': '24',
      'likeCount': 0 // 초기 좋아요 수
    },
    {
      'name': '도연우',
      'homeImage': 'images/연우.png',
      'detailImage': 'images/연우_i.jpg',
      'notifications': '0', // 알림 숫자
      'page': (String name, String imagePath, int age, int likeCount) =>
          YWDetailPage(name: name, imagePath: imagePath, age: age, likeCount: likeCount),
      'age': '24',
      'likeCount': 0 // 초기 좋아요 수
    },
    {
      'name': '장수진',
      'homeImage': 'images/수진.jpg',
      'detailImage': 'images/수진_i.png',
      'notifications': '2', // 알림 숫자
      'page': (String name, String imagePath, int age, int likeCount) =>
          SJDetailPage(name: name, imagePath: imagePath, age: age, likeCount: likeCount),
      'age': '26',
      'likeCount': 0 // 초기 좋아요 수
    },
    {
      'name': '이상현',
      'homeImage': 'images/상현.png',
      'detailImage': 'images/상현_i.jpg',
      'notifications': '5', // 알림 숫자
      'page': (String name, String imagePath, int age, int likeCount) =>
          SHDetailPage(name: name, imagePath: imagePath, age: age, likeCount: likeCount),
      'age': '26',
      'likeCount': 0 // 초기 좋아요 수
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // 배경색을 베이비 핑크로 설정
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 70), // 텍스트 상단에 여백 추가
            // 상단 텍스트 추가
            const Text(
              'FT ie-land 멤버 소개️',
              style: TextStyle(
                fontSize: 30,
                color: Colors.pink,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    blurRadius: 10.0, // 그림자 블러 반경
                    color: Colors.white, // 그림자 색상
                    offset: Offset(2, 2), // 그림자 위치
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50), // 여백 추가
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildMemberProfile(context, members[0]),
                const SizedBox(width: 30),
                buildMemberProfile(context, members[1]),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildMemberProfile(context, members[2]),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildMemberProfile(context, members[3]),
                const SizedBox(width: 30),
                buildMemberProfile(context, members[4]),
              ],
            ),
            // 메인 화면으로 가는 아이콘 추가
            const SizedBox(height: 30), // 여백 추가
            IconButton(
              icon: const Icon(Icons.home, size: 30, color: Colors.pink),
              onPressed: () {
                // 메인 화면으로 이동하며 네비게이션 스택을 모두 제거
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const MyApp()), // main.dart의 첫 화면으로 이동
                      (Route<dynamic> route) => false, // 모든 스택 제거
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMemberProfile(BuildContext context, Map<String, dynamic> member) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => member['page'](
              member['name']!,
              member['detailImage']!, // 상세 페이지 이미지 전달
              int.parse(member['age']!), // 문자열을 정수로 변환
              member['likeCount'], // likeCount 전달
            ),
          ),
        );
      },
      child: Column(
        children: [
          Stack(
            children: [
              Hero(
                tag: member['name']!,
                child: CircleAvatar(
                  radius: 75,
                  backgroundImage: AssetImage(member['homeImage']!), // 홈 이미지 사용
                ),
              ),
              // 알림 배지
              Positioned(
                right: 0,
                top: 0,
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.pink,
                  child: Text(
                    member['notifications']!, // 알림 숫자 표시
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            member['name']!,
            style: const TextStyle(color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
