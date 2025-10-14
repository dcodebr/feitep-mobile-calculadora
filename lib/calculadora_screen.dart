import 'package:flutter/material.dart';

class CalculadoraScreen extends StatelessWidget {
  const CalculadoraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      color: Colors.black,
      child: Column(
        children: [
          SizedBox(height: 50),
          SizedBox(
            width: double.infinity,
            child: Text(
              "123456789",
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Colors.white,
                fontSize: 70,
                fontFamily: "sans-serif-thin",
                decoration: TextDecoration.none,
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(child: getBotaoDeAcao("AC", () {})),
              Expanded(child: getBotaoDeAcao("+/-", () {})),
              Expanded(child: getBotaoDeAcao("%", () {})),
              Expanded(child: getBotaoOperacao("÷", () {})),
            ],
          ),
          SizedBox(height: 15),
          Row(
            children: [
              Expanded(child: getBotaoNumerico("7", () {})),
              Expanded(child: getBotaoNumerico("8", () {})),
              Expanded(child: getBotaoNumerico("9", () {})),
              Expanded(child: getBotaoOperacao("X", () {})),
            ],
          ),
          SizedBox(height: 15),
          Row(
            children: [
              Expanded(child: getBotaoNumerico("4", () {})),
              Expanded(child: getBotaoNumerico("5", () {})),
              Expanded(child: getBotaoNumerico("6", () {})),
              Expanded(child: getBotaoOperacao("+", () {})),
            ],
          ),
          SizedBox(height: 15),
          Row(
            children: [
              Expanded(child: getBotaoNumerico("1", () {})),
              Expanded(child: getBotaoNumerico("2", () {})),
              Expanded(child: getBotaoNumerico("3", () {})),
              Expanded(child: getBotaoOperacao("-", () {})),
            ],
          ),
          SizedBox(height: 15),
          Row(
            children: [
              Expanded(flex: 2, child: getBotaoNumerico("0", () {})),
              Expanded(child: getBotaoNumerico(",", () {})),
              Expanded(child: getBotaoOperacao("=", () {})),
            ],
          ),
        ],
      ),
    );
  }

  Widget getBotao(
    String descricao,
    void Function()? onPressed,
    Color? backgroundColor,
    Color? foregroundColor,
  ) {
    return SizedBox(
      width: 80,
      height: 80,
      child: FloatingActionButton(
        onPressed: onPressed,
        shape: CircleBorder(),
        backgroundColor: backgroundColor ?? Colors.white,
        foregroundColor: foregroundColor ?? Colors.white,
        child: Text(descricao, style: TextStyle(fontSize: 30)),
      ),
    );
  }

  Widget getBotaoDeAcao(String descricao, void Function()? onPressed) {
    return getBotao(descricao, onPressed, Colors.green, Colors.white);
  }

  Widget getBotaoOperacao(String descricao, void Function()? onPressed) {
    return getBotao(descricao, onPressed, Colors.deepOrange, Colors.white);
  }

  Widget getBotaoNumerico(String descricao, void Function()? onPressed) {
    var botaoNumerico = getBotao(
      descricao,
      onPressed,
      Colors.blueAccent,
      Colors.white,
    );

    if (descricao == "0") {
      botaoNumerico = SizedBox(
        height: 80,
        child: FloatingActionButton(
          onPressed: onPressed,
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              50,
            ), // Aqui define o raio da borda
          ),
          child: Text(descricao, style: TextStyle(fontSize: 30)),
        ),
      );
    }

    return botaoNumerico;
  }
}
