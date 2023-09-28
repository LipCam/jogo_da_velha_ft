import 'package:flutter/material.dart';
import 'package:jogo_da_velha/cores.dart';

void main() {
  runApp(JogoVelha());
}

class JogoVelha extends StatefulWidget {
  @override
  State<JogoVelha> createState() => _JogoVelhaState();
}

class _JogoVelhaState extends State<JogoVelha> {
  //var map = [0, 0, 0, 0, 0, 0, 0, 0, 0];
  var map = [
    {"jogador": "", "ganhou": 0},
    {"jogador": "", "ganhou": 0},
    {"jogador": "", "ganhou": 0},
    {"jogador": "", "ganhou": 0},
    {"jogador": "", "ganhou": 0},
    {"jogador": "", "ganhou": 0},
    {"jogador": "", "ganhou": 0},
    {"jogador": "", "ganhou": 0},
    {"jogador": "", "ganhou": 0}
  ];
  String jogador = "X";
  String vencedor = "";

  List<Widget> onAtualizaTabuleiro() {
    List<Widget> lst = [];

    for (var i = 0; i < 9; i++) {
      print(map[i]["jogador"]);
      lst.add(GestureDetector(
          onTap: (() {
            setState(() {
              onCheckResultado(i);
            });
          }),
          child: Container(
            //child: Center(child: Text(i.toString())),
            child: map[i]["jogador"] == ""
                ? Text("")
                : map[i]["jogador"] == "X"
                    ? Center(
                        child: Text(
                          "X",
                          style: TextStyle(
                              color: corJogador1,
                              fontSize: 80,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    : Center(
                        child: Text(
                          "O",
                          style: TextStyle(
                              color: corJogador2,
                              fontSize: 80,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
            padding: const EdgeInsets.all(8),
            color: map[i]["ganhou"] == 0
                ? corFundoTabuleiro
                : corFundoTabuleiroGanhou,
          )));
    }

    return lst;
  }

  onCheckResultado(int pos) {
    if (vencedor == "" && map[pos]["jogador"] == "") {
      map[pos]["jogador"] = jogador;
    }

    if (map[0]["jogador"] != "" &&
        map[0]["jogador"] == map[1]["jogador"] &&
        map[1]["jogador"] == map[2]["jogador"]) {
      vencedor = jogador;
      map[0]["ganhou"] = 1;
      map[1]["ganhou"] = 1;
      map[2]["ganhou"] = 1;
    } else if (map[3]["jogador"] != "" &&
        map[3]["jogador"] == map[4]["jogador"] &&
        map[4]["jogador"] == map[5]["jogador"]) {
      vencedor = jogador;
      map[3]["ganhou"] = 1;
      map[4]["ganhou"] = 1;
      map[5]["ganhou"] = 1;
    } else if (map[6]["jogador"] != "" &&
        map[6]["jogador"] == map[7]["jogador"] &&
        map[7]["jogador"] == map[8]["jogador"]) {
      vencedor = jogador;
      map[6]["ganhou"] = 1;
      map[7]["ganhou"] = 1;
      map[8]["ganhou"] = 1;
    } else if (map[0]["jogador"] != "" &&
        map[0]["jogador"] == map[3]["jogador"] &&
        map[3]["jogador"] == map[6]["jogador"]) {
      vencedor = jogador;
      map[0]["ganhou"] = 1;
      map[3]["ganhou"] = 1;
      map[6]["ganhou"] = 1;
    } else if (map[1]["jogador"] != "" &&
        map[1]["jogador"] == map[4]["jogador"] &&
        map[4]["jogador"] == map[7]["jogador"]) {
      vencedor = jogador;
      map[1]["ganhou"] = 1;
      map[4]["ganhou"] = 1;
      map[7]["ganhou"] = 1;
    } else if (map[2]["jogador"] != "" &&
        map[2]["jogador"] == map[5]["jogador"] &&
        map[5]["jogador"] == map[8]["jogador"]) {
      vencedor = jogador;
      map[2]["ganhou"] = 1;
      map[5]["ganhou"] = 1;
      map[8]["ganhou"] = 1;
    } else if (map[0]["jogador"] != "" &&
        map[0]["jogador"] == map[4]["jogador"] &&
        map[4]["jogador"] == map[8]["jogador"]) {
      vencedor = jogador;
      map[0]["ganhou"] = 1;
      map[4]["ganhou"] = 1;
      map[8]["ganhou"] = 1;
    } else if (map[2]["jogador"] != "" &&
        map[2]["jogador"] == map[4]["jogador"] &&
        map[4]["jogador"] == map[6]["jogador"]) {
      vencedor = jogador;
      map[2]["ganhou"] = 1;
      map[4]["ganhou"] = 1;
      map[6]["ganhou"] = 1;
    } else {
      bool ninguemGanhou = true;
      for (var element in map) {
        if (element["jogador"] == "") {
          ninguemGanhou = false;
          break;
        }
      }

      if (ninguemGanhou) vencedor = "0";
    }

    if (vencedor == "") jogador = jogador == "X" ? "O" : "X";
  }

  onReiniciar() {
    setState(() {
      map = [
        {"jogador": "", "ganhou": 0},
        {"jogador": "", "ganhou": 0},
        {"jogador": "", "ganhou": 0},
        {"jogador": "", "ganhou": 0},
        {"jogador": "", "ganhou": 0},
        {"jogador": "", "ganhou": 0},
        {"jogador": "", "ganhou": 0},
        {"jogador": "", "ganhou": 0},
        {"jogador": "", "ganhou": 0}
      ];
      jogador = "X";
      vencedor = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Jogo da Velha",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Container(
            color: corFundo,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: Text(
                  "Jogo da velha",
                  style: TextStyle(
                      color: corTitulo,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                )),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, top: 10, right: 20, bottom: 10),
                  child: Container(
                    color: Colors.black,
                    child: GridView.count(
                      primary: false,
                      crossAxisSpacing: 3,
                      mainAxisSpacing: 3,
                      crossAxisCount: 3,
                      shrinkWrap: true,
                      children: <Widget>[
                        ...onAtualizaTabuleiro(),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Visibility(
                  visible: vencedor != "",
                  child: Center(
                    child: Text.rich(
                      vencedor == "0"
                          ? TextSpan(
                              text: "Ninguém venceu!!!",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold))
                          : TextSpan(children: [
                              TextSpan(
                                  text: "Jogador ",
                                  style: TextStyle(
                                      color: corTitulo,
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: vencedor,
                                  style: TextStyle(
                                      color: vencedor == "X"
                                          ? corJogador1
                                          : corJogador2,
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: " venceu!!!",
                                  style: TextStyle(
                                      color: corTitulo,
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold)),
                            ]),
                    ),
                    // child: Text(result,
                    //     style: TextStyle(
                    //         color: corResultado,
                    //         fontSize: 28,
                    //         fontWeight: FontWeight.bold)),
                  ),
                ),
                SizedBox(height: 10),
                Visibility(
                    visible: vencedor != "",
                    child: SizedBox(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: corBtnReiniciar),
                        onPressed: onReiniciar,
                        child: const Text(
                          "Reiniciar",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
