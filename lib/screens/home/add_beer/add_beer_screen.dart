import 'package:flutter/material.dart';

class AddBeerScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddBeerScreenState();
}

class _AddBeerScreenState extends State<AddBeerScreen> {
  final _formKey = GlobalKey<FormState>();

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
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const InputFormField('Nome'),
                    const InputFormField('Cervejaria'),
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

class InputFormField extends StatelessWidget {
  final String label;

  const InputFormField(this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(5, 0, 0, 5),
            child: Text(
              label,
              style: const TextStyle(fontSize: 16),
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
    );
  }
}
