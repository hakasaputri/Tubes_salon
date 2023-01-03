import 'package:flutter/material.dart';

class MyHomePage2 extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage2> {
  List<String> sections = ['Main Treatment', 'Side Treatment', 'Styling'];
  List<List<String>> items = [
    ['Shampoo', 'Conditioner'],
    ['Hair mask', 'Hair tonic', 'Hair vitamin', 'Serum'],
    [
      'Straightening',
      'Curling/Waving',
      'Blow drying',
      'Volumizing',
      'Texturizing'
    ],
  ];
  List<List<bool>> _isCompleted = [
    [false, false],
    [false, false, false, false],
    [false, false, false, false, false],
  ];

  Widget _buildTodoList() {
    return ListView.builder(
      itemCount: sections.length,
      itemBuilder: (context, index) {
        return ExpansionTile(
          title: Text(sections[index]),
          children: <Widget>[
            ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: items[index].length,
              itemBuilder: (context, i) {
                return CheckboxListTile(
                  value: _isCompleted[index][i],
                  onChanged: (bool? value) {
                    setState(() {
                      _isCompleted[index][i] = value as bool;
                      });
                    });
                  },
                  title: Text(items[index][i]),
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffffb0b0),
        title: Text(
          'Detail Treatment',
          textAlign: TextAlign.center,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: _buildTodoList(),
    );
  }
}
