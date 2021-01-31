import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {

 var _imageApp = AssetImage("images/padrao.png");
 var _message = "Choose an option below";

 void _selectedOption(String userOption) {
  var options = ["rock", "paper", "scissors"];
  var number = Random().nextInt(3);
  var appChoose = options[number];

  print("App Choose: $appChoose");
  print("User Choose: $userOption");

  switch(appChoose) {
    case "rock":
      setState(() {
        this._imageApp = AssetImage("images/pedra.png");
      });
      break;
    case "paper":
      setState(() {
        this._imageApp = AssetImage("images/papel.png");
      });
      break;
    case "scissors":
      setState(() {
        this._imageApp = AssetImage("images/tesoura.png");
      });
      break;
  }
  // Validation
  // User winner
  if (
      (userOption == "rock" && appChoose == "scissors") ||
      (userOption == "scissors" && appChoose == "paper") ||
      (userOption == "paper" && appChoose == "rock")
  ) {
    setState(() {
      this._message = "Congrats!!! You win :)";
    });
    // App winner
  } else if (
      (appChoose == "rock" && userOption == "scissors") ||
      (appChoose == "scissors" && userOption == "paper") ||
      (appChoose == "paper" && userOption == "rock")
  ) {
    setState(() {
      this._message = "You lose :´(";
    });
  } else {
    setState(() {
      this._message = "We tie ;)";
    });
  }
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JokenPo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "App Choose",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Image(image: this._imageApp),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              this._message,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => _selectedOption("rock"),
                child: Image.asset("images/pedra.png", height: 100,),
              ),
              GestureDetector(
                onTap: () => _selectedOption("paper"),
                child: Image.asset("images/papel.png", height: 100,),
              ),
              GestureDetector(
                onTap: () => _selectedOption("scissors"),
                child: Image.asset("images/tesoura.png", height: 100,),
              ),
              /*Image.asset("images/pedra.png", height: 100,),
              Image.asset("images/papel.png", height: 100,),
              Image.asset("images/tesoura.png", height: 100,),*/
            ],
          )
        ],
      ),
    );
  }
}
