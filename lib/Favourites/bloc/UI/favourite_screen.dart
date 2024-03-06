import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice/Favourites/bloc/fav_bloc.dart';
import 'package:practice/items.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favourite List Bloc')),
      body: const Column(
        children: <Widget>[
          Expanded(
            child: ItemList(),
          ),
          AddItemButton(),
        ],
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  const ItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavBloc, FavState>(
      builder: (context, state) {
        if (state is FavouriteLoaded) {
          return ListView.builder(
            itemCount: state.favourites.length,
            itemBuilder: (context, index) {
              Item item = state.favourites[index];
              return ListTile(
                title: Text(item.name),
                trailing: IconButton(
                  icon: const Icon(Icons.favorite, color: Colors.red),
                  onPressed: () =>
                      context.read<FavBloc>().add(RemoveFromFavourite(item)),
                ),
              );
            },
          );
        }
        return const Center(child: Text('No Favourites Yet'));
      },
    );
  }
}

class AddItemButton extends StatelessWidget {
  const AddItemButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        final item = Item(
            id: DateTime.now().millisecondsSinceEpoch,
            name: 'Item ${DateTime.now()}');
        context.read<FavBloc>().add(AddToFavourite(item));
      },
      child: const Text('Add Random Item to Favourites'),
    );
  }
}
