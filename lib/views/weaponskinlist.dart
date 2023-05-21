import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tpm_final_project/models/weapon_skin.dart';
import 'package:tpm_final_project/views/weaponskin_detail.dart';

class WeaponSkinsList extends StatefulWidget {
  @override
  _WeaponSkinsListState createState() => _WeaponSkinsListState();
}

class _WeaponSkinsListState extends State<WeaponSkinsList> {
  List<dynamic> weaponSkins = [];

  @override
  void initState() {
    super.initState();
    fetchWeaponSkins();
  }

  Future<void> fetchWeaponSkins() async {
    var url = Uri.parse('https://valorant-api.com/v1/weapons/skins');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() {
        weaponSkins = jsonData['data'];
      });
    } else {
      print('Error: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Valorant Weapon Skins'),
        backgroundColor: Color.fromRGBO(29, 66, 137, 1),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
        ),
        itemCount: weaponSkins.length,
        itemBuilder: (context, index) {
          if (weaponSkins[index]['displayIcon'] != null) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WeaponSkinDetail(
                          weaponSkin: WeaponSkin(
                        displayName: weaponSkins[index]['displayName'],
                        displayIcon: weaponSkins[index]['displayIcon'],
                        chromas: weaponSkins[index]['chromas'],
                      )),
                    ));
              },
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 150,
                    child: Image.network(
                      weaponSkins[index]['displayIcon'],
                      fit: BoxFit.contain,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      weaponSkins[index]['displayName'],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return SizedBox.shrink();
          }
        },
      ),
    );
  }
}
