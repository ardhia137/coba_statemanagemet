import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/ref_jns_notif_controller.dart';
import '../model/RefJnsNotif.dart';

class RefJnsNotifFormView extends StatelessWidget {
  final RefJnsNotif? refJnsNotif;

  RefJnsNotifFormView({this.refJnsNotif});

  final con = Get.find<RefJnsNotifController>();
  final ketCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (refJnsNotif != null) {
      ketCtrl.text = refJnsNotif!.ket ?? "";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(refJnsNotif == null ? "Add RefJnsNotif" : "Edit RefJnsNotif"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: ketCtrl,
              decoration: InputDecoration(labelText: "Ket"),
            ),

            SizedBox(height: 20),

            ElevatedButton(
              child: Text("Save"),
              onPressed: () {
                final data = RefJnsNotif(
                  kdJnsNotif: refJnsNotif?.kdJnsNotif,
                  ket: ketCtrl.text,
                );
                con.saveData(data);
                Get.back();
              },
            )
          ],
        ),
      ),
    );
  }
}
