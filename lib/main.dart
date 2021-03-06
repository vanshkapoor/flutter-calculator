import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.cyan,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
      // home:HomePage(title:'Calcy')
      home: CalcyPage(title: 'Calculator',),
    );
  }
}
class HomePage extends StatefulWidget {

 const HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(widget.title),
        ),
      body: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
           
            Column(
              children: <Widget>[
                new MaterialButton(
                    onPressed: (){},
                    child: Text("1"),
                    color: Colors.orangeAccent,
                    textColor: Colors.black,
                  ),
                  new MaterialButton(
                    onPressed: (){},
                    child: Text("1"),
                    color: Colors.orangeAccent,
                    textColor: Colors.black,
                  ),
                  new MaterialButton(
                    onPressed: (){},
                    child: Text("1"),
                    color: Colors.orangeAccent,
                    textColor: Colors.black,
                  ),
              ],
            ),


              Column(
                children: <Widget>[
                  new MaterialButton(
                    onPressed: (){},
                    child: Text("1"),
                    color: Colors.orangeAccent,
                    textColor: Colors.black,
                  ),
                  new MaterialButton(
                    onPressed: (){},
                    child: Text("1"),
                    color: Colors.orangeAccent,
                    textColor: Colors.black,
                  ),
                  new MaterialButton(
                    onPressed: (){},
                    child: Text("1"),
                    color: Colors.orangeAccent,
                    textColor: Colors.black,
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  new MaterialButton(
                    onPressed: (){},
                    child: Text("1"),
                    color: Colors.orangeAccent,
                    textColor: Colors.black,
                  ),
                  new MaterialButton(
                    onPressed: (){},
                    child: Text("1"),
                    color: Colors.orangeAccent,
                    textColor: Colors.black,
                  ),
                  new MaterialButton(
                    onPressed: (){},
                    child: Text("1"),
                    color: Colors.orangeAccent,
                    textColor: Colors.black,
                  ),
                  
                ],
              ),
              

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.cancel),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}


class CalcyPage extends StatefulWidget {

 const CalcyPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CalcyPageState createState() => _CalcyPageState();
}

class _CalcyPageState extends State<CalcyPage> {
  
  String output="0";

  String _output="0";
  double num1=0.0;
  double num2=0.0;
  String operand="";

  String equation="";

  buttonPressed(String buttonText)
  {
    if(buttonText=='C'){
         _output="0";
         num1=0.0;
         num2=0.0;
         operand="";
         equation="";

    }else if(buttonText == "+" || buttonText == "-" || buttonText == "*" || buttonText == "/"){
      num1 = double.parse(output);
      operand = buttonText;
      _output = "0";
      equation = equation + buttonText;
    }else if(buttonText == "=")
    {
      num2 = double.parse(output);
      if(operand == "+")
      {
        _output = (num1 + num2).toString();
      }
      if(operand == "-")
      {
        _output = (num1 - num2).toString();
      }
      if(operand == "*")
      {
        _output = (num1 * num2).toString();
      }
      if(operand == "/")
      {
        _output = (num1 / num2).toString();
      }
      if(operand == "%")
      {
        _output = (num1 % num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand="";
      equation="";
      // _output = "0";
    }else{
      _output = _output + buttonText;    
      equation = equation + buttonText;   
    }

    print(_output);
    setState((){
      output = double.parse(_output).toStringAsFixed(2);
      equation = equation.toString();
    });


  }


  Widget buildButton(String buttonText){
    return Expanded(
                      child: new MaterialButton(                      
                      padding: EdgeInsets.all(24.0),                                            
                      child: Text(buttonText,style: TextStyle(
                        fontSize: 24
                      ),
                      ),
                      shape: BeveledRectangleBorder(),
                      color: Colors.black,
                      textColor: Colors.cyan,
                      onPressed: ()=>
                        buttonPressed(buttonText)                      
                  ),
          );
  }

  Widget buildfnButton(String buttonText){
    return Expanded(
                      child: new MaterialButton(
                      onPressed: ()=>
                        buttonPressed(buttonText)
                      ,
                      padding: EdgeInsets.all(24.0),                                            
                      child: Text(buttonText, style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                      shape: BeveledRectangleBorder(),
                      color: Colors.cyan,
                      textColor: Colors.black,
                  ),
          );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(widget.title, style: TextStyle(color:Colors.cyanAccent),),
        backgroundColor: Colors.black,
        ),
      body: Container(
        child: Column(
          children: <Widget>[            
            Container(
              alignment: Alignment.centerRight,
                child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(output, style: TextStyle(color:Colors.cyanAccent,fontSize: 50 )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                alignment: Alignment.bottomRight,
                child: Text(equation, style:TextStyle(color: Colors.grey,fontSize:20)),
              ),
            ),
            Expanded(child: Divider()),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    buildfnButton("+"),
                     buildfnButton("-"),
                     buildfnButton("*"),
                     buildfnButton("%"),
                     buildfnButton("/"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton("9"),
                     buildButton("8"),
                     buildButton("7"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton("6"),
                     buildButton("5"),
                     buildButton("4"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton("3"),
                     buildButton("2"),
                     buildButton("1"),
                    //  buildButton("0"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildfnButton("C"),
                     buildButton("0"),
                     buildfnButton("="),
                    //  BuildButton("0"),
                  ],
                ),
                
              ],
            ),
          ]
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){},
      //   child: Icon(Icons.cancel),
      //   ),
      //   floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
