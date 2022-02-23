import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddBeerScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddBeerScreenState();
}

class _AddBeerScreenState extends State<AddBeerScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isFavorite = false;

  Future<void> _saveBeer() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[800],
        elevation: 0,
      ),
      backgroundColor: Colors.amber[800],
      body: Column(
        children: [
          const SizedBox(
            width: double.maxFinite,
            height: 40,
            child: Text(
              'Adicionar Cerveja',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              ),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(5, 0, 0, 5),
                            child: const Text(
                              'Nome',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Campo não pode ser vazio.';
                              }
                              if (value.length > 50) {
                                return 'Tamanho máximo de 50 caracteres';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(12),
                              isDense: true,
                              filled: true,
                              fillColor: Colors.grey[200],
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(5, 0, 0, 5),
                            child: const Text(
                              'Cervejaria',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Campo não pode ser vazio.';
                              }
                              if (value.length > 50) {
                                return 'Tamanho máximo de 50 caracteres';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(12),
                              isDense: true,
                              filled: true,
                              fillColor: Colors.grey[200],
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(5, 0, 0, 5),
                            child: const Text(
                              'Tipo',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          DropdownButtonFormField(
                            items: <String>[
                              'Lager',
                              'Pilsner',
                              'Weiss',
                              'Witber',
                              'Sour',
                              'Blond Ale',
                              'Brown Ale',
                              'Belgian Ale',
                              'India Pale Ale',
                              'American Pale Ale',
                              'New England Pale Ale',
                              'Bock',
                              'Dunkel',
                              'Porter',
                              'Stout',
                            ].map<DropdownMenuItem<String>>(
                              (String e) {
                                return DropdownMenuItem(
                                  value: e,
                                  child: Text(e),
                                );
                              },
                            ).toList(),
                            onChanged: (String? value) {},
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(12),
                              isDense: true,
                              filled: true,
                              fillColor: Colors.grey[200],
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(5, 0, 0, 5),
                                child: const Text(
                                  'ABV',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 16),
                                child: TextFormField(
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                    decimal: true,
                                    signed: true,
                                  ),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                      RegExp(r"^\d+\.?\d{0,2}"),
                                    )
                                  ],
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.all(12),
                                    isDense: true,
                                    filled: true,
                                    fillColor: Colors.grey[200],
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(5, 0, 0, 5),
                                child: const Text(
                                  'IBU',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              TextFormField(
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                  decimal: true,
                                  signed: true,
                                ),
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                    RegExp(r"^\d+\.?\d{0,2}"),
                                  )
                                ],
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(12),
                                  isDense: true,
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    BeerRating(),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(5, 10, 0, 5),
                            child: const Text(
                              'Observações',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.multiline,
                            minLines: 4,
                            maxLines: null,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(12),
                              isDense: true,
                              filled: true,
                              fillColor: Colors.grey[200],
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          child: const Text(
                            'Favorita?',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Switch(
                          value: isFavorite,
                          onChanged: (value) {
                            setState(() {
                              isFavorite = value;
                            });
                          },
                          activeColor: Colors.blueGrey[600],
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 12),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Cerveja salva!')),
                            );
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Colors.blueGrey[500],
                          ),
                          padding: MaterialStateProperty.all(
                            const EdgeInsets.all(12),
                          ),
                        ),
                        child: const Text(
                          'Salvar',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BeerRating extends StatefulWidget {
  @override
  State<BeerRating> createState() => _BeerRatingState();
}

class _BeerRatingState extends State<BeerRating> {
  int score = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 16, 0, 4),
      child: Row(
        children: List.generate(5, (index) {
          return IconTheme(
            data: const IconThemeData(color: Colors.orange, size: 28),
            child: IconButton(
              onPressed: () {
                setState(() {
                  if (score == 1 && index == 0) {
                    score = 0;
                  } else {
                    score = index + 1;
                  }
                });
              },
              icon: index < score
                  ? const Icon(Icons.sports_bar)
                  : const Icon(Icons.sports_bar_outlined),
            ),
          );
        }),
      ),
    );
  }
}
