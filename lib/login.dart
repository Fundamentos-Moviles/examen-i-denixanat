import 'package:flutter/material.dart';
import 'package:examen1_dxgh/home.dart';
import 'package:examen1_dxgh/utils/constantes.dart' as con;
import 'dart:math';

///Clase de creación de widgets con cambios de estado
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController user = TextEditingController();
  final pass = TextEditingController();
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    final List<Color> colors = [con.fondo, con.fondo2, con.fondo3, con.fondo4];
    final Random random = Random();

    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: con.fondo,
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, // 4 círculos de ancho
                  mainAxisSpacing: 0.0, // Espaciado vertical entre círculos
                  crossAxisSpacing: 0.0, // Espaciado horizontal entre círculos
                ),
                itemCount: 24, // 4 de ancho y 6 de largo (4 * 6 = 24 círculos)
                itemBuilder: (context, index) {
                  Color randomColor = colors[random.nextInt(colors.length)];
                  return Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: randomColor,
                      borderRadius: BorderRadius.circular(60),
                    ),
                  );
                },
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Container(
                height: 430,
                padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.black.withOpacity(0.7), // Contenedor opaco
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Bienvenido a tu primer EXAMEN',
                      style: TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.w600,
                        color: con.titulos,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    const Align(
                      alignment: Alignment.centerLeft, // Align to the left
                      child: Text(
                        'Ingresa tu correo electrónico:',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: user,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            width: 1,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Correo',
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(10.0)),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Ingresa tu contraseña:',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: pass,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            width: 1,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Contraseña',
                      ),
                    ),
                    const SizedBox(height: 20.0),

                    if (errorMessage.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          errorMessage,
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),

                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: con.botones,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          fixedSize: const Size(350, 40),
                        ),
                        onPressed: () {
                          setState(() {
                            if (user.text.isEmpty || pass.text.isEmpty) {
                              errorMessage = 'Datos Incompletos';
                            } else if (user.text != "test@correo.mx" &&
                                pass.text != "FDM2") {
                              errorMessage = 'Usuario y Contraseña Incorrectos';
                            } else if (user.text != "test@correo.mx") {
                              errorMessage = 'Usuario Incorrecto';
                            } else if (pass.text != "FDM2") {
                              errorMessage = 'Contraseña Incorrecta';
                            } else {
                              errorMessage = '';
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Home()));
                            }
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text('Iniciar Sesión',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w500,
                                )),
                          ],
                        )),
                    const SizedBox(height: 20),
                    const Text("Mi primer examen, ¿Estará sencillo?",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                        ))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
