import 'package:flutter/material.dart';
import 'package:examen1_dxgh/utils/constantes.dart' as con;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List lista;

  @override
  void initState() {
    lista = List.from(con.listaExamen);
    super.initState();
  }

  void _deleteItem(int index) {
    String id = lista[index].toString().split('#')[0];
    setState(() {
      lista.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Eliminado ID: $id')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: con.fondo,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20.0),
              width: size.width * 0.8,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(13.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.6),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Text(
                "Calendario de cumpleaños",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: con.titulos,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              width: size.width * 0.8,
              child: Text(
                "Dení Xanat García Hernández",
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(8),
              itemCount: lista.length,
              itemBuilder: (context, index) {
                var datos = lista[index].toString().split('#');
                return Row(
                  children: [
                    Expanded(
                      child: BirthdayCard(
                        nombre: datos[4],
                        apellidos: datos[5],
                        edad: datos[1],
                        dia: datos[2],
                        mes: datos[3],
                        descripcion: datos[6],
                        estrellas: datos[7],
                        id: datos[0],
                        onDelete: () => _deleteItem(index),
                      ),
                    ),
                    if (!['1', '10', '15', '20', '23'].contains(datos[0]))
                      DeleteCard(
                        onDelete: () => _deleteItem(index),
                      ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BirthdayCard extends StatelessWidget {
  final String nombre, apellidos, edad, dia, mes, descripcion, estrellas, id;
  final VoidCallback onDelete;

  const BirthdayCard({
    Key? key,
    required this.nombre,
    required this.apellidos,
    required this.edad,
    required this.dia,
    required this.mes,
    required this.descripcion,
    required this.estrellas,
    required this.id,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int rating = int.parse(estrellas);

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      elevation: 5,
      child: GestureDetector(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'ID: $id\nFecha de nacimiento: $dia de $mes\nNombre completo: $nombre $apellidos\nDescripción: $descripcion\nN° de estrellas: $estrellas',
              ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "$dia - $mes",
                      style: TextStyle(
                        fontSize: 26.0,
                        color: con.titulos,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "$nombre $apellidos",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      descripcion,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Icon(
                    ['1', '5', '10', '15'].contains(id)
                        ? Icons.house
                        : Icons.energy_savings_leaf_outlined,
                    color: ['1', '5', '10', '15'].contains(id)
                        ? Colors.yellow
                        : con.fondo2,
                  ),
                  SizedBox(height: 40.0),
                  Row(
                    children: List.generate(5, (index) {
                      return Icon(
                        Icons.star,
                        color: index < rating ? Colors.yellow : Colors.grey,
                      );
                    }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DeleteCard extends StatelessWidget {
  final VoidCallback onDelete;

  const DeleteCard({
    Key? key,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.red,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
          onPressed: onDelete,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.delete, color: Colors.white),
              SizedBox(width: 8),
              Text(
                'Borrar',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
