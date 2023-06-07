// 메인 화면

import 'package:flutter/material.dart';
import 'package:my_musical/screens/home_button.dart';
import 'package:my_musical/widgets/profile_widget.dart';

import '../models/show_model.dart';
import '../widgets/show_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 100,
          horizontal: 20,
        ),
        child: Column(
          children: [
            const ProfileWidget(),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '최아람',
                  style: TextStyle(
                    fontFamily: 'Cafe24Ssurrond',
                    fontSize: 28,
                    color: Colors.pink.shade300,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const HomeButton(
              title: 'Github',
              icon: Icons.handyman,
              isInverted: true,
              url: "https://github.com/iohcrepoleved",
            ),
            const HomeButton(
              title: 'Notion',
              icon: Icons.note_add,
              isInverted: false,
              url: "https://github.com/iohcrepoleved",
            ),
            const HomeButton(
              title: 'Daily Blog',
              icon: Icons.edit_note,
              isInverted: true,
              url: "https://github.com/iohcrepoleved",
            ),
            const HomeButton(
              title: 'Instagram',
              icon: Icons.photo,
              isInverted: false,
              url: "https://github.com/iohcrepoleved",
            ),
            const HomeButton(
              title: 'My Favorite',
              icon: Icons.favorite,
              isInverted: true,
            ),
          ],
        ),
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<ShowModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      itemBuilder: (context, index) {
        var show = snapshot.data![index];
        return ShowWidget(
          title: show.title,
          thumb: show.thumb,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 40,
      ),
    );
  }
}
