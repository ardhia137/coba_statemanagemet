import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/ref_jns_notif_controller.dart';
import 'ref_jns_notif_form_view.dart';

class RefJnsNotifView extends StatelessWidget {
  final con = Get.put(RefJnsNotifController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("RefJnsNotif GetX")),

      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => RefJnsNotifFormView()),
        child: Icon(Icons.add),
      ),

      body: Obx(() {
        if (con.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (con.list.isEmpty) {
          return Center(child: Text("Data kosong"));
        }

        return ListView.builder(
          itemCount: con.list.length,
          itemBuilder: (_, i) {
            final p = con.list[i];
            return ListTile(
              title: Text(p.kdJnsNotif.toString()),
              subtitle: Text(p.ket ?? "-"),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () =>
                        Get.to(() => RefJnsNotifFormView(refJnsNotif: p)),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () => con.deleteData(p.kdJnsNotif!),
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
