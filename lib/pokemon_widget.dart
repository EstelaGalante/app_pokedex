import 'package:flutter/material.dart';
import 'detalhes.dart';
import 'pokemon.dart';

class PokemonWidget extends StatelessWidget {
  const PokemonWidget({Key? key, required this.item}) : super(key: key);
  final Pokemon item;

  @override
  Widget build(BuildContext context) {
    void goToDetalhes() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => Detalhes(
            item: item,
          ),
        ),
      );
    }

    return Card(
      child: ListTile(
        title: Text(item.name ?? ''),
        leading: Image.network(item.thumbnailImage ?? ''),
        trailing: Text('#${item.id.toString()}'),
        onTap: () {
          goToDetalhes();
        },
      ),
    );
  }
}
