import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:math';

import 'favourite_quotes.dart';

class QuoteScreen extends StatefulWidget {
  @override
  _QuoteScreenState createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  final List<String> _quotes = [
    "The difference between the impossible and the possible lies in a man's determination - Tommy Lasorda",
    "We do not want to tell our dreams, we want to show them. - Cristiano Ronaldo",
    "Do not be afraid of failure. This is the way to succeed - LeBron James",
     "If my mind can conceive it and my heart can believe it - then I can achieve it. - Muhammad Ali",
     "Strength does not come from winning. Your struggles develop your strengths. - Arnold Schwarzenegger",
     "Overpower. Overtake. Overcome. - Serena Williams",
      "You have to expect things of yourself before you can do them. - Michael Jordan",
  "If something stands between you and your success, move it. Never be denied.” - Dwayne “The Rock” Johnson",
  "Everybody believes in something... Most of all, we should believe in ourselves.— Novak Djokovic",
    "Never Give Up - John Cena",


  ];
  String _currentQuote = "";
  List<String> _favoriteQuotes = [];

  @override
  void initState() {
    super.initState();
    _loadQuote();
    _loadFavorites();
  }

  void _loadQuote() {
    final random = Random();
    setState(() {
      _currentQuote = _quotes[random.nextInt(_quotes.length)];
    });
  }

  void _saveToFavorites(String quote) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _favoriteQuotes.add(quote);
    });
    prefs.setStringList('favorites', _favoriteQuotes);
  }

  void _loadFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _favoriteQuotes = prefs.getStringList('favorites') ?? [];
    });
  }

  void _shareQuote(String quote) {
    Share.share(quote);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        title: Text('Motivational Quotes',style: TextStyle(color: Colors.white,fontSize: 24, fontStyle: FontStyle.italic,fontWeight: FontWeight.w400),),
        backgroundColor: Colors.black,
       ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _currentQuote,
              style: TextStyle(fontSize: 24.0, fontStyle: FontStyle.italic),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.refresh),
                  onPressed: _loadQuote,
                ),
                IconButton(
                  icon: Icon(Icons.favorite),
                  onPressed: () {
                    _saveToFavorites(_currentQuote);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () {
                    _shareQuote(_currentQuote);
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FavoritesScreen(favorites: _favoriteQuotes),
                  ),
                );
              },
              child: Text('View Favorites'),
            ),
          ],
        ),
      ),
    );
  }
}