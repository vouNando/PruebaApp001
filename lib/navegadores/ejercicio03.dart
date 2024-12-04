import 'package:app_prueba01/navegadores/drawer.dart';
import 'package:flutter/material.dart';

class Ejercicio03 extends StatelessWidget {
  const Ejercicio03({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController alturaController = TextEditingController();

    return Scaffold(
      drawer: const Mydrawer(),
      appBar: AppBar(
        title: const Text("Ejercicio 3", style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Cálculo de la presión en un submarino",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: alturaController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Altura (h) en metros",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                calcularPresion(context, alturaController.text);
              },
              child: const Text("Calcular"),
            ),
          ],
        ),
      ),
    );
  }

  void calcularPresion(BuildContext context, String altura) {
    const double densidad = 1025.0; // kg/m³
    const double gravedad = 9.8; // m/s²

    try {
      final double h = double.parse(altura);

      // Cálculo de la presión: P = ρ * g * h
      final double presion = densidad * gravedad * h;

      final String resultado = "La presión es: ${presion.toStringAsFixed(2)} Pa";

      // Mostrar resultado
      mostrarAlerta(context, resultado);
    } catch (e) {
      mostrarAlerta(context, "Por favor ingresa un valor numérico válido.");
    }
  }

  void mostrarAlerta(BuildContext context, String mensaje) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Resultado"),
          content: Text(mensaje),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Aceptar"),
            ),
          ],
        );
      },
    );
  }
}
