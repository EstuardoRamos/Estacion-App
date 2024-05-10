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
        nombreLugar = "CANTEl";
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
    return Center( // Centra los elementos en la pantalla
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Estación Metereológica",style: TextStyle(color: Colors.amber, fontSize: 40 ),),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () => fetchData(1, context),
              child: Text('CUNOC'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 55, 29, 122),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                elevation: 4,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () => fetchData(2, context),
              child: Text('Cantel'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                elevation: 4,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () => fetchData(3, context),
              child: Text('Concepción Chiquirichapa'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                elevation: 4,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () => navigateToAboutPage(context),
              child: Text('Acerca de'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                elevation: 4,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              ),
            ),
          ),
        ],
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
          'Colaboradores:\n- Estuardo Ramos 201830358 1\n- Jose Pu 201731370 2\n- Randy Sum 201230463 3 \n- Jhony Fuentes 201230463 4',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
