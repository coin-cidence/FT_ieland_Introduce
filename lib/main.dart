import 'package:flutter/material.dart';
import 'mem_detail_page.dart';  // 팀원 디테일 페이지 추가
import 'bin_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FT-ieland intro app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const MyHomePage(title: '우리 팀을 소개합니다~~~~~~!'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double imageWidth = MediaQuery.of(context).size.width / 3;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 200,
            child: Image.asset(
              'images/ft-island.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            top: 220,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "팀명: FT-ieland",
                    style: TextStyle(
                      fontSize: 45,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "우리 팀원들",
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.deepOrange,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => MemberDetailPage(
                                name: "수진",
                                imagePath: 'images/수진.jpg',
                              ),
                            ),
                          );
                        },
                        child: Hero(
                          tag: "수진",
                          child: TeamMemberCard(imagePath: 'images/수진.jpg', name: '수진'),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => MemberDetailPage(
                                name: "연우",
                                imagePath: 'images/연우.png',
                              ),
                            ),
                          );
                        },
                        child: Hero(
                          tag: "연우",
                          child: TeamLeaderCard(imagePath: 'images/연우.png', name: '팀장 연우'),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => MemberDetailPage(
                                name: "나린",
                                imagePath: 'images/나린.png',
                              ),
                            ),
                          );
                        },
                        child: Hero(
                          tag: "나린",
                          child: TeamMemberCard(imagePath: 'images/나린.png', name: '나린'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => MemberDetailPage(
                                name: "상현",
                                imagePath: 'images/상현.png',
                              ),
                            ),
                          );
                        },
                        child: Hero(
                          tag: "상현",
                          child: TeamMemberCard(imagePath: 'images/상현.png', name: '상현'),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => MemberDetailPage(
                                name: "현지",
                                imagePath: 'images/현지.jpg',
                              ),
                            ),
                          );
                        },
                        child: Hero(
                          tag: "현지",
                          child: TeamMemberCard(imagePath: 'images/현지.jpg', name: '현지'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40), // 빈페이지 버튼 위의 간격을 추가
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orangeAccent, // 수정됨
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => BinPage())
                      );
                    },
                    child: const Text(
                      "빈페이지로 이동",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 팀원 카드를 정의한 클래스
class TeamMemberCard extends StatelessWidget {
  final String imagePath;
  final String name;

  const TeamMemberCard({super.key, required this.imagePath, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipOval(
          child: Image.asset(
            imagePath,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          name,
          style: const TextStyle(
            fontSize: 20, // 이름 크기 수정
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

// 팀장을 강조한 카드
class TeamLeaderCard extends StatelessWidget {
  final String imagePath;
  final String name;

  const TeamLeaderCard({super.key, required this.imagePath, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.yellow,
              width: 4.0,
            ),
          ),
          child: ClipOval(
            child: Image.asset(
              imagePath,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          name,
          style: const TextStyle(
            fontSize: 20, // 이름 크기 수정
            fontWeight: FontWeight.bold,
            color: Colors.yellow,
          ),
        ),
      ],
    );
  }
}
