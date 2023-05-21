import 'dart:convert';
import 'package:crud_flutter_laravel_api/screens/detail.dart';
import 'package:crud_flutter_laravel_api/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class editguru extends StatelessWidget {
  final Map guru;

  editguru({required this.guru});

  final _formKey = GlobalKey<FormState>();
  TextEditingController _noindukController = TextEditingController();
  TextEditingController _namaController = TextEditingController();
  TextEditingController _matapelajaranController = TextEditingController();
  TextEditingController _tglController = TextEditingController();
  TextEditingController _jeneiskController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _pwController = TextEditingController();
  
  Future updateGuru() async{
   final Response = await http.put(Uri.parse("http://127.0.0.1:8000/api/guru/" + guru['id'].toString()),body:{
    "no_induk_pegawai":_noindukController.text,
    "nama_lenkap":_namaController.text,
    "mata_pelajaran":_matapelajaranController.text,
    "tanggal_lahir":_tglController.text,
    "jenis_kelamin":_jeneiskController.text,
    "email":_emailController.text,
    "password":_pwController.text,
   } );

   return json.decode(Response.body);
  }
 
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key:_formKey,
        child: Column(
          children: [
            TextFormField(
              controller:_noindukController..text = guru['no_induk_pegawai'].toString(),
              decoration: InputDecoration(
                labelText: "no induk",
              ),
              validator:(value){
                if(value == null || value.isEmpty){
                  return "tidak boleh kosong";
                }
                return null;
              }
            ),
            TextFormField(
              controller:_namaController..text = guru['nama_lenkap'],
              decoration: InputDecoration(
                labelText: "nama lengkap"
              ),
               validator:(value){
                if(value == null || value.isEmpty){
                  return "tidak boleh kosong";
                }
                return null;
              }
            ),
            TextFormField(
              controller:_matapelajaranController..text = guru['mata_pelajaran'],
              decoration: InputDecoration(
                labelText: "mata pelajaran"
              ),
               validator:(value){
                if(value == null || value.isEmpty){
                  return "tidak boleh kosong";
                }
                return null;
              }
            ),
            TextFormField(
              controller:_tglController..text = guru['tanggal_lahir'],
              decoration: InputDecoration(
                labelText: "tanggal lahir"
              ),
            ),
            TextFormField(
              controller:_jeneiskController..text = guru['jenis_kelamin'],
              decoration: InputDecoration(
                labelText: "jenis kelamin"
              ),
               validator:(value){
                if(value == null || value.isEmpty){
                  return "tidak boleh kosong";
                }
                return null;
              }
            ),
            TextFormField(
              controller:_emailController..text = guru['email'],
              decoration: InputDecoration(
                labelText: "email"
              ),
               validator:(value){
                if(value == null || value.isEmpty){
                  return "tidak boleh kosong";
                }
                return null;
              }
            ),
            TextFormField(
              controller:_pwController..text = guru['password'],
              decoration: InputDecoration(
                labelText: "password"
              ),
               validator:(value){
                if(value == null || value.isEmpty){
                  return "tidak boleh kosong";
                }
                return null;
              }
            ),
            ElevatedButton(
            onPressed: () {
              if (_formKey.currentState?.validate() == true) {
                updateGuru().then((value) => {
                  Navigator.push(context, MaterialPageRoute(builder: ((context) => Homepage()))),
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('data berhasil di update')))
                });
              }
            }, child: Text('update'))
          ],
        ),
      ),
    );
  }
}