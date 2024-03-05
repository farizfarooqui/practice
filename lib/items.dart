import 'package:equatable/equatable.dart';

class Item extends Equatable {
  final int id;
  final String name;

  Item({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}
