import 'package:flutter/material.dart';

const String APP_TITLE = 'Flutter UI Example';
const double ACTIONBAR_HEIGHT = kToolbarHeight * 2;

void main() => runApp(UIExample());

class UIExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: APP_TITLE,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ), // ThemeData()
      home: HomeRoute(),
    ); // MaterialApp()
  }
}

class HomeRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //
    final double screenHeight = MediaQuery.of(context).size.height;
    final double notificationPanelHeight = MediaQuery.of(context).padding.top;
    final double statusBarHeight = MediaQuery.of(context).padding.bottom;
    final double appBarHeight = ACTIONBAR_HEIGHT;
    final double bodyHeight =
        screenHeight - notificationPanelHeight - statusBarHeight - appBarHeight;

    return Scaffold(
      appBar: ActionBar(),
      body: AppBody(appBodyHeight: bodyHeight),
    ); // Scaffold()
  }
}

class ActionBar extends StatelessWidget implements PreferredSizeWidget {
  //
  @override
  /* getter PreferredSizeWidget.preferredSize */
  Size get preferredSize => Size.fromHeight(ACTIONBAR_HEIGHT);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: AppBar(
        title: Text('AppBar'),
        centerTitle: true,
        leading: Icon(Icons.auto_awesome),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
          ), // IconButton()
        ], // List<Widget>[]
        bottom: TabBar(
          tabs: <Widget>[
            Tab(text: 'Tab 1'),
            Tab(text: 'Tab 2'),
            Tab(text: 'Tab 3'),
          ], // List<Widget>[]
        ), // TabBar()
      ), // AppBar()
    ); // DefaultTabController()
  }
}

class AppBody extends StatelessWidget {
  AppBody({Key key, this.appBodyHeight}) : super(key: key);

  final double appBodyHeight;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container1(height: appBodyHeight / 2),
            Container2(height: appBodyHeight / 2),
          ], // List<Widget>[]
        ), // Column()
      ), // SingleChildScrollView()
    ); // SafeArea()
  }
}

class Container1 extends StatefulWidget {
  Container1({Key key, this.height}) : super(key: key);

  final double height;

  @override
  _Container1 createState() => _Container1();
}

class _Container1 extends State<Container1> {
  //
  bool _checkBox1Value = false;
  bool _checkBox2Value = false;

  bool _switchValue = false;

  int _radioGroupValue = 0;

  int _dropdownMenuValue = 0;

  void _checkBox1ValueChanged(bool value) {
    setState(() => _checkBox1Value = value);
  }

  void _checkBox2ValueChanged(bool value) {
    setState(() => _checkBox2Value = value);
  }

  void _switchValueChanged(bool value) {
    setState(() => _switchValue = value);
  }

  void _radioValueChanged(int value) {
    setState(() {
      _radioGroupValue = value;
      switch (_radioGroupValue) {
        case 0:
          break;
        case 1:
          break;
        case 2:
          break;
      }
    });
  }

  void _dropdownMenuValueChanged(dynamic value) {
    setState(() => _dropdownMenuValue = value);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height - 10.0,
      width: double.infinity,
      margin: const EdgeInsets.all(5.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.indigo,
          width: 2.0,
        ), // Border.all()
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
      ), // BoxDecoration()
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(
            flex: 1,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Text(
                    'Text',
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      letterSpacing: 5.0,
                    ), // TextStyle()
                  ), // Text()
                  Row(
                    children: <Widget>[
                      Checkbox(
                        value: _checkBox1Value,
                        onChanged: _checkBox1ValueChanged,
                      ), // Checkbox()
                      Checkbox(
                        value: _checkBox2Value,
                        onChanged: _checkBox2ValueChanged,
                      ), // Checkbox()
                      Switch(
                        value: _switchValue,
                        onChanged: _switchValueChanged,
                      ), // Switch()
                    ], // List<Widget>[]
                  ), // Row()
                  Row(
                    children: <Widget>[
                      Radio(
                        value: 0,
                        groupValue: _radioGroupValue,
                        onChanged: _radioValueChanged,
                      ), // Radio()
                      Radio(
                        value: 1,
                        groupValue: _radioGroupValue,
                        onChanged: _radioValueChanged,
                      ), // Radio()
                      Radio(
                        value: 2,
                        groupValue: _radioGroupValue,
                        onChanged: _radioValueChanged,
                      ), // Radio()
                    ], // List<Widget>[]
                  ), // Row()
                  DropdownButton(
                    value: _dropdownMenuValue,
                    items: <DropdownMenuItem>[
                      DropdownMenuItem(
                        value: 0,
                        child: Text('_'),
                      ), // DropdownMenuItem()
                      DropdownMenuItem(
                        value: 1,
                        child: Text('Menu Item 1'),
                      ), // DropdownMenuItem()
                      DropdownMenuItem(
                        value: 2,
                        child: Text('Menu Item 2'),
                      ), // DropdownMenuItem()
                      DropdownMenuItem(
                        value: 3,
                        child: Text('Menu Item 3'),
                      ), // DropdownMenuItem()
                      DropdownMenuItem(
                        value: 4,
                        child: Text('Menu Item 4'),
                      ), // DropdownMenuItem()
                      DropdownMenuItem(
                        value: 5,
                        child: Text('Menu Item 5'),
                      ), // DropdownMenuItem()
                    ], // List<DropdownMenuItem>[]
                    onChanged: _dropdownMenuValueChanged,
                  ), // DropdownButton()
                ], // List<Widget>[]
              ), // Column()
            ), // SingleChildScrollView()
          ), //  Flexible()
          Flexible(
            flex: 1,
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: <Widget>[
                    FlatButton(
                      onPressed: () {},
                      child: Text('Flat Button'),
                    ), // FlatButton()
                    OutlineButton(
                      onPressed: () {},
                      child: Text('OutlineButton'),
                    ), // OutlineButton()
                    RaisedButton(
                      onPressed: () {},
                      child: Text('RaisedButton'),
                      color: Colors.blueGrey,
                      textColor: Colors.white,
                      elevation: 10.0,
                    ), // RaisedButton()
                    TextField(
                      autocorrect: true,
                      decoration: InputDecoration(
                        hintText: 'TextField',
                        border: OutlineInputBorder(),
                        isDense: true,
                        contentPadding: EdgeInsets.all(8.0),
                      ), // InputDecoration()
                    ), // TextField()
                  ], // List<Widget>[]
                ), // Column()
              ), // Center()
            ), // SingleChildScrollView()
          ), // Flexible()
        ], // List<Widget>[]
      ), // Row()
    ); // Container()
  }
}

class Container2 extends StatelessWidget {
  Container2({Key key, this.height}) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height - 10.0,
      width: double.infinity,
      margin: const EdgeInsets.all(5.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.orange,
          width: 2.0,
        ), // Border.all(
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
      ), // BoxDecoration(
      child: Row(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0),
            height: double.infinity,
            color: Colors.lightBlueAccent,
            child: Text('Row 1'),
          ), // Container()
          Container(
            margin: const EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0),
            height: double.infinity,
            color: Colors.yellow,
            child: Text('Row 2'),
          ), // Container()
          Container(
            margin: const EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0),
            height: double.infinity,
            color: Colors.lightGreen,
            child: Text('Row 3'),
          ), // Container()
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0),
                    width: double.infinity,
                    color: Colors.yellowAccent,
                    child: Text('Column 1'),
                  ), // Container()
                  Container(
                    margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0),
                    width: double.infinity,
                    color: Colors.orangeAccent,
                    child: Text('Column 2'),
                  ), // Container()
                  Container(
                    margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 15.0),
                    width: double.infinity,
                    color: Colors.cyanAccent,
                    child: Text('Column 3'),
                  ), // Container()
                  Image(
                    width: 100.0,
                    height: 100.0,
                    image: const AssetImage('images/flutter_logo.png'),
                  ), // Image()
                ], // List<Widget>[]
              ), // Column()
            ), // SingleChildScrollView()
          ), // Expanded()
        ], // List<Widget>[]
      ), // Row()
    ); // Container()
  }
}
