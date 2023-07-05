import 'package:flutter/material.dart';
import 'package:signteach/repositories/models/teaching_cantegory.dart';

List<String> abecedary = [
  'A',
  'B',
  'C',
  'D',
  'E',
  'F',
  'G',
  'H',
  'I',
  'J',
  'K',
  'L',
  'M',
  'N',
  'Ñ',
  'O',
  'P',
  'Q',
  'R',
  'S',
  'T',
  'U',
  'V',
  'W',
  'X',
  'Y',
  'Z'
];

List<TeachingCategory> categories = [
  TeachingCategory(name: "Saludos", options: [
    'Buenas%20Noches',
    'Buenas%20Tardes',
  ]),
  TeachingCategory(name: "Vocales", options: [
    'A',
    'E',
    'I',
    'O',
    'U',
  ]),
  TeachingCategory(
      name: "Colores", options: ['Azul', 'Rojo', 'Rosado', 'Verde'])
];

const primary = Color.fromARGB(255, 78, 201, 223);
const secondary = Color.fromARGB(255, 99, 161, 208);
const terciary = Color.fromARGB(255, 53, 118, 167);
const quaternary = Color.fromARGB(255, 52, 73, 134);
