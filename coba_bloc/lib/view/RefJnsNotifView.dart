import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/ref_jns_notif_bloc.dart';
import '../bloc/ref_jns_notif_event.dart';
import '../bloc/ref_jns_notif_state.dart';
import '../services/api_services.dart';
import 'RefJnsNotifFormView.dart';

class RefJnsNotifView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RefJnsNotifBloc(ApiService())..add(LoadRefJnsNotif()),
      child: Builder(
        builder: (context) { 
          return Scaffold(
            appBar: AppBar(title: Text("RefJnsNotif Bloc")),

            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => BlocProvider.value(
                      value: context.read<RefJnsNotifBloc>(),
                      child: RefJnsNotifFormView(),
                    ),
                  ),
                );
              },
              child: Icon(Icons.add),
            ),

            body: BlocBuilder<RefJnsNotifBloc, RefJnsNotifState>(
              builder: (context, state) {
                if (state is RefJnsNotifLoading) {
                  return Center(child: CircularProgressIndicator());
                }

                if (state is RefJnsNotifLoaded) {
                  return ListView.builder(
                    itemCount: state.data.length,
                    itemBuilder: (_, i) {
                      final p = state.data[i];

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
                                    builder: (_) => BlocProvider.value(
                                      value:
                                          context.read<RefJnsNotifBloc>(),
                                      child: RefJnsNotifFormView(
                                          refJnsNotif: p),
                                    ),
                                  ),
                                );
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                context
                                    .read<RefJnsNotifBloc>()
                                    .add(DeleteRefJnsNotif(p.kdJnsNotif!));
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }

                if (state is RefJnsNotifError) {
                  return Center(child: Text(state.message));
                }

                return Center(child: Text("Tidak ada data"));
              },
            ),
          );
        },
      ),
    );
  }
}
