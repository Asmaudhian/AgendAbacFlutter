import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_database/firebase_database.dart';
// import 'cardlist.dart';

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
  int _selectedIndex = 1;

  final databaseReference = FirebaseDatabase.instance.reference();
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
    final _widgetOptions = [
      _cardList(context),
      Text('COMING SOON'),
      AddDelivery(),
    ];
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   leading: IconButton(
      //       onPressed: () {},
      //       icon: Icon(
      //     IconData(58834,
      //         fontFamily: 'MaterialIcons', matchTextDirection: true),
      //     color: Colors.white,
      //   )),
      //   elevation: 0,
      //   title: Text('AgendAbac'),
      // ),
      body: Center(
          child: SafeArea(
              child: Container(
                  constraints: BoxConstraints.expand(),
                  // , padding: EdgeInsets.symmetric(horizontal: 16) const EdgeInsets.symmetric(horizontal: 16),
                  child: _widgetOptions[_selectedIndex]))),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.local_shipping), title: Text('Livraisons')),
          BottomNavigationBarItem(
              icon: Icon(Icons.history), title: Text('Historique')),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline), title: Text('Ajouter')),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _addDelivery() {
    return Container();
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
          Text('5 mai 2019', style: TextStyle(color: Colors.black)),
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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _deliveryList(context) {
    return SliverFixedExtentList(
      itemExtent: 150.0,
      delegate: SliverChildListDelegate(
        [_cardList(context)],
      ),
    );
  }

  static Widget _cardList(context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (cont, index) {
        return _card(context, index);
      },
    );
  }

  static Widget _card(context, index) {
    return Card(
      child: GestureDetector(
          onTap: () {
            print('hey');
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DeliveryDetail()),
            );
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                leading: Icon(Icons.album),
                title: Text('LE GOFF Duncan'),
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
          )),
    );
  }
}

class DeliveryDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Détails livraison"),
      ),
      body: Center(),
    );
  }
}

class AddDelivery extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<String> _colors = <String>['', 'red', 'green', 'blue', 'orange'];
  String _color = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter une livraison'),
      ),
      body: SafeArea(
          top: false,
          bottom: false,
          child: Form(
              key: _formKey,
              autovalidate: true,
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.person),
                      hintText: 'Nom du client',
                      labelText: 'Nom',
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.phone),
                      hintText: 'Numéro de téléphone du client',
                      labelText: 'Téléphone',
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.timelapse),
                      hintText: 'Durée de la livraison',
                      labelText: 'Durée',
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      WhitelistingTextInputFormatter.digitsOnly,
                    ],
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.calendar_today),
                      hintText: 'Date de livraison',
                      labelText: 'Date',
                    ),
                    keyboardType: TextInputType.datetime,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.access_time),
                      hintText: 'Heure de livraison',
                      labelText: 'Heure',
                    ),
                    keyboardType: TextInputType.datetime,
                  ),
                  Container(
                      padding: const EdgeInsets.only(left: 40.0, top: 20.0),
                      child: RaisedButton(
                        color: Colors.blue,
                        child: const Text('Ajouter livraison', style: TextStyle(color: Colors.white),),
                        onPressed: () {

                        },
                      )),
                ],
              ))),
    );
  }
}
