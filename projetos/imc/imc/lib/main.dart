import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyImc()));
}

class MyImc extends StatefulWidget {
  const MyImc({super.key});

  @override
  State<MyImc> createState() => _MyImcState();
}

class _MyImcState extends State<MyImc> {
  TextEditingController pesoC = TextEditingController();
  TextEditingController alturaC = TextEditingController();
  String resposta = "Resposta:";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("IMC"),
        centerTitle: true,
      ),
      body: body(),
    );
  }

  Widget body() {
    return Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
        child: Column(
          children: [
            TextField(
              controller: alturaC,
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 22, color: Colors.grey),
              decoration: InputDecoration(
                  labelText: "Altura", labelStyle: TextStyle(fontSize: 22)),
            ),
            TextField(
              controller: pesoC,
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 22, color: Colors.grey),
              decoration: InputDecoration(
                  labelText: "Peso", labelStyle: TextStyle(fontSize: 22)),
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            ElevatedButton(onPressed: calcular, child: Text("Calcular")),
            Padding(padding: EdgeInsets.only(top: 20)),
            Text(resposta),
          ],
        ));
  }

  calcular() {
    double valorIMC = double.parse(pesoC.text) /
        (double.parse(alturaC.text) * double.parse(alturaC.text));
    setState(() {
      resposta = "O valor do IMC é: " + valorIMC.toStringAsPrecision(4);
    });
  }
}
