import 'package:astronomycalculator/components/button_select.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de Astronomía'),
      ),
      body: Container(
        color: Color(0xff99b3b5),
        child: SafeArea(
          child: body(context),
        ),
      ),
    );
  }

  Widget body(context) {
    Size _size = MediaQuery.of(context).size;
    return Center(
      child: SingleChildScrollView(
          child: Column(
      children: [
        Text("--Escoge tu categoría--", style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w800),),
        SizedBox(
          height: 50,
        ),
        ButtonSelectWidget(size: _size, text: 'Astronomía', pressed: (){Navigator.pushNamed(context, '/astronomy');}, type: 0),
        SizedBox(
          height: 10,
        ),
        ButtonSelectWidget(size: _size, text: 'Fisica', pressed: (){Navigator.pushNamed(context, '/astronomy');}, type: 1),
      ],
    ),),);
  }
}
