import 'package:flutter/material.dart';
import 'package:practicas/datos.dart';

class DatosPage extends StatelessWidget {
  final Datos datos;
  final String lugar;

  DatosPage({required this.datos,  required this.lugar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de los Datos'),
        backgroundColor: Colors.deepPurple, // Cambia el color del AppBar
      ),
      body: Container(
        
        color: Colors.grey[200], // Color de fondo suave
        child: Center( 
          // Asegura que el contenido esté centrado
          child: ListView( // Permite el desplazamiento
            padding: const EdgeInsets.all(8.0),
            children: <Widget>[
              Center(
             child: Text(
                  lugar,
                  style: TextStyle(fontSize: 30, fontStyle: FontStyle.normal,),
                ),
              ),
              Card(
                elevation: 4,
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  title: Text('Fecha'),
                  subtitle: Text('${datos.fecha}'),
                  leading: Icon(Icons.calendar_today, color: Colors.deepPurple),
                ),
              ),
              Card(
                elevation: 4,
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  title: Text('Temperatura'),
                  subtitle: Text('${datos.temperatura} °C'),
                  leading: Icon(Icons.thermostat_outlined, color: Colors.red),
                ),
              ),
              Card(
                elevation: 4,
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  title: Text('Humedad'),
                  subtitle: Text('${datos.humedad} %'),
                  leading: Icon(Icons.water_drop, color: Colors.blue),
                ),
              ),
              Card(
                elevation: 4,
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  title: Text('Radiación'),
                  subtitle: Text('${datos.radiacion}'),
                  leading: Icon(Icons.wb_sunny, color: Colors.yellow),
                ),
              ),
              Card(
                elevation: 4,
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  title: Text('Suelo 1'),
                  subtitle: Text('${datos.suelo1}'),
                  leading: Icon(Icons.terrain, color: Colors.green[700]),
                ),
              ),
              Card(
                elevation: 4,
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  title: Text('Suelo 2'),
                  subtitle: Text('${datos.suelo2}'),
                  leading: Icon(Icons.terrain, color: Colors.green[800]),
                ),
              ),
              Card(
                elevation: 4,
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  title: Text('Suelo 3'),
                  subtitle: Text('${datos.suelo3}'),
                  leading: Icon(Icons.terrain, color: Colors.green[900]),
                ),
              ),
              Card(
                elevation: 4,
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  title: Text('Dirección del Viento'),
                  subtitle: Text('${datos.direccion}°'),
                  leading: Icon(Icons.explore, color: Colors.orange),
                ),
              ),
              Card(
                elevation: 4,
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  title: Text('Velocidad del Viento'),
                  subtitle: Text('${datos.velocidad} m/s'),
                  leading: Icon(Icons.air, color: Colors.purple),
                ),
              ),
              Card(
                elevation: 4,
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  title: Text('Precipitación'),
                  subtitle: Text('${datos.precipitacion} mm'),
                  leading: Icon(Icons.grain, color: Colors.blueGrey),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Regresar'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    textStyle: TextStyle(color: Colors.white),
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
  
}
