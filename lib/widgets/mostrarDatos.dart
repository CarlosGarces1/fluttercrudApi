// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';

class MostrarDatos extends StatelessWidget {
  int id;
  String nombre;
  String username;
  String email;
  int edad;
  String diaNacimiento;
  Function onTapEdit;
  Function onTapDelete;
  MostrarDatos({
    Key? key,
    required this.id,
    required this.nombre,
    required this.username,
    required this.email,
    required this.edad,
    required this.diaNacimiento,
    required this.onTapEdit,
    required this.onTapDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 36,
              width: 42,
              color: Colors.transparent,
              child: Center(
                  child: Text(
                id.toString(),
              )),
            ),
            Container(
              height: 36,
              width: 240,
              color: Colors.transparent,
              child: Center(
                  child: Text(
                nombre,
              )),
            ),
            Container(
              height: 36,
              width: 78,
              color: Colors.transparent,
              child: Center(
                  child: Text(
                username.toString(),
              )),
            ),
            Container(
              height: 36,
              width: 180,
              color: Colors.transparent,
              child: Center(
                  child: Text(
                email,
              )),
            ),
            Container(
              height: 36,
              width: 50,
              color: Colors.transparent,
              child: Center(
                  child: Text(
                edad.toString(),
              )),
            ),
            Container(
              height: 36,
              width: 150,
              color: Colors.white,
              child: Center(
                  child: Text(
                diaNacimiento,
              )),
            ),
            Container(
              height: 36,
              width: 10,
              color: Colors.white,
            ),
            GestureDetector(
              onTap: () {
                onTapEdit();
              },
              child: Container(
                height: 36,
                width: 24,
                color: Colors.transparent,
                child: const Padding(
                  padding: EdgeInsets.only(
                    top: 8.5,
                    left: 2.5,
                    right: 2.5,
                    bottom: 8.5,
                  ),
                  child: Icon(
                    Icons.edit,
                  ),
                ),
              ),
            ),
            Container(
              height: 36,
              width: 30,
              color: Colors.white,
            ),
            GestureDetector(
              onTap: () {
                onTapDelete();
              },
              child: Container(
                height: 36,
                width: 24,
                color: Colors.transparent,
                child: const Padding(
                  padding: EdgeInsets.only(
                    top: 8.5,
                    left: 2.5,
                    right: 2.5,
                    bottom: 8.5,
                  ),
                  child: Icon(
                    Icons.delete,
                  ),
                ),
              ),
            ),
          ],
        ),
        Container(
          height: 2,
          color: Colors.grey,
        )
      ],
    );
  }
}
