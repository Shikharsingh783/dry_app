import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'profilepage.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset("assets/images/Push-2.mp4");
    _controller.play();
    _controller.setLooping(true);
    _initializeVideoPlayerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: InkWell(
          onTap: () {
            Navigator.push(
                context,
                PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 200),
                    transitionsBuilder:
                        (context, animation, animationTime, child) {
                      CurvedAnimation;
                      {
                        Curves.elasticInOut;
                      }
                      ;
                      return ScaleTransition(
                        alignment: Alignment.topLeft,
                        scale: animation,
                        child: child,
                      );
                    },
                    pageBuilder: (context, animation, animationTime) {
                      return const profilepage();
                    }));
          },
          child: const Icon(
            Icons.person_2_outlined,
          ),
        ),
        title: const Text("Home"),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          10.0,
        ),
        child: FutureBuilder(
          future: _initializeVideoPlayerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    if (_controller.value.isPlaying) {
                      _controller.pause();
                    } else {
                      _controller.play();
                    }
                  });
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  ),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 30, left: 5, right: 5),
        child: GNav(
          haptic: true,
          gap: 8,
          tabActiveBorder: Border.all(
            color: Colors.black87,
            width: 1,
          ),
          padding: const EdgeInsets.all(15),
          tabs: const [
            GButton(
              icon: Icons.home,
              iconSize: 27,
              text: 'Home',
            ),
            GButton(
              icon: Icons.sports_gymnastics,
              iconSize: 27,
              text: 'Workouts',
            ),
            GButton(
              icon: Icons.search,
              iconSize: 27,
              text: 'Search',
            ),
            GButton(
              icon: Icons.settings,
              iconSize: 27,
              text: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}

// Route _createRoute() {
//   return PageRouteBuilder(
//     pageBuilder: (context, animation, secondaryAnimation) =>
//         const profilepage(),
//     transitionsBuilder: (context, animation, secondaryAnimation, child) {
//       const begin = Offset(0.0, 1.0);
//       const end = Offset.zero;
//       const curve = Curves.ease;

//       var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

//       return SlideTransition(
//         position: animation.drive(tween),
//         child: child,
//       );
//     },
//   );
// }
