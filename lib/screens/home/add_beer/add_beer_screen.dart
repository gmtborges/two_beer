import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

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
                              'New England IPA',
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
                    const BeerImage(),
                    BeerRating(),
                    Column(
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
                      margin: const EdgeInsets.symmetric(vertical: 16),
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

class BeerImage extends StatefulWidget {
  const BeerImage({
    Key? key,
  }) : super(key: key);

  @override
  State<BeerImage> createState() => _BeerImageState();
}

class _BeerImageState extends State<BeerImage> {
  File? image;

  Future _handleImage(ImageSource source) async {
    try {
      final tmpImage = await ImagePicker().pickImage(source: source);
      if (tmpImage == null) return;

      setState(() {
        image = File(tmpImage.path);
      });
    } on PlatformException catch (e) {
      print('Falha ao escolher imagem: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(5, 20, 0, 5),
          child: const Text(
            'Escolher imagem',
            style: TextStyle(fontSize: 16),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 150,
              child: OutlinedButton.icon(
                onPressed: () => _handleImage(ImageSource.gallery),
                icon: const Icon(Icons.collections),
                label: const Text(
                  'GALERIA',
                  style: TextStyle(color: Colors.black87),
                ),
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.black54),
                ),
              ),
            ),
            SizedBox(
              width: 150,
              child: OutlinedButton.icon(
                onPressed: () => _handleImage(ImageSource.camera),
                icon: const Icon(Icons.camera_alt_rounded),
                label: const Text(
                  'FOTO',
                  style: TextStyle(color: Colors.black87),
                ),
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.black54),
                ),
              ),
            )
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Center(
            child: image != null
                ? Image.file(
                    image!,
                    width: 160,
                    height: 160,
                  )
                : Image.asset(
                    'img/img-placeholder.png',
                    width: 180,
                  ),
          ),
        )
      ],
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
      margin: const EdgeInsets.fromLTRB(0, 8, 0, 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(5, 0, 0, 5),
            child: const Text(
              'Nota',
              style: TextStyle(fontSize: 16),
            ),
          ),
          Row(
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
        ],
      ),
    );
  }
}
