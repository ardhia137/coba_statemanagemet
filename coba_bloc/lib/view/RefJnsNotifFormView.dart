import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/ref_jns_notif_bloc.dart';
import '../bloc/ref_jns_notif_event.dart';
import '../model/RefJnsNotif.dart';

class RefJnsNotifFormView extends StatefulWidget {
  final RefJnsNotif? refJnsNotif;
  const RefJnsNotifFormView({super.key, this.refJnsNotif});

  @override
  State<RefJnsNotifFormView> createState() => _RefJnsNotifFormViewState();
}

class _RefJnsNotifFormViewState extends State<RefJnsNotifFormView> {
  final TextEditingController ketCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.refJnsNotif != null) {
      ketCtrl.text = widget.refJnsNotif!.ket ?? '';
    }
  }

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.refJnsNotif == null ? "Add RefJnsNotif" : "Edit RefJnsNotif",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: ketCtrl,
              decoration: const InputDecoration(labelText: "Ket"),
            ),
            const SizedBox(height: 20),
           ElevatedButton(
            onPressed: () {
              final data = RefJnsNotif(
                kdJnsNotif: widget.refJnsNotif?.kdJnsNotif,
                ket: ketCtrl.text,
              );

              context.read<RefJnsNotifBloc>().add(SaveRefJnsNotif(data));

              Navigator.pop(context, true);
            },
            child: const Text("Save"),
          )
          ],
        ),
      ),
    );
  }
}
