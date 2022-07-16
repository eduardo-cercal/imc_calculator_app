import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  String infoText = "Informe seus dados";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IMC Calculator'),
        centerTitle: true,
        backgroundColor: Colors.purple,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              weightController.text = '';
              heightController.text = '';
              setState(() {
                infoText = "Informe seus dados";
              });
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
              Icons.perm_identity_outlined,
              size: 120,
              color: Colors.purple,
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: weightController,
              cursorColor: Colors.purple,
              decoration: const InputDecoration(
                labelText: 'Peso (kg)',
                labelStyle: TextStyle(
                  color: Colors.purple,
                ),
                errorText: "Digite um peso",
              ),
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.purple,
                fontSize: 25,
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              cursorColor: Colors.purple,
              controller: heightController,
              decoration: const InputDecoration(
                labelText: 'Peso (cm)',
                labelStyle: TextStyle(
                  color: Colors.purple,
                ),
                errorText: "Digite um altura",
              ),
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.purple,
                fontSize: 25,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (heightController.text != "" &&
                          weightController.text != "") {
                        double weight = double.parse(weightController.text);
                        double height =
                            double.parse(heightController.text) / 100;
                        double imc = weight / (height * height);
                        if (imc < 18.6) {
                          infoText =
                              "Abaixo do peso (${imc.toStringAsPrecision(3)})";
                        }
                      }
                    });
                  },
                  child: const Text(
                    'Calcular',
                    style: TextStyle(fontSize: 25),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple,
                  ),
                ),
              ),
            ),
            Text(
              infoText,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.purple, fontSize: 25),
            )
          ],
        ),
      ),
    );
  }
}
