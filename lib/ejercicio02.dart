
import 'package:app_prueba01/navegadores/drawer.dart';
import 'package:flutter/material.dart';

class Ejercicio02 extends StatelessWidget {
  const Ejercicio02({super.key});

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Mydrawer(),
      
      appBar: AppBar(
        title: const Text("Pantalla 2", style: TextStyle(color: Colors.white)),
      ),
      
      body: const Center(child: Text("Pantalla 2")),
    );
    
    
  }
}