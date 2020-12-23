import 'package:example/multiple_picker_page.dart';
import 'package:example/widget/my_app_bar.dart';
import 'package:example/widget/my_text.dart';
import 'package:flutter/material.dart';

import 'address_picker_page.dart';
import 'single_picker_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primaryColor: Colors.indigoAccent, visualDensity: VisualDensity.adaptivePlatformDensity),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: MyAppBar(title: 'flutter选择器'), body: _body());
  }

  Widget _body() {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      children: [
        _itemView('地址选择器', AddressPickerPage()),
        _itemView('单列选择器', SinglePickerPage()),
        _itemView('多列选择器', MultiplePickerPage()),
      ],
    );
  }

  Widget _itemView(title, Widget page) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: RaisedButton(
          onPressed: () {
            Navigator.push(context, new MaterialPageRoute(builder: (context) => page));
          },
          child: MyText(title, color: Colors.white, toppadding: 12, bottompadding: 12),
          color: Theme.of(context).primaryColor),
    );
  }
}
