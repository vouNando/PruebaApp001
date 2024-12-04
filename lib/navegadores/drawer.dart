
import 'package:app_prueba01/ejercicio01.dart';
import 'package:app_prueba01/main.dart';
import 'package:app_prueba01/navegadores/ejercicio03.dart';
import 'package:flutter/material.dart';

class Mydrawer extends StatelessWidget {
  const Mydrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: ListView(
        children: [
          ListTile(
            title: const Text("Inicio"),
            onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => const Cuerpo() )),  
          ),
          ListTile(
            title: const Text("ejercicio 1"),  
            onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => const Ejercicio01())),
          ),
          ListTile(
            title: const Text("ejercicio 2"),
            onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => const Ejercicio02())),  
          ),
          ListTile(
            title: const Text("ejercicio 3"),
            onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => const Ejercicio03())),  
          ),
         
        
        ],  
      ),
     
         
      
    );
  }
}