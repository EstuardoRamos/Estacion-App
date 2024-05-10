import 'package:flutter/material.dart';
import 'package:practicas/datos.dart';

class DatosPage extends StatelessWidget {
  final Datos datos;
  final String lugar;

  DatosPage({required this.datos, required this.lugar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de los Datos'),
        backgroundColor: Color.fromARGB(147, 31, 38, 100), // Modificado para modo oscuro
      ),
      body: Container(
        color: Colors.grey[850], // Fondo más oscuro para modo oscuro
        child: Center(
          child: ListView(
            padding: const EdgeInsets.all(8.0),
            children: <Widget>[
              Center(
                child: Text(
                  lugar,
                  style: TextStyle(
                    fontSize: 30,
                    fontStyle: FontStyle.normal,
                    color: Colors.white, // Texto en blanco para modo oscuro
                  ),
                ),
              ),
              ...buildListTiles(),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Regresar'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    textStyle: TextStyle(color: Color.fromARGB(255, 50, 49, 49)),
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> buildListTiles() {
    return [
      buildCard('Fecha', '${datos.fecha}', Icons.calendar_today, Colors.deepPurple),
      buildCard('Temperatura', temperatura(datos.temperatura), Icons.thermostat_outlined, Colors.red),
      buildCard('Humedad', humedad(datos.humedad), Icons.water_drop, Colors.blue),
      buildCard('Radiación', radiacion(datos.radiacion), Icons.wb_sunny, Colors.yellow),
      buildCard('Suelo 1', '${datos.suelo1}', Icons.terrain, Colors.green[700]!),
      buildCard('Suelo 2', '${datos.suelo2}', Icons.terrain, Colors.green[800]!),
      buildCard('Suelo 3', '${datos.suelo3}', Icons.terrain, Colors.green[900]!),
      buildCard('Dirección del Viento', '${datos.direccion}°', Icons.explore, Colors.orange),
      buildCard('Velocidad del Viento', '${datos.velocidad} m/s', Icons.air, Colors.purple),
      buildCard('Precipitación', '${datos.precipitacion} mm', Icons.grain, Colors.blueGrey),
    ];
  }

  Card buildCard(String title, String subtitle, IconData icon, Color iconColor) {
    return Card(
      color: Colors.grey[800], // Cards oscuros para modo oscuro
      elevation: 4,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(color: Colors.white), // Texto en blanco para modo oscuro
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(color: Colors.white70), // Texto en blanco claro para modo oscuro
        ),
        leading: Icon(icon, color: iconColor),
      ),
    );
  }
    String temperatura(String dato) {
    String temp ="";
    double tem = double.parse(dato);
    if(tem < 10){
      temp = "Frio, $tem °C";
    }else if(tem>=10 && tem < 20){
      temp = "Agradable, $tem °C";
    }else if(tem>=20 && tem < 30){
      temp = "Caluroso, $tem °C";
    }else if(tem>=30 && tem < 40){
      temp = "Extremadamente caluroso, $tem °C";
    }
  
  // Realizamos algún cálculo o ajuste
  return temp;  // Devolvemos el resultado
}
String humedad(String dato) {
    String temp ="";
    double tem = double.parse(dato);
    String dato1 = tem.toStringAsFixed(2);
    if(tem < 20){
      temp = "Muy seco, $dato1 %";
    }else if(tem>=20 && tem < 40){
      temp = "Seco, $dato1 °C";
    }else if(tem>=40 && tem < 60){
      temp = "Confortable, $dato1 %";
    }else if(tem>=60 && tem < 80){
      temp = "Humedo, $dato1 %";
    }else if(tem>=80 && tem < 100){
      temp = "Muy humedo, $dato1 %";
    }
  
  // Realizamos algún cálculo o ajuste
  return temp;  // Devolvemos el resultado
}
String radiacion(String dato) {
    String temp ="";
    double tem = double.parse(dato);
    if(tem < 200){
      temp = "Baja, $tem W/m²";
    }else if(tem>=200 && tem < 400){
      temp = "Moderada, $tem W/m²";
    }else if(tem>=400 && tem < 800){
      temp = "Alta, $tem W/m²";
    }else if(tem>=800 && tem < 1000){
      temp = "Muy alta, $tem W/m²";
    }
  
  // Realizamos algún cálculo o ajuste
  return temp;  // Devolvemos el resultado
}
}
