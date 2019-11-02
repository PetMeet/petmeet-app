import 'package:flutter/material.dart';
import 'injection_container.dart' as di;

void main() {
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PetMeet Structure',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'PetMeet'),
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
  bool favoritePressed;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _buildList(),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildList() {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (BuildContext context, index) {
        return _buildCard();
      },
    );
  }

  Widget _buildCard() {
    return SizedBox(
      height: 560.0,
      child: Card(
        elevation: 2,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(),
                ),
                Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(children: <Widget>[
                      Text("Pancho"),
                      Text("Vilapeixiño"),
                    ])),
              ],
            ),
            Expanded(
              child: Image(
                  fit: BoxFit.fitWidth,
                  image: NetworkImage('https://cataas.com/cat')),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(children: <Widget>[
                FavoriteStateWidget(),
              ]),
            )
          ],
        ),
      ),
    );
  }
}

class FavoriteStateWidget extends StatefulWidget {
  FavoriteStateWidget({Key key}) : super(key: key);

  @override
  _FavoriteStateWidget createState() {
    return _FavoriteStateWidget();
  }
}

class _FavoriteStateWidget extends State<FavoriteStateWidget> {
  bool favoritePressed;

  _setFavorite() {
    if (favoritePressed != null && favoritePressed) {
      favoritePressed = false;
    } else {
      favoritePressed = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          _setFavorite();
        });
      },
      icon: favoritePressed != null && favoritePressed
          ? Icon(
              Icons.favorite,
              color: Colors.red,
            )
          : Icon(Icons.favorite_border, color: Colors.red),
    );
  }
}
