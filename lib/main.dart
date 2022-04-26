import 'package:flutter/material.dart';
import 'package:travel_app/screens/detail_screen.dart';
import 'package:travel_app/screens/home_screen.dart';
import 'package:travel_app/screens/landing_scroller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => LandingScroller(),
        'home': (_) => HomeScreen(),
        'detail': (_) => DetailScreen(),
        // 'first': (_) => FirstScreen(),
        // 'second': (_) => SecondScreen(),
      },
    );
  }
}

// class Args {
//   String title;
//
//   Args(this.title);
// }
//
// class FirstScreen extends StatelessWidget {
//   const FirstScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Center(
//             child: InkWell(
//                 onTap: () {
//                   Navigator.of(context)
//                       .pushNamed('second', arguments: Args('image path'));
//                 },
//                 child: Hero(tag: 'h', child: Icon(Icons.image, size: 50)))));
//   }
// }
//
// class SecondScreen extends StatelessWidget {
//   const SecondScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final Args args = ModalRoute.of(context)!.settings.arguments as Args;
//
//     print(args.title);
//
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: const [Hero(tag: 'h', child: Icon(Icons.image, size: 200))],
//         ),
//       ),
//     );
//   }
// }
