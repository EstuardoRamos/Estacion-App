
class Datos{
  String fecha;
  String temperatura;
  String humedad;
  String radiacion;
  String suelo1;
  String suelo2;
  String suelo3;
  String direccion;
  String velocidad;
  String precipitacion;
  Datos({required this.fecha,required this.temperatura,required this.humedad, required this.radiacion,required this.suelo1,
  required this.suelo2, required this.suelo3,required this.direccion
  ,required this.velocidad,required this.precipitacion});

  factory Datos.fromJson(Map<String, dynamic> json) {
    return Datos(
      fecha: json['fechahora'],
      temperatura: json['temperatura'],
      humedad: json['humedad'],
      radiacion: json['radiacion'],
      suelo1: json['suelo1'],
      suelo2: json['suelo2'],
      suelo3: json['suelo3'],
      direccion: json['direccion'],
      velocidad: json['velocidad'],
      precipitacion: json['precipitacion']
    );
  }

}