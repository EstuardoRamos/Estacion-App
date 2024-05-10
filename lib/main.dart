import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:practicas/datos.dart';
import 'package:practicas/datosPage.dart';  // Asegúrate que la ruta al archivo sea correcta

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Consumo de API',
      home: Scaffold(
        body: MyHomePage(),
        backgroundColor: Color.fromARGB(255, 2, 50, 71),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<void> fetchData(int tipo, BuildContext context) async {
    var url;
    var nombreLugar;
    switch(tipo){
      case 1:
        url = Uri.parse('https://cyt.cunoc.edu.gt/index.php/Ultimo-Registro/Cunoc');
        nombreLugar = "CUNOC";
        break;
      case 2:
        url = Uri.parse('https://cyt.cunoc.edu.gt/index.php/Ultimo-Registro/Cantel');
        nombreLugar = "CANTEL";
        break;
      case 3:
        url = Uri.parse('https://cyt.cunoc.edu.gt/index.php/Ultimo-Registro/Conce');
        nombreLugar="Concepción Chiquirichapa";
        break;
    }
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        Datos datos = Datos.fromJson(jsonDecode(response.body));
        Navigator.push(context, MaterialPageRoute(builder: (context) => DatosPage(datos: datos,lugar:nombreLugar)));
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Caught error: $e');
    }
  }

  void navigateToAboutPage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AboutPage()));
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/space.jpg'), // Confirma que esta ruta sea correcta.
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Estación Meteorológica",
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(2.0, 2.0),
                    blurRadius: 3.0,
                    color: Color.fromARGB(150, 0, 0, 0),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            buildButton(context, 'CUNOC', Color.fromARGB(255, 18, 30, 35)!, 1),
            buildButton(context, 'Cantel', Colors.lightGreen[300]!, 2),
            buildButton(context, 'C. Chiquirichapa', Colors.orange[300]!, 3),
            buildButton(context, 'Acerca de', Colors.grey[350]!, null),
          ],
        ),
      ),
    ),
  );
}

Widget buildButton(BuildContext context, String text, Color bgColor, int? tipo) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SizedBox(
      width: 280,  // Define el ancho uniforme de todos los botones
      height: 60,  // Define la altura uniforme de todos los botones
      child: ElevatedButton(
        onPressed: tipo != null ? () => fetchData(tipo, context) : () => navigateToAboutPage(context),
        child: Text(text),
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          elevation: 4,
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          textStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    ),
  );
}

}

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Acerca de'),
      ),
      body: Center(
        child: Text(
          'Colaboradores:\n- Estuardo Ramos 201830358 1\n- Jose Pu 201731370 2\n- Randy Sum 201230463 3 \n- Jhony Fuentes 202031288 4',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
