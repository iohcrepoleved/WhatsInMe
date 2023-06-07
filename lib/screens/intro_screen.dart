// 사진 클릭 시 나올 자기소개 화면
import 'package:flutter/material.dart';
import 'package:my_musical/themes/color_theme.dart';
import 'package:my_musical/themes/font_theme.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({super.key});
  final TextStyle comment = const TextStyle(
    fontSize: 15,
  );
  final List<Map> _users = [
    {'id': '이름', 'name': '최아람'},
    {'id': '생년월일', 'name': '1997/08/29'},
    {'id': '연락처', 'name': '010-3955-9101'},
    {'id': 'E-mail', 'name': 'aram829@icloud.com'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Introduction',
          style: TextStyle(
            fontFamily: 'Cafe24Ssurrond',
          ),
        ),
        foregroundColor: ColorTheme.invertedColor,
        backgroundColor: ColorTheme.appBarColor,
      ),
      backgroundColor: ColorTheme.backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    '프로필',
                    style: FontTheme.titleTextStyle,
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Table(
                columnWidths: const {
                  0: FixedColumnWidth(100),
                },
                children: _users.map((user) {
                  return TableRow(children: [
                    Container(
                      child: Text(
                        user['id'],
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        user['name'],
                        style: comment,
                      ),
                    )
                  ]);
                }).toList(),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    '학력',
                    style: FontTheme.titleTextStyle,
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('배화여자대학교 스마트IT과 학사 (전공심화과정)\n  (2020/03 ~ 2021/02)',
                          style: comment),
                      Text(
                        '배화여자대학 스마트IT학과 전문학사\n  (2017/03 ~ 2020/02)',
                        style: comment,
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    '보유 자격증',
                    style: FontTheme.titleTextStyle,
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    '정보처리산업기사 (2019.08.16 취득)',
                    style: comment,
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    '자기소개',
                    style: FontTheme.titleTextStyle,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                  decoration: const BoxDecoration(),
                  child: Text(
                    '나무가 아닌 숲을 보려 하는 2년 차 개발자입니다.\n 업무자동화 프로젝트의 팀원으로 RPA와 AWS Lambda를 활용한 자동화 서비스를 설계, 개발, 운영했습니다. 자동화 서비스를 통해 수집된 데이터의 용도와 흐름을 파악하여 REST API, 웹 화면 개발에도 참여했습니다. 프로젝트의 완성 퀄리티와 개발 과정 두 마리 토끼를 잡기 위해 고민하는 개발자입니다. 개발 기간과 서비스 실행 시간을 단축하기 위해 다양한 언어를 사용하는 것에 두려움이 없습니다. 따라서 여러 분야의 서비스를 개발할 기회를 얻을 수 있었다고 생각합니다.\n 서비스를 개발하는 과정 뿐만 아니라 배포 후 클라이언트의 반응 모니터링, 추후 클라이언트의 새로운 요구 사항에 맞춰 추가 개발과 운영을 진행하는데에 큰 흥미를 느꼈습니다. 따라서 더 넓은 타겟층이 활용하는 서비스를 개발하고자 자사 서비스 및 자사 솔루션 개발에 관심을 가지게 되었습니다.',
                    style: comment,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
