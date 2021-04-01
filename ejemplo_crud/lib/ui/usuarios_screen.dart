import 'package:ejemplo_crud/pages/drawer.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:ejemplo_crud/model/usuarios.dart';

class UsuariosScreen extends StatefulWidget {
  final Usuarios usuarios;
  UsuariosScreen(this.usuarios);

  @override
  _UsuariosScreenState createState() => _UsuariosScreenState();
}

final  usuariosReference = FirebaseDatabase.instance.reference().child('usuarios');

class _UsuariosScreenState extends State<UsuariosScreen> {

List<Usuarios> items;

TextEditingController _cedulaController;
TextEditingController _nombreController;
TextEditingController _apellidosController;
TextEditingController _direccionController;
TextEditingController _telefonoController;

@override
void initState() { 
  super.initState();
  _cedulaController = new TextEditingController(text: widget.usuarios.cedula);
 _nombreController = new TextEditingController(text: widget.usuarios.nombre);
 _apellidosController = new TextEditingController(text: widget.usuarios.apellidos);
 _direccionController = new TextEditingController(text: widget.usuarios.direccion);
 _telefonoController = new TextEditingController(text: widget.usuarios.telefono);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerPage(),
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Usuario'),
        backgroundColor: Colors.black,
      ),
      body: Container(
        height: 570.0,
        padding: const EdgeInsets.all(20.0),
        child: Card(
          child: Center(
            child: Column(
              children: <Widget>[
                TextField(
                  controller: _cedulaController,
                  style: TextStyle(fontSize: 17.0, color: Colors.deepOrangeAccent),
                  decoration: InputDecoration(icon: Icon(Icons.batch_prediction_rounded),
                  labelText: 'Cedula'),
                ),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                TextField(
                  controller: _nombreController,
                  style: TextStyle(fontSize: 17.0, color: Colors.deepOrangeAccent),
                  decoration: InputDecoration(icon: Icon(Icons.person),
                  labelText: 'Nombre'),
                ),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                TextField(
                  controller: _apellidosController,
                  style: TextStyle(fontSize: 17.0, color: Colors.deepOrangeAccent),
                  decoration: InputDecoration(icon: Icon(Icons.account_box),
                  labelText: 'Apellidos'),
                ),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                TextField(
                  controller: _direccionController,
                  style: TextStyle(fontSize: 17.0, color: Colors.deepOrangeAccent),
                  decoration: InputDecoration(icon: Icon(Icons.add_location_rounded),
                  labelText: 'Dirección'),
                ),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                TextField(
                  controller: _telefonoController,
                  style: TextStyle(fontSize: 17.0, color: Colors.deepOrangeAccent),
                  decoration: InputDecoration(icon: Icon(Icons.call),
                  labelText: 'Teléfono'),
                ),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                FlatButton(onPressed: (){
                  if(widget.usuarios.id != null){
                    usuariosReference.child(widget.usuarios.id).set({
                    'cedula': _cedulaController.text,
                    'nombre': _nombreController.text,
                    'apellidos': _apellidosController.text,
                    'direccion': _direccionController.text,
                    'telefono': _telefonoController.text,    
                    }).then((_){
                      Navigator.pop(context);
                    });
                  }
                  else{
                    usuariosReference.push().set({
                      'cedula': _cedulaController.text,
                    'nombre': _nombreController.text,
                    'apellidos': _apellidosController.text,
                    'direccion': _direccionController.text,
                    'telefono': _telefonoController.text ,
                    }).then((_){
                      Navigator.pop(context);
                    });
                  }
                }, 
                child: (widget.usuarios.id != null) ? Text('Actualizar') : Text('Añadir')),
              ],
            ),
          ),
          borderOnForeground: true,
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}