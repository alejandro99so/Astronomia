import 'package:astronomycalculator/components/button_select.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_tex/flutter_tex.dart';


class WiensLawPage extends StatefulWidget {
  @override
  _WiensLawState createState() => _WiensLawState();
}
 
class _WiensLawState extends State<WiensLawPage> {
  final controllerT = TextEditingController();
  String respT = '';
  String colorT = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ley de wien'),
      ),
      body: Container(
        child: SafeArea(
          child: Padding(child: body(context), padding: EdgeInsets.all(10),),
        ),
      ),
    );
  }

  Widget body(context) {
    Size _size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          content(
              'La Ley de Wien es una ley de la física. Especifica que hay una relación inversa entre la longitud de onda en la que se produce el pico de emisión de un cuerpo negro y su temperatura. \nLas consecuencias de la ley de Wien es que cuanta mayor sea la temperatura de un cuerpo negro menor es la longitud de onda en la cual emite. Por ejemplo, la temperatura de la fotosfera solar es de 5780 K y el pico de emisión se produce a 475 nm = (4,75)(10\u207B\u2077m). ',
              _size),
          SizedBox(
            height: 10,
          ),
          Text('Calculadora'),
          SizedBox(
            height: 10,
          ),
          calc('Temperatura [K]:'),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

  Widget title(text) {
    return Center(
      child: Text(
        text,
        style: TextStyle(
            fontSize: 20, color: Colors.black, fontWeight: FontWeight.w800),
      ),
    );
  }

  Widget content(text, Size size) {
    return TeXView(
        child: TeXViewColumn(children: [
          TeXViewInkWell(
            style: TeXViewStyle(backgroundColor: Colors.white),
            id: "id_0",
            child: TeXViewColumn(children: [
              TeXViewDocument(r"""<h2>Ley de Wien</h2>""",
                  style: TeXViewStyle(textAlign: TeXViewTextAlign.Center)),
              TeXViewContainer(
                child: TeXViewImage.asset(
                    'lib/assets/images/Ley_de_Wien.png'),
                style: TeXViewStyle(
                  margin: TeXViewMargin.all(10),
                  borderRadius: TeXViewBorderRadius.all(20),
                  backgroundColor: Colors.white,
                ),
              ),
              TeXViewDocument(r"""<p>
                           La Ley de Wien es una ley de la física. Especifica que hay una relación inversa
                           entre la longitud de onda en la que se produce el pico de emisión de un cuerpo 
                           negro y su temperatura.<br/>
                           Las consecuencias de la ley de Wien es que cuanta mayor sea la temperatura de 
                           un cuerpo negro menor es la longitud de onda en la cual emite. Por ejemplo, la 
                           temperatura de la fotosfera solar es de 5780 K y el pico de emisión se produce 
                           a 475 nm = (4,75 &middot 10<sup>-7</sup>m).                                
                           </p>
                           <p>$$\lambda_{max} = \dfrac{0,002898}{T}$$</p>
                           """,
                  style: TeXViewStyle.fromCSS(
                      'padding: 15px; color: white; background: rgba(153, 179, 181, 1);'))
            ]),
          )
        ]),
        style: TeXViewStyle(
          elevation: 10,
          borderRadius: TeXViewBorderRadius.all(25),
          border: TeXViewBorder.all(TeXViewBorderDecoration(
              borderColor: Colors.blue,
              borderStyle: TeXViewBorderStyle.Solid,
              borderWidth: 5)),
          backgroundColor: Colors.white,
        ),
        loadingWidgetBuilder: (context) => Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(),
                  Text("Cargando...")
                ],
              ),
            ));
  }

  Widget calc(String text) {
    return Column(children: [
      Row(
        children: [
          Text(text),
          SizedBox(
            width: 10,
          ),
          Container(
            child: Center(
              child: TextFormField(
                controller: controllerT,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(bottom: 12, left: 13),
                  border: InputBorder.none,
                  hintText: '5000',
                  hintStyle: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Bronova',
                  ),
                ),
                onSaved: (String value) {
                  // This optional block of code can be used to run
                  // code when the user saves the form.
                },
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontFamily: 'Bronova',
                ),
              ),
            ),
            width: 100,
            height: 30,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blueAccent),
              borderRadius: BorderRadius.all(Radius.circular(
                      5.0) //                 <--- border radius here
                  ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          ElevatedButton.icon(
            label: Text('Calcular'),
            icon: Icon(Icons.calculate),
            onPressed: () {
              print(controllerT.text.toString());
              calcTemp(double.parse(controllerT.text));
            },
          )
        ],
      ),
      Text(respT == '' ? '' : 'para la temperatura ingresada, se tiene una logitud de onda de ' + respT + ' nm y el color de máxima emisión de la estrella es de ' + colorT) 
    ],);
  }

  calcTemp(double data) {
    print(respT);
    double resp;
    resp = ((0.002898/data)*(1e9));
    if(resp>740) {
      colorT = 'infrarrojo';
    } else if (resp>=625){
      colorT = 'rojo';
    } else if(resp>=590) {
      colorT = 'naranjado';
    } else if(resp>=565) {
      colorT = 'amarillo';
    } else if(resp>=500) {
      colorT = 'verde';
    } else if(resp>=485) { 
      colorT = 'cian';
    } else if(resp>=440) {
      colorT = 'azul';
    } else if(resp>=380) {
      colorT = 'violeta';
    } else {
      colorT = 'ultravioleta';
    }
    setState(() {
      respT = resp.toStringAsFixed(2);
    });
  }
}
