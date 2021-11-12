
import 'package:astronomycalculator/Subjects/ley_de_wien.dart';
import 'package:astronomycalculator/pages/astronomy_page.dart';
import 'package:astronomycalculator/pages/main_page.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/':                  (BuildContext context) => MainPage(),
  '/astronomy':         (BuildContext context) => AstronomyPage(),
  '/wiens_law':          (BuildContext context) => WiensLawPage()
};

const String INITIAL_ROUTE = '/';