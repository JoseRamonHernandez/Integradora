//import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';


class Usuarios {
  String _id;
  String _numUsuario;
  String _nombre;
  String _apellidos;
  String _direccion;
  String _telefono;
  String _status;

  Usuarios(this._id, this._numUsuario, this._nombre, this._apellidos, this._direccion, this._telefono, this._status);

  Usuarios.map(dynamic obj){
    this._numUsuario = obj ['numero de Usuario'];
    this._nombre = obj ['nombre'];
    this._apellidos = obj ['apellidos'];
    this._direccion = obj ['direccion'];
    this._telefono = obj ['telefono'];
    this._status = obj ['status'];
  }
  String get id => _id;
  String get numUsuario => _numUsuario;
  String get nombre => _nombre;
  String get apellidos => _apellidos;
  String get direccion => _direccion;
  String get telefono => _telefono;
  String get status => _status;

  Usuarios.fromSnapShot(DataSnapshot snapshot){
    _id = snapshot.key;
    _numUsuario = snapshot.value['numero de usuario'];
    _nombre = snapshot.value['nombre'];
    _apellidos = snapshot.value['apellidos'];
    _direccion = snapshot.value['direccion'];
    _telefono = snapshot.value['telefono'];
    _status = snapshot.value['status'];
  }
}