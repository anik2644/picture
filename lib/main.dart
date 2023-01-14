/*
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(new MaterialApp(
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  State createState() => new HomeState();
}

class HomeState extends State<Home> {

  TextEditingController keyInputController = new TextEditingController();
  TextEditingController valueInputController = new TextEditingController();

  late File jsonFile;
  late Directory dir;
  String fileName = "button.json";
  bool fileExists = false;
  late Map<String, dynamic> fileContent;

  @override
  void initState() {
    super.initState();
    getApplicationDocumentsDirectory().then((Directory directory) {
      dir = directory;
      jsonFile = new File(dir.path + "/" + fileName);
      fileExists = jsonFile.existsSync();
      if (fileExists) this.setState(() => fileContent = JSON.decode(jsonFile.readAsStringSync()));
    });
  }

  @override
  void dispose() {
    keyInputController.dispose();
    valueInputController.dispose();
    super.dispose();
  }

  void createFile(Map<String, dynamic> content, Directory dir, String fileName) {
    print("Creating file!");
    File file = new File(dir.path + "/" + fileName);
    file.createSync();
    fileExists = true;
    file.writeAsStringSync(JSON.encode(content));
  }

  void writeToFile(String key, dynamic value) {
    print("Writing to file!");
    Map<String, dynamic> content = {key: value};
    if (fileExists) {
      print("File exists");
      Map<String, dynamic> jsonFileContent = json.decode(jsonFile.readAsStringSync());
      jsonFileContent.addAll(content);
      jsonFile.writeAsStringSync(JSON.encode(jsonFileContent));
    } else {
      print("File does not exist!");
      createFile(content, dir, fileName);
    }
    this.setState(() => fileContent = JSON.decode(jsonFile.readAsStringSync()));
    print(fileContent);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("JSON Tutorial"),),
      body: new Column(
        children: <Widget>[
          new Padding(padding: new EdgeInsets.only(top: 10.0)),
          new Text("File content: ", style: new TextStyle(fontWeight: FontWeight.bold),),
          new Text(fileContent.toString()),
          new Padding(padding: new EdgeInsets.only(top: 10.0)),
          new Text("Add to JSON file: "),
          new TextField(
            controller: keyInputController,
          ),
          new TextField(
            controller: valueInputController,
          ),
          new Padding(padding: new EdgeInsets.only(top: 20.0)),
          new  TextButton(
            child: new Text("Add key, value pair"),
            onPressed: () => writeToFile(keyInputController.text, valueInputController.text),
          )
        ],
      ),
    );
  }
}

*/


import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:testjson/User.dart';

void main() {
  runApp(const MyApp());
}
class CounterStroge{
  Future<String> get _localpath async{
    final directory = await getApplicationDocumentsDirectory();
    return directory.path ;
  }
  Future<File> get _localFile async{
    final path = await _localpath;

    print(path.toString());
    print("myPath");
    return File("$path/User.json");

  }
  Future<String> readCounter() async{
    try{
      final file = await _localFile;

      String contents = await file.readAsString();
      return contents.toString();
    }
    catch(e)
    {
      print(e);
      return e.toString();
    }
  }

  Future<File> writeCounter(int counter) async{

    final file= await _localFile;

     // var rawJSON = await json.decode(await DefaultAssetBundle.of(context)
    //      .loadString('jsonfile/User.json'));
    //  rawJSON['name'] = "NewCompany";
    //

    User us = new User("Mhd$counter", "annonymous");


      var var1 = json.encode(us.toJson());
    //
    //  print(var1.toString());
    //  await file.openWrite();
    //  await file.writeAsString(var1);

    return file.writeAsString('$var1');
  }
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
      home: MyHomePage(title: 'Flutter Demo Home Page'),//Home(),// const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
 final CounterStroge stroge = CounterStroge();

 MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String dis= "nothing";

  // _MyHomePageState(){
  @override
  void initState(){
  widget.stroge.readCounter().then((value) => {
    setState((){
      dis =value;
     // _counter =value;
    })
  });
}

Future<File> _incrementCounter(){
    _counter++;
  setState(() {

    widget.stroge.readCounter().then((value) => {
      setState((){
        dis =value;
        // _counter =value;
      })
    });
  });

  return widget.stroge.writeCounter(_counter);

    // setState(() {
    //
    // });
}


/*
  void _incrementCounter() {

   // Navigator.push(context, MaterialPageRoute(builder: (context) => Second()));

print("done");

    setState(() {
      _counter++;
    });
  }
*/
  // late File jsonFile;
  // late Directory dir;
  // String fileName = "button.json";
  // bool fileExists = false;
  // late Map<String, dynamic> fileContent;

/*
  updateJson() async {

   //  print("object");
   //
   //  getApplicationDocumentsDirectory().then((Directory directory) {
   //    dir = directory;
   //  });
   //
   //
   //
   //
   // File file =File(dir.path + "C:\Users\Anik\StudioProjects\TestJson\jsonfile\User.json");
   // // dir.path + C:\Users\Anik\StudioProjects\TestJson\jsonfile\User.json'.
   //  //File file = File("C:\Users\Anik\StudioProjects\TestJson\jsonfile\User.json");
   //  var rawJSON = await json.decode(await DefaultAssetBundle.of(context)
   //      .loadString('jsonfile/User.json'));
   //  rawJSON['name'] = "NewCompany";
   //
   //  var var1 = json.encode(rawJSON);
   //
   //  print(var1.toString());
   //  await file.openWrite();
   //  await file.writeAsString(var1);
   //  print(var1.toString());

  }
-*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
       body: Center (
         child:
         Column(
           children: [
             Text("$_counter"),
             Text("$dis",style: TextStyle(fontSize: 20),),
             Image.network("https://raw.githubusercontent.com/anik2644/picture/development/lib/pics/Anik.jpg"),
           ],
         )
       ),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
       /*
            () async {

          _incrementCounter();
          //
          //
          // final jsondata = await rootBundle.rootBundle.loadString('jsonfile/User.json');
          // print(jsondata.toString());
          // Map<String, dynamic> userMap = jsonDecode(jsondata);
          // var user = User.fromJson(userMap);
          //
          // print('Howdy, ${user.name}!');
          // print('We sent the verification link to ${user.email}.');




         //  updateJson();
         // // user.name = "anik";
         //  User us = new User("mhd", "mhdank@gmail.com");
         //
         //  String json = jsonEncode(us);



        },
        */
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );


  }
}




/*
import 'dart:convert';
//import 'dart:html';
import 'dart:io';
import 'package:flutter/services.dart' as rootBundle;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:testjson/Second.dart';
import 'package:testjson/User.dart';
import 'package:testjson/screens/home.dart';

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
      home: MyHomePage(title: 'Flutter Demo Home Page'),//Home(),// const MyHomePage(title: 'Flutter Demo Home Page'),
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

  late File jsonFile;
  late Directory dir;
  String fileName = "button.json";
  bool fileExists = false;
  late Map<String, dynamic> fileContent;


  updateJson() async {

    print("object");

    getApplicationDocumentsDirectory().then((Directory directory) {
      dir = directory;
      //jsonFile = new File(dir.path + "/" + fileName);
     // fileExists = jsonFile.existsSync();
      //if (fileExists) this.setState(() => fileContent = JSON.decode(jsonFile.readAsStringSync()));
    });




   File file =File(dir.path + "C:\Users\Anik\StudioProjects\TestJson\jsonfile\User.json");
   // dir.path + C:\Users\Anik\StudioProjects\TestJson\jsonfile\User.json'.
    //File file = File("C:\Users\Anik\StudioProjects\TestJson\jsonfile\User.json");
    var rawJSON = await json.decode(await DefaultAssetBundle.of(context)
        .loadString('jsonfile/User.json'));


   // final rawJSON = await rootBundle.rootBundle.loadString('jsonfile/User.json');
    //print(rawJSON.toString());

    rawJSON['name'] = "NewCompany";

    var var1 = json.encode(rawJSON);

    print(var1.toString());

    //await file.writeAsString(var1);
    await file.openWrite();
    await file.writeAsString(var1);
    print(var1.toString());

  }


  @override
  Widget build(BuildContext context) {
    return //Home();



      Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
       body: //Home(),

       Center (
         child:
         Image.network("https://raw.githubusercontent.com/anik2644/picture/development/lib/pics/Anik.jpg")
         /*
         CachedNetworkImage(
           placeholder: (context, url) => CircularProgressIndicator(),
           imageUrl: "https://raw.githubusercontent.com/anik2644/picture/development/lib/pics/Anik.jpg",
         ),
         */
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
        onPressed: () async {


          /*
          getApplicationDocumentsDirectory().then((Directory directory) {
            dir = directory;
            //jsonFile = new File(dir.path + "/" + fileName);
            fileExists = jsonFile.existsSync();
            //if (fileExists) this.setState(() => fileContent = JSON.decode(jsonFile.readAsStringSync()));
          });
*/



          final jsondata = await rootBundle.rootBundle.loadString('jsonfile/User.json');
          print(jsondata.toString());
          Map<String, dynamic> userMap = jsonDecode(jsondata);
          var user = User.fromJson(userMap);

          print('Howdy, ${user.name}!');
          print('We sent the verification link to ${user.email}.');




          updateJson();
         // user.name = "anik";
          User us = new User("mhd", "mhdank@gmail.com");

          String json = jsonEncode(us);
         // jsondata.writeAsStringSync(JSON.encode(jsonFileContent));


        },
        //_incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );


  }
}

*/