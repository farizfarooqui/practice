import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice/Favourites/bloc/UI/favourite_screen.dart';
import 'package:practice/Favourites/bloc/fav_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => FavBloc(),
        child: FavScreen(),
      ),
    );
  }
}
