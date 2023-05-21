import 'package:flutter/material.dart';

class GuruDetail extends StatelessWidget {
  final Map guru;

  GuruDetail({required this.guru});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("no induk = "+ this.guru['no_induk_pegawai'].toString(), style:TextStyle(fontSize: 30)),
        Text("nama lengkap = "+ this.guru['nama_lenkap'], style:TextStyle(fontSize: 30),),
        Text("mata pelajaran = "+ this.guru['mata_pelajaran'], style:TextStyle(fontSize: 30)),
        Text("tanggal lahir = "+this.guru['tanggal_lahir'], style:TextStyle(fontSize: 30)),
        Text("jenis kelamin = "+ this.guru['jenis_kelamin'], style:TextStyle(fontSize: 30)),
        Text("email = "+ this.guru['email'], style:TextStyle(fontSize: 30)),
        Text("password = "+ this.guru['password'], style:TextStyle(fontSize: 30)),
      ],
    );
  }
}