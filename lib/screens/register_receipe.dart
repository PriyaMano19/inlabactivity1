import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../models/Receipe.dart';
import '../reposistories/ReceipeReposistory.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final _formKey = GlobalKey<FormState>();
  late String _receipeID;
  late String _title;
  late String _description;
  late String _ingredient;

  @override
  void initState() {
    super.initState();
    _ingredient = "";
    _description = "";
    _title = "";
    _receipeID = "";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextFormField(
          decoration: const InputDecoration(
            hintText: 'Receipe ID',
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter the Receipe ID';
            }
            return null;
          },
          onChanged: (value) {
            setState(() {
              _receipeID = value;
            });
          },
        ),
        const SizedBox(height: 16.0),
        TextFormField(
          decoration: const InputDecoration(
            hintText: 'Title',
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter the Title';
            }
            return null;
          },
          onChanged: (value) {
            setState(() {
              _title = value;
            });
          },
        ),
        const SizedBox(height: 16.0),
        TextFormField(
          decoration: const InputDecoration(
            hintText: 'Description',
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter the Description';
            }
            return null;
          },
          onChanged: (value) {
            setState(() {
              _description = value!;
            });
          },
        ),
        const SizedBox(height: 16.0),
        TextFormField(
          decoration: const InputDecoration(
            hintText: 'Ingredients',
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter the Ingredients';
            }
            return null;
          },
          onChanged: (value) {
            setState(() {
              _ingredient = value;
            });
          },
        ),
        const SizedBox(height: 16.0),
        ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                Receipe receipe =
                    Receipe(_receipeID, _title, _description, _ingredient);
                ReceipeRepository receipeRepository = ReceipeRepository();
                receipeRepository.addReceipe(receipe);
                setState(() {
                  _ingredient = '';
                  _description = '';
                  _title = '';
                  _receipeID = '';
                });
              }
            },
            child: const Text('Add Receipe')),
        ElevatedButton(
            onPressed: () async {
              final navigator = Navigator.of(context);
              navigator.pushReplacement(
                MaterialPageRoute(builder: (context) => const MyWidget()),
              );
            },
            child: const Text("Logout")),
      ],
    );
  }
}
