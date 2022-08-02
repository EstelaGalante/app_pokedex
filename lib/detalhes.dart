import 'package:app_pokedex/pokemon.dart';
import 'package:flutter/material.dart';

class Detalhes extends StatelessWidget {
  const Detalhes({Key? key, required this.item}) : super(key: key);
  final Pokemon item;

  @override
  Widget build(BuildContext context) {
    Pokemon? pokemon = ModalRoute.of(context)?.settings.arguments as Pokemon?;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(15.0),
        child: Column(children: <Widget>[
          Card(
            margin: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.brown[50]),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Text('#${item.number ?? ''}'),
                        Center(
                          child: Image.network(item.thumbnailImage ?? ' '),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Text(item.description ?? ' '),
                const SizedBox(height: 30.0),
                const Text(
                  'Tipo:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(item.type!.join(' ')),
                const SizedBox(height: 30.0),
                const Text(
                  'Fraquezas:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(item.weakness!.join(' ')),
                const SizedBox(height: 20.0),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
