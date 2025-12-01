import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../riverpod/ref_jns_notif_notifier.dart';
import '../model/RefJnsNotif.dart';

class RefJnsNotifFormView extends ConsumerStatefulWidget {
  final RefJnsNotif? refJnsNotif;
  const RefJnsNotifFormView({super.key, this.refJnsNotif});

  @override
  ConsumerState<RefJnsNotifFormView> createState() =>
      _RefJnsNotifFormViewState();
}

class _RefJnsNotifFormViewState
    extends ConsumerState<RefJnsNotifFormView> {
  final ketCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.refJnsNotif != null) {
      ketCtrl.text = widget.refJnsNotif!.ket ?? "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.refJnsNotif == null
            ? "Add RefJnsNotif"
            : "Edit RefJnsNotif"),
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
                  kdJnsNotif: widget.refJnsNotif?.kdJnsNotif,
                  ket: ketCtrl.text,
                );

                ref
                    .read(refJnsNotifProvider.notifier)
                    .saveAndPop(data, context);
              },
            )
          ],
        ),
      ),
    );
  }
}
