import 'dart:convert';
import 'dart:html';
import 'package:crud_flutter_laravel_api/screens/add_guru.dart';
import 'package:crud_flutter_laravel_api/screens/detail.dart';
import 'package:crud_flutter_laravel_api/screens/edit_guru.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({
    Key? key,
  }) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final String url = 'http://127.0.0.1:8000/api/guru';

  Future getGuru() async{
    var response = await http.get(Uri.parse(url));
    return json.decode(response.body);
  }

  Future deleteGuru(String guruId) async{
    String url = 'http://127.0.0.1:8000/api/guru/' + guruId;

    var response = await http.delete(Uri.parse(url));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: ((context) => addGuru())));  
        },
        child: Icon(Icons.add
        ),
      ),
      body: FutureBuilder(
        future:getGuru(),
        builder:(context, snapshot){
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data['data'].length,
              itemBuilder: (context, index) {
               return Container(
                  height: 120,
                  child: Card(
                    elevation: 5,
                    child: Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           Container(
                            child: Text(snapshot.data['data'][index]['no_induk_pegawai'].toString(), style:TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          Container(
                            child: Text(snapshot.data['data'][index]['nama_lenkap'], style:TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          Container(
                            child:Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: ((context) => editguru( guru:snapshot.data['data'][index] ,))));
                                  },
                                  child: Container(
                                    height: 30,
                                    child: Icon(Icons.mode_edit_rounded),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    deleteGuru(snapshot.data['data'][index]['id'].toString()).then((value) {
                                    setState(() {});
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('data berhasil di delete')));
                                    } 
                                    );
                                  },
                                  child: Container(
                                    height: 30,
                                    child: Icon(Icons.delete_forever),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: ((context) => GuruDetail(guru: snapshot.data['data'][index],))));
                                  },
                                  child: Container(
                                    height: 30,
                                    child: Icon(Icons.details_outlined),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                );
                // return Text(snapshot.data['data'][index]['nama_lenkap']);
            });
          }else{
            return Text('data error');
          }
        },
      ),
    );
  }
}
