import 'package:flutter/material.dart';

class profilepage extends StatelessWidget {
  const profilepage({super.key});

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white10,
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {},
              child: Icon(
                isDark ? Icons.wb_sunny : Icons.nights_stay_outlined,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(50),
          child: Column(
            children: [
              SizedBox(
                width: 120,
                height: 120,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset("assets/images/chris.webp")),
              ),
              const SizedBox(height: 10),
              Text(
                "Shikhar Singh",
                style: Theme.of(context).textTheme.headline5,
              ),
              Text("Shikhars369@gmail.com",
                  style: Theme.of(context).textTheme.bodyText2),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 255, 238, 0))),
                  onPressed: () {},
                  child: const Text(
                    "Edit Profile",
                    style: TextStyle(color: Color.fromARGB(221, 0, 0, 0)),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Divider()
            ],
          ),
        ),
      ),
    );
  }
}
