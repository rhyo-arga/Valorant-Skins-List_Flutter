import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class KesanPesanPage extends StatelessWidget {
  const KesanPesanPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Kesan Pesan"),
          backgroundColor: Color.fromRGBO(29, 66, 137, 1),
        ),
        body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Kesan :", 
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                  Text('Mata Kuliah Teknologi Pemrograman Mobile ini sangat membantu saya dalam mempelajari pembuatan program Mobile.',
                  style: TextStyle(fontSize: 18),),
                  Text('Dengan adanya mata kuliah ini, saya dapat mempelajari program Mobile dengan lebih baik.',
                  style: TextStyle(fontSize: 18),),
                SizedBox(height: 15,),
                Text("Pesan :", 
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                  Text('Semoga tugas yang diberikan tidak terlalu berat ya pak :)',
                  style: TextStyle(fontSize: 18),),
                  Text('Dan semoga saya mendapatkan nilai A ya pak :)',
                  style: TextStyle(fontSize: 18),),
              ],
            ),

          )
        ],
      ),
        ),
      );
  }
}