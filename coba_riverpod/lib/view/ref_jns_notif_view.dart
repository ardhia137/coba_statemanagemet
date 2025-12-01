import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../riverpod/ref_jns_notif_notifier.dart';
import 'ref_jns_notif_form_view.dart';

class RefJnsNotifView extends ConsumerWidget {
  const RefJnsNotifView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncData = ref.watch(refJnsNotifProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("RefJnsNotif Riverpod"),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => RefJnsNotifFormView()),
        ),
      ),

      body: asyncData.when(
        loading: () => Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text("Error: $e")),
        data: (list) {
          if (list.isEmpty) {
            return Center(child: Text("Data kosong"));
          }

          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (_, i) {
              final p = list[i];
              return ListTile(
                title: Text(p.kdJnsNotif.toString()),
                subtitle: Text(p.ket ?? "-"),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                RefJnsNotifFormView(refJnsNotif: p),
                          ),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        ref
                            .read(refJnsNotifProvider.notifier)
                            .remove(p.kdJnsNotif!);
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
