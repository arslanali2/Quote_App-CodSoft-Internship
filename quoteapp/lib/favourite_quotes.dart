import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:math';

class FavoritesScreen extends StatelessWidget {
  final List<String> favorites;

  FavoritesScreen({required this.favorites});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Quotes',style: TextStyle(fontStyle: FontStyle.italic,color: Colors.black,fontSize: 24,
        fontWeight: FontWeight.w400),),
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(favorites[index]),
          );
        },
      ),
    );
  }
}
