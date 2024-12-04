import 'package:app_prueba01/navegadores/drawer.dart';
import 'package:flutter/material.dart';

class Ejercicio01 extends StatelessWidget {
  const Ejercicio01({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController velocidadInicial = TextEditingController();
    final TextEditingController velocidadFinal = TextEditingController();

    return Scaffold(
      drawer: const Mydrawer(),
      appBar: AppBar(
        title: const Text("Ejercicio 1", style: TextStyle(color: Colors.white)),
      ),
      body: Stack(
        children: [
          // Imagen de fondo
          Positioned.fill(
            child: Image.asset(
              "assets/image/chill.jpg", // Cambia esto por el nombre de tu archivo de imagen
              fit: BoxFit.cover,
            ),
          ),
          // Contenido principal
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Pruebas de velocidad en pista de autos",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: velocidadInicial,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Velocidad inicial (V) en m/s",
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white70,
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: velocidadFinal,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Velocidad final (Vf) en m/s",
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white70,
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    calcularResultado(context, velocidadInicial.text, velocidadFinal.text);
                  },
                  child: const Text("Calcular"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void calcularResultado(BuildContext context, String v, String vf) {
    const double aceleracion = 10.0; // m/s²

    try {
      final double velocidadInicial = double.parse(v);
      final double velocidadFinal = double.parse(vf);

      // Cálculo del tiempo
      final double tiempo = (velocidadFinal - velocidadInicial) / aceleracion;

      // Verificación del tiempo mínimo (supongamos 5 segundos como ejemplo)
      const double tiempoMinimo = 5.0;
      final String resultado = (tiempo < tiempoMinimo)
          ? "El vehículo no aprueba. Tiempo: ${tiempo.toStringAsFixed(2)} s"
          : "El vehículo aprueba. Tiempo: ${tiempo.toStringAsFixed(2)} s";

      // Mostrar resultado
      mostrarAlerta(context, resultado);
    } catch (e) {
      mostrarAlerta(context, "Por favor ingresa valores numéricos válidos.");
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
