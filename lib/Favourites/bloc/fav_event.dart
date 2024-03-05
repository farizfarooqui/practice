part of 'fav_bloc.dart';

abstract class FavEvent extends Equatable {
  const FavEvent();

  @override
  List<Object> get props => [];
}

class AddToFavourite extends FavEvent {
  final Item item;

  AddToFavourite(this.item);
  @override
  List<Object> get props => [];
}
class RemoveFromFavourite  extends FavEvent {
   final Item item;

  RemoveFromFavourite(this.item);
  @override
  List<Object> get props => [item];
}
