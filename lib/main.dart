import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:testjson/Second.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;

  void _incrementCounter() {
    
    Navigator.push(context, MaterialPageRoute(builder: (context) => Second()));

print("done");

    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
       body: Center(
         child:
         //Image.network("https://raw.githubusercontent.com/anik2644/picture/development/lib/pics/Anik.jpg")

         CachedNetworkImage(
           placeholder: (context, url) => CircularProgressIndicator(),
           imageUrl: "https://raw.githubusercontent.com/anik2644/picture/development/lib/pics/Anik.jpg" b,
         ),

       ),
      // Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: <Widget>[
      //
      //     CachedNetworkImage(
      //       imageUrl: "https://thumbs.dreamstime.com/b/google-corporation-building-sign-zurich-switzerland-march-69727845.jpg",
      //       imageBuilder: (context, imageProvider) => Container(
      //         decoration: BoxDecoration(
      //           image: DecorationImage(
      //               image: imageProvider,
      //               fit: BoxFit.cover,
      //               colorFilter:
      //               ColorFilter.mode(Colors.red, BlendMode.colorBurn)),
      //         ),
      //       ),
      //       placeholder: (context, url) => CircularProgressIndicator(),
      //       errorWidget: (context, url, error) => Icon(Icons.error),
      //     ),
      //
      // //
      // //    Image.network(
      // // 'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif'),
      //   //  Image.network("https://thumbs.dreamstime.com/b/google-corporation-building-sign-zurich-switzerland-march-69727845.jpg"),
      //  //   Image.network( "https://raw.githubusercontent.com/anik2644/picture/development/lib/pics/Anik.jpg"),
      //     // const Text(
      //     //   'You have pushed the button this many times:',
      //     // ),
      //     // Text(
      //     //   '$_counter',
      //     //   style: Theme.of(context).textTheme.headline4,
      //     // ),
      //   ],
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

