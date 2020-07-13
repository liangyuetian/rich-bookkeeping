import 'package:flutter/material.dart';
import 'package:flutterproject/common/dialog.dart';
import 'package:flutterproject/net/net_util.dart';

import 'common/toast.dart';
import 'common/dialog.dart' as dialog;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      ToastUtil.show("----------$_counter---------");
      _counter++;
//      Toast.show("$_counter", context);
//      _showDialog();
//      _showLoadDialog();
//      Toast.show(context,msg: "----------$_counter---------");
      var params = {"phone":"18614005205","password":"14e1b600b1fd579f47433b88e8d85291"};
      NetUtil.login(params, success: (responce) {
      }, failure: (code, errorMsg) {
        print("report - code: $code errorMsg: $errorMsg");
      });
    });
  }

  void _showDialog() async {
    var result = await dialog.showAlert(context);
    print("------ $result");
  }

  void _showLoadDialog() async {
    LoadingDialog().show(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
