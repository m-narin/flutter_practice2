// ラジオボタンを通してNull safetyの対処法

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Form'),
        ),
        body: Center(
          child: ChangeForm(),
        ),
      ),
    );
  }
}

class ChangeForm extends StatefulWidget {
  @override
  _ChangeFormState createState() => _ChangeFormState();
}

class _ChangeFormState extends State<ChangeForm> {
  String _type = '';

  // String?はnullを含む文字列型
  // null safetyは引数がnullでないことを保証する必要がある
  // 非nullのString型を使うと、関数の呼び出しの際、
  // 引数がnullになる可能性がありエラーとなる
  void _handleRadio(String? e) {
    if (e != null) {
      setState(() {
        _type = e;
      });
    }
  }

  IconData _changeIcon(String e) {

    // 初期値にnullは代入できない
    IconData icon;
    switch (e) {
      case 'thumb_up':
        icon = Icons.thumb_up;
        break;
      case 'favorite':
        icon = Icons.favorite;
        break;
      default:
        icon = Icons.thumb_up;
    }
    return icon;
  }

  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          children: <Widget>[
            Center(
              child: new Icon(
                _changeIcon(_type),
                color: Colors.orange[700],
                size: 100.0,
              ),
            ),
            new Radio(
              activeColor: Colors.blue,
              value: 'thumb_up',
              groupValue: _type,
              onChanged: _handleRadio,
            ),
            new Radio(
              activeColor: Colors.orange,
              value: 'favorite',
              groupValue: _type,
              onChanged: _handleRadio,
            ),
          ],
        ));
  }
}
