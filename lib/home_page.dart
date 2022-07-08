import 'dart:convert';
import 'pokemon.dart';
import 'package:app_pokedex/pokemon_widget.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Pokemon> pokemonList = [];

  @override
  void initState() {
    _getPokemon();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokedex'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.network(
              'http://raw.githubusercontent.com/RafaelBarbosatec/SimplePokedex/master/assets/pokebola_img.png',
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: pokemonList.length,
        itemBuilder: (context, index) {
          return PokemonWidget(
            item: pokemonList[index],
          );
        },
      ),
    );
  }

  void _getPokemon() {
    Uri url = Uri.parse('http://104.131.18.84/pokemon/?limit=50&page=0');

    http.get(url).then((value) {
      if (value.statusCode == 200) {
        Map json = const JsonDecoder().convert(value.body);
        setState(() {
          pokemonList = json['data'].map<Pokemon>((item) {
            return Pokemon.fromJson(item);
          }).toList();
        });
      } else {
        return [];
      }
    });
  }
}
