import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class cepProjet extends StatefulWidget {
  const cepProjet({Key? key}) : super(key: key);



  @override
  State<cepProjet> createState() => _cepProjetState();
}

class _cepProjetState extends State<cepProjet> {


  String _resultado = "";
  String _resultado1 = "";
  String _resultado2 = "";
  String _resultado3 = "";


  TextEditingController _controllerCep = TextEditingController();

  _recuperarcep() async {
   String cepdigitado = _controllerCep.text;
   String url = "https://viacep.com.br/ws/${cepdigitado}/json/";
   http.Response response;
    
    response = await http.get(url);

    Map<String, dynamic> retorno = json.decode(response.body);
    String logradouro = retorno["logradouro"];
    String bairro = retorno["bairro"];
    String localidade = retorno["localidade"];
    String uf = retorno["uf"];

    setState(() {
      _resultado = "${logradouro}";
      _resultado1 = "${bairro}" ;
      _resultado2 = "${localidade}" ;
      _resultado3 = "${uf}" ;
    });

    print(
" Logradouro: ${logradouro} Bairro: ${bairro} Cidade ${localidade} Estado: ${uf} "

   );

    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff05F1A6),
       title: Text("Buscar Cep"),
      ) ,

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,

        children: <Widget> [

          Padding(padding: EdgeInsets.all(40),

            child:   TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  label: Text("CEP")
              ),
              style: TextStyle(
                fontSize: 22,
              ),
              controller: _controllerCep,
            ),


          ),

          Padding(padding: EdgeInsets.all(20),
           child:  RaisedButton(
                child: Text("Buscar"),
                onPressed: _recuperarcep),
          ),


    Text(_resultado, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
    Text(_resultado1, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
    Text(_resultado2, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
    Text(_resultado3, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),




        ],

      ),


    );
  }
}
