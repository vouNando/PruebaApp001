import 'package:app_prueba01/navegadores/drawer.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MiApp());
}

class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "App 001",
      home: Cuerpo(),
    );
  }
}

class Cuerpo extends StatelessWidget {
  const Cuerpo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mi Aplicación"),
      ),
      drawer: const Mydrawer(),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              "https://4kwallpapers.com/images/wallpapers/landscape-macbook-3840x2160-10760.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Nombre del estudiante: Andrango Fernando",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Usuario de GitHub: vouNando",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => mostrarAlerta(context),
                  child: const Text("Ir al Ejercicio02"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void mostrarAlerta(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Confirmación"),
          content: const Text("¿Deseas ir al Ejercicio02?"),
          actions: [
            TextButton(
              onPressed: () {
                // Navegación a la nueva pantalla (Ejercicio02)
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Ejercicio02(),
                  ),
                );
              },
              child: const Text("Aceptar"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancelar"),
            ),
          ],
        );
      },
    );
  }
}

class Ejercicio02 extends StatelessWidget {
  const Ejercicio02({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ejercicio02"),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              "https://fondosanimados.com/wp-content/uploads/2023/03/Pinwheel-Forest_wallpaper-1920x1080.jpg",
              fit: BoxFit.cover,
            ),
          ),
          const Center(
            child: Text(
              "Bienvenido al Ejercicio02",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
