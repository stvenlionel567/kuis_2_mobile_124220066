import 'package:flutter/material.dart';
import 'package:mobile_teori_kuis2/profile/homepage.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Row(
        children: [
          Expanded(
              child: InkWell(
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Homepage(),
                  ));
            },
            child: const SizedBox(
              height: 80,
              child: Icon(Icons.home),
            ),
          )),
          Expanded(
              child: InkWell(
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfilePage(),
                  ));
            },
            child: const SizedBox(
              height: 80,
              child: Icon(Icons.person),
            ),
          ))
        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage('assets/profile.jpeg'),
            ),
            Padding(
              padding: EdgeInsets.all(30),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Nama   :",
                          style: TextStyle(fontSize: 22),
                        ),
                        Text(
                          " Steven Lionel",
                          style: TextStyle(fontSize: 22),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "NIM      :",
                          style: TextStyle(fontSize: 22),
                        ),
                        Text(
                          " 124220066",
                          style: TextStyle(fontSize: 22),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "TTL      :",
                          style: TextStyle(fontSize: 22),
                        ),
                        Text(
                          " Jakarta, 02 Okt 2003",
                          style: TextStyle(fontSize: 22),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Hobi     :",
                          style: TextStyle(fontSize: 22),
                        ),
                        Text(
                          " Melukis",
                          style: TextStyle(fontSize: 22),
                        ),
                      ],
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
