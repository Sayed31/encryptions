import 'package:encryptions/encrypt_functions/des_cipher.dart';
import 'package:encryptions/encrypt_functions/hill_cipher.dart';
import 'package:encryptions/encrypt_functions/monoalphabetic_cipher.dart';
import 'package:encryptions/encrypt_functions/playfair_cipher.dart';
import 'package:encryptions/encrypt_functions/railFence_cipher.dart';
import 'package:encryptions/encrypt_functions/row_transposition_cipher.dart';
import 'package:flutter/material.dart';

String title = "Monoalphabetic";
String cipheredText = "";

enum FilterOptions {
  Monoalphabetic,
  Hill,
  PlayFair,
  RailFence,
  RowTransportation,
  DES,
}

class GUI extends StatefulWidget {
  const GUI({Key? key}) : super(key: key);

  @override
  State<GUI> createState() => _GUIState();
}

class _GUIState extends State<GUI> {
  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        actions: [
          PopupMenuButton(
            onSelected: (selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Monoalphabetic) {
                  title = "Monoalphabetic";
                } else if (selectedValue == FilterOptions.Hill) {
                  title = "Hill Cipher";
                } else if (selectedValue == FilterOptions.PlayFair) {
                  title = "Play Fair Cipher";
                } else if (selectedValue == FilterOptions.RailFence) {
                  title = "Rail Fence";
                } else if (selectedValue == FilterOptions.RowTransportation) {
                  title = "Transportation";
                } else if (selectedValue == FilterOptions.DES) {
                  title = "DES";
                }
              });
            },
            itemBuilder: (ctx) => [
              PopupMenuItem(
                child: Text('Monoalphabetic'),
                value: FilterOptions.Monoalphabetic,
              ),
              PopupMenuItem(
                child: Text('Hill Cipher'),
                value: FilterOptions.Hill,
              ),
              PopupMenuItem(
                child: Text('Play Fair'),
                value: FilterOptions.PlayFair,
              ),
              PopupMenuItem(
                child: Text('Rail Fence'),
                value: FilterOptions.RailFence,
              ),
              PopupMenuItem(
                child: Text('Transportation'),
                value: FilterOptions.RowTransportation,
              ),
              PopupMenuItem(
                child: Text('DES'),
                value: FilterOptions.DES,
              ),
            ],
            icon: Icon(Icons.more_horiz),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: myController,
                decoration: InputDecoration(
                  labelText: 'Enter Text',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[300],
                ),
                child: Center(
                  child: Text(
                    cipheredText,
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (title == "Monoalphabetic") {
                      cipheredText = encryptMonoalphabetic(
                          myController.text.toLowerCase());
                    } else if (title == "Hill Cipher") {
                      cipheredText = encryptHill(myController.text);
                    } else if (title == "Play Fair Cipher") {
                      cipheredText = encryptByPlayfairCipher(myController.text);
                    } else if (title == "Rail Fence") {
                      cipheredText = encryptRailFence(myController.text);
                    } else if (title == "Transportation") {
                      cipheredText = encryptRowTransposition(myController.text);
                    } else if (title == "DES") {
                      cipheredText = binToHex(encryptDES(myController.text));
                    }
                  });
                },
                child: Text('Encrypt'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (title == "Monoalphabetic") {
                      cipheredText = decryptMonoalphabetic(myController.text);
                    } else if (title == "Hill Cipher") {
                      cipheredText = encryptHill(myController.text);
                    } else if (title == "Play Fair Cipher") {
                      cipheredText = decryptByPlayfairCipher(myController.text);
                    } else if (title == "Rail Fence") {
                      cipheredText = decryptRailFence(myController.text);
                    } else if (title == "Transportation") {
                      cipheredText = decryptRowTransposition(myController.text);
                    }
                  });
                },
                child: Text('Decrypt'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
