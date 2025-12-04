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
        title: Text(ref.read(refJnsNotifProvider.notifier).appBar()),
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const RefJnsNotifFormView()),
        ),
      ),

      body: RefreshIndicator(
        onRefresh: () async {
          print(ref.read(refJnsNotifProvider.notifier));
          ref.refresh(refJnsNotifProvider);
          return;
        },

        child: asyncData.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Center(child: Text("Error: $e")),
          data: (list) {
            if (list.isEmpty) {
              return const Center(child: Text("Data kosong"));
            }

            return ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
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
                        icon: const Icon(Icons.edit),
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
                        icon: const Icon(Icons.delete, color: Colors.red),
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
      ),
    );
  }
}
