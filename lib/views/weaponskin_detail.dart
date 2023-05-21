import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tpm_final_project/models/weapon_skin.dart';

class WeaponSkinDetail extends StatefulWidget {
  WeaponSkin weaponSkin;
  WeaponSkinDetail({Key? key, required this.weaponSkin}) : super(key: key);

  @override
  State<WeaponSkinDetail> createState() => _WeaponSkinDetailState();
}

class _WeaponSkinDetailState extends State<WeaponSkinDetail> {
  @override
  Widget build(BuildContext context) {
    print(widget.weaponSkin.chromas);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(widget.weaponSkin.displayName!),
        backgroundColor: Color.fromRGBO(29, 66, 137, 1),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: widget.weaponSkin.chromas!.length,
        itemBuilder: (context, index) {
          return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      widget.weaponSkin.chromas![index]['fullRender']),
                  fit: BoxFit.contain,
                ),
              ));
        },
      ),
    ));
  }
}
