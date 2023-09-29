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
  TextEditingController valorConta = TextEditingController();
  TextEditingController qtdPessoas = TextEditingController();
  TextEditingController porcentagemComissao = TextEditingController();
  String resposta = "Resposta:";
  String valorComissao = "Valor do garcom";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aplicativo divide conta"),
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
              controller: qtdPessoas,
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 22, color: Colors.grey),
              decoration: InputDecoration(
                  labelText: "Informe a quantidade de pessoas",
                  labelStyle: TextStyle(fontSize: 22)),
            ),
            TextField(
              controller: valorConta,
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 22, color: Colors.grey),
              decoration: InputDecoration(
                  labelText: "Informe o valor da conta",
                  labelStyle: TextStyle(fontSize: 22)),
            ),
            TextField(
              controller: porcentagemComissao,
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 22, color: Colors.grey),
              decoration: InputDecoration(
                  labelText:
                      "Informe a porcentagem que será de comissão para o garçom",
                  labelStyle: TextStyle(fontSize: 22)),
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            ElevatedButton(onPressed: calcular, child: Text("Calcular")),
            Padding(padding: EdgeInsets.only(top: 20)),
            Text(resposta),
            Text(valorComissao)
          ],
        ));
  }

  calcular() {
    double recebidoGarcom =
        double.parse(porcentagemComissao.text) * double.parse(valorConta.text);

    double valorContaGarcom = (double.parse(porcentagemComissao.text) + 1) *
        double.parse(valorConta.text);

    double valorDividido = valorContaGarcom / (double.parse(qtdPessoas.text));

    setState(() {
      resposta = "O valor da conta por pessoa é de: " +
          valorDividido.toStringAsPrecision(4);
      valorComissao = "O valor ganho pelo garçom é de :" +
          recebidoGarcom.toStringAsPrecision(4);
    });
  }
}
