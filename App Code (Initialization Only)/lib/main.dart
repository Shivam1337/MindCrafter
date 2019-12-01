import 'package:flutter/material.dart';
import 'package:mindcrafter/test.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MindCrafter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'MindCrafter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  List<String> a =[];
  final _controller = TextEditingController();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFF1255),

        centerTitle: true,
        title: Text('MindCrafter',style: TextStyle(
          fontFamily: 'Fred',
          letterSpacing: 1,
        ),),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                children: a.map((i){
                  return Container(
                    decoration: BoxDecoration(
                        color: Color(0xffFF1255),
                        borderRadius: BorderRadius.circular(50)
                    ),
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.symmetric(horizontal: 8,vertical: 5),
                    width: MediaQuery.of(context).size.width/2,
                    child: Text(i,style: TextStyle(fontFamily: 'Fred',letterSpacing: 1,color: Colors.white),textAlign: TextAlign.center,),
                  );
                }).toList(),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            color: Color(0xffFF1255),
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.markunread,color: Colors.white,),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 2,horizontal: 5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)
                  ),
                  width: MediaQuery.of(context).size.width-100,
                  child: TextField(
                    controller: _controller,
                    cursorColor: Color(0xffFF1255),
                    style: TextStyle(color: Colors.black,),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.white
                    ),
                  ),
                ),
                FloatingActionButton(
                  mini: true,
                  backgroundColor: Colors.white,
                  onPressed: (){
                    if(_controller.text.isNotEmpty){
                      setState(() {
                        a.add(_controller.text);
                      });
                      _controller.clear();
                    }
                  },
                  child: Icon(Icons.send,color: Color(0xffFF1255),),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
