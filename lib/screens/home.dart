import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pruebatecnica/constant.dart';
import 'package:pruebatecnica/widgets/mostrarDatos.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> users = [];
  String token = '';
  final TextEditingController _controllername = TextEditingController();
  final TextEditingController _controllerlastname = TextEditingController();
  final TextEditingController _controllerusername = TextEditingController();
  final TextEditingController _controlleremail = TextEditingController();
  final TextEditingController _controlleredad = TextEditingController();
  final TextEditingController _controllerdianamiento = TextEditingController();

  void getToken() async {
    token = await login();
    getUsers();
    print(token);
  }

  @override
  void initState() {
    super.initState();
    getToken();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: 939,
            width: double.infinity,
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  height: 60,
                  width: double.infinity,
                  color: Colors.white,
                  child: const Center(
                    child: Text(
                      'Crud usuarios',
                      style: TextStyle(
                        fontSize: 50,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 600,
                  width: double.infinity,
                  color: Colors.white,
                  child: Column(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Container(
                              height: 36,
                              width: 42,
                              color: Colors.white,
                              child: const Center(
                                  child: Text(
                                'Id',
                              )),
                            ),
                            Container(
                              height: 36,
                              width: 240,
                              color: Colors.white,
                              child: const Center(
                                  child: Text(
                                'Nombre y Apellido',
                              )),
                            ),
                            Container(
                              height: 36,
                              width: 78,
                              color: Colors.white,
                              child: const Center(
                                  child: Text(
                                'Username',
                              )),
                            ),
                            Container(
                              height: 36,
                              width: 180,
                              color: Colors.white,
                              child: const Center(
                                  child: Text(
                                'Email',
                              )),
                            ),
                            Container(
                              height: 36,
                              width: 50,
                              color: Colors.white,
                              child: const Center(
                                child: Text(
                                  'Edad',
                                ),
                              ),
                            ),
                            Container(
                              height: 36,
                              width: 150,
                              color: Colors.white,
                              child: const Center(
                                child: Text(
                                  'Dia de nacimiento',
                                ),
                              ),
                            ),
                            Container(
                              height: 36,
                              width: 100,
                              color: Colors.white,
                              child: const Center(),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 564,
                        width: double.infinity,
                        color: Colors.white,
                        child: ListView.builder(
                          itemCount: users.length,
                          itemBuilder: (context, index) {
                            return MostrarDatos(
                              id: users[index]['id'],
                              nombre: users[index]['first_name'] +
                                  ' ' +
                                  users[index]['last_name'],
                              username: users[index]['username'],
                              email: users[index]['email'],
                              edad: users[index]['age'],
                              diaNacimiento: users[index]['date_birth'],
                              onTapEdit: () {
                                _controllername.text =
                                    users[index]['first_name'];
                                _controllerlastname.text =
                                    users[index]['last_name'];
                                _controllerusername.text =
                                    users[index]['username'];
                                _controlleremail.text = users[index]['email'];
                                _controlleredad.text =
                                    users[index]['age'].toString();
                                _controllerdianamiento.text =
                                    users[index]['date_birth'];
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text('Añadir nuevo cliente'),
                                      content: SingleChildScrollView(
                                        child: Container(
                                          height: 400,
                                          width: 300,
                                          color: Colors.transparent,
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  top: 8,
                                                  bottom: 8,
                                                ),
                                                child: TextField(
                                                  controller: _controllername,
                                                  decoration:
                                                      const InputDecoration(
                                                          hintText:
                                                              'Ingrese el nombre'),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  top: 8,
                                                  bottom: 8,
                                                ),
                                                child: TextField(
                                                  controller:
                                                      _controllerlastname,
                                                  decoration: const InputDecoration(
                                                      hintText:
                                                          'Ingrese el apellido'),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  top: 8,
                                                  bottom: 8,
                                                ),
                                                child: TextField(
                                                  controller:
                                                      _controllerusername,
                                                  decoration: const InputDecoration(
                                                      hintText:
                                                          'Ingrese el username'),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  top: 8,
                                                  bottom: 8,
                                                ),
                                                child: TextField(
                                                  controller: _controlleremail,
                                                  decoration:
                                                      const InputDecoration(
                                                          hintText:
                                                              'Ingrese el email'),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  top: 8,
                                                  bottom: 8,
                                                ),
                                                child: TextField(
                                                  controller: _controlleredad,
                                                  decoration:
                                                      const InputDecoration(
                                                          hintText:
                                                              'Ingrese la edad'),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  top: 8,
                                                  bottom: 8,
                                                ),
                                                child: TextField(
                                                  controller:
                                                      _controllerdianamiento,
                                                  decoration: const InputDecoration(
                                                      hintText:
                                                          'Ingrese el dia de nacimiento'),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            editItem(users[index]['id']);
                                            Navigator.of(context).pop();
                                            _controllername.clear();
                                            _controllerlastname.clear();
                                            _controllerusername.clear();
                                            _controlleremail.clear();
                                            _controlleredad.clear();
                                            _controllerdianamiento.clear();
                                          },
                                          child: const Text('Editar'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              onTapDelete: () {
                                deleteItem(users[index]['id']);
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Añadir nuevo cliente'),
                  content: SingleChildScrollView(
                    child: Container(
                      height: 400,
                      width: 300,
                      color: Colors.transparent,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 8,
                              bottom: 8,
                            ),
                            child: TextField(
                              controller: _controllername,
                              decoration: const InputDecoration(
                                  hintText: 'Ingrese el nombre'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 8,
                              bottom: 8,
                            ),
                            child: TextField(
                              controller: _controllerlastname,
                              decoration: const InputDecoration(
                                  hintText: 'Ingrese el apellido'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 8,
                              bottom: 8,
                            ),
                            child: TextField(
                              controller: _controllerusername,
                              decoration: const InputDecoration(
                                  hintText: 'Ingrese el username'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 8,
                              bottom: 8,
                            ),
                            child: TextField(
                              controller: _controlleremail,
                              decoration: const InputDecoration(
                                  hintText: 'Ingrese el email'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 8,
                              bottom: 8,
                            ),
                            child: TextField(
                              controller: _controlleredad,
                              decoration: const InputDecoration(
                                  hintText: 'Ingrese la edad'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 8,
                              bottom: 8,
                            ),
                            child: TextField(
                              controller: _controllerdianamiento,
                              decoration: const InputDecoration(
                                  hintText: 'Ingrese el dia de nacimiento'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        addItem();
                        Navigator.of(context).pop();
                        _controllername.clear();
                        _controllerlastname.clear();
                        _controllerusername.clear();
                        _controlleremail.clear();
                        _controlleredad.clear();
                        _controllerdianamiento.clear();
                      },
                      child: const Text('Añadir'),
                    ),
                  ],
                );
              },
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Future<String> login() async {
    final Map<String, dynamic> userData = {
      'email': 'felipegarces@gmail.com',
      'password': '123456789',
    };

    final response = await http.post(
      Uri.parse(loginURL),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(userData),
    );
    final dynamic responseData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      final String data = responseData['token'];
      return data;
    } else {
      throw Exception('Failed to add item');
    }
  }

  Future<dynamic> getUsers() async {
    final response = await http.get(
      Uri.parse(usersURL),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
            'Bearer 14|zeprw08EALJOqD2yGm3GIE2jSAluWfZKpeOiXIyb30cb4b76'
      },
    );
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      setState(() {
        users = data;
      });
      return data;
    } else {
      throw Exception('Error cargando items');
    }
  }

  Future<void> addItem() async {
    final Map<String, dynamic> userData = {
      'first_name': _controllername.text.toString(),
      'last_name': _controllerlastname.text.toString(),
      'date_birth': _controllerdianamiento.text.toString(),
      'username': _controllerusername.text.toString(),
      'age': int.parse(_controlleredad.text),
      'email': _controlleremail.text.toString(),
    };

    final response = await http.post(
      Uri.parse(usersURL),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      },
      body: jsonEncode(userData),
    );
    if (response.statusCode == 200) {
      getUsers();
    } else {
      throw Exception('Failed to add item');
    }
  }

  Future<void> editItem(int id) async {
    final Map<String, dynamic> userData = {
      'first_name': _controllername.text.toString(),
      'last_name': _controllerlastname.text.toString(),
      'date_birth': _controllerdianamiento.text.toString(),
      'username': _controllerusername.text.toString(),
      'age': int.parse(_controlleredad.text),
      'email': _controlleremail.text.toString(),
    };

    final response = await http.put(
      Uri.parse('$usersURL/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      },
      body: jsonEncode(userData),
    );
    if (response.statusCode == 200) {
      getUsers();
    } else {
      throw Exception('Failed to add item');
    }
  }

  Future<void> deleteItem(int index) async {
    final response = await http.delete(
      Uri.parse('$usersURL/$index'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      },
    );
    if (response.statusCode == 200) {
      getUsers();
    } else {
      throw Exception('Error eliminando');
    }
  }
}
