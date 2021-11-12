import 'package:astronomycalculator/components/button_select.dart';
import 'package:flutter/material.dart';

class AstronomyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Astronomía'),),
      body: Container(
        width: double.infinity,
        child: SafeArea(child: body(context)),
      ),
    );
  }

  Widget body(context) {
    Size _size = MediaQuery.of(context).size;
    return Center(
      child: SingleChildScrollView(
          child: Column(
      children: [
        Text("--Escoge una ecuación--", style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w800),),
        SizedBox(
          height: 50,
        ),
        ButtonSelectWidget(size: _size, text: 'Ley de wien', pressed: (){Navigator.pushNamed(context, '/wiens_law');}, type: 0),
        SizedBox(
          height: 10,
        ),
        ButtonSelectWidget(size: _size, text: 'Tamaño de estrellas', pressed: (){}, type: 1),
        
      ],
    ),),);
  }
}
