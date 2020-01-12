import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MaterialApp(
        title: "Home",
        home: Scaffold(
          appBar: AppBar(
            title: Text("Home Page"),
            centerTitle: true,
          ),
          body: Center(
              child: RaisedButton(
            onPressed: () {
              _navigateToScreen(context);
            },
            child: Text("Goto details page"),
          )),
        ),
      ),
    );
  }

  void _navigateToScreen(BuildContext context) async {
//we are passing the title to display in the details page
    //via navigator
    String result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (BuildContext context) => Details("fruits")),
    );

    print("you chose $result");
  }
}

class Details extends StatelessWidget {
  String pageTitle;
  //the page title is passed to constructor from home page
  Details(this.pageTitle);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitle),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              Text("This is the detail page"),
              RaisedButton(
                color: Colors.blue,
                child: Text("Grapes"),
                onPressed: () {
                  Navigator.of(context).pop("grapes");
                },
              ),
              RaisedButton(
                color: Colors.green,
                child: Text("Apples"),
                onPressed: () {
                  Navigator.of(context).pop("apples");
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
