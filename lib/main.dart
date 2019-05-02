import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AgendAbac',
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
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
          IconData(58834,
              fontFamily: 'MaterialIcons', matchTextDirection: true),
          color: Colors.white,
        )),
        elevation: 0,
        title: Text('AgendAbac'),
      ),
      body: Center(
          child: SafeArea(
              child: Container(
                  constraints: BoxConstraints.expand(),
                  // , padding: EdgeInsets.symmetric(horizontal: 16) const EdgeInsets.symmetric(horizontal: 16),
                  child: _cardList()))),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
              _counter++;
            }),
        tooltip: 'Increment Counter',
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _dayTitle() {
    return SliverAppBar(
      pinned: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Icon(
                  IconData(58848,
                      fontFamily: 'MaterialIcons', matchTextDirection: true),
                  color: Colors.black)),
          Text('5 avril 2019', style: TextStyle(color: Colors.black)),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Icon(
                  IconData(58849,
                      fontFamily: 'MaterialIcons', matchTextDirection: true),
                  color: Colors.black))
        ],
      ),
      backgroundColor: Colors.white,
      expandedHeight: 150.0,
      flexibleSpace: FlexibleSpaceBar(),
    );
  }

  Widget _deliveryList(elemWidth) {
    return SliverFixedExtentList(
      itemExtent: 150.0,
      delegate: SliverChildListDelegate(
        [_cardList()],
      ),
    );
  }

  Widget _cardList() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return _card(index);
      },
    );
  }

  Widget _card(index) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const ListTile(
            leading: Icon(Icons.album),
            title: Text('LE GOFF l'),
            subtitle: Text('16 rue des retaillons'),
          ),
          ButtonTheme.bar(
            // make buttons use the appropriate styles for cards
            child: ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: const Text('Y ALLER'),
                  onPressed: () {/* ... */},
                ),
                FlatButton(
                  child: const Text('APPELER'),
                  onPressed: () {/* ... */},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
