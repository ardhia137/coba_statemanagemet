import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../services/api_services.dart';
import '../model/RefJnsNotif.dart';

part 'ref_jns_notif_notifier.g.dart';

@riverpod
class RefJnsNotifNotifier extends _$RefJnsNotifNotifier {
  final api = ApiService();

  @override
  Future<List<RefJnsNotif>> build() async {
    return await api.fetchRefJnsNotifs();
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => api.fetchRefJnsNotifs());
  }

  Future<void> saveAndPop(RefJnsNotif p, BuildContext context) async {
    if (p.kdJnsNotif == null) {
      await api.createRefJnsNotif(p);
    } else {
      await api.updateRefJnsNotif(p);
    }
    await refresh();
    Navigator.pop(context, true);
  }


  Future<void> remove(int id) async {
    await api.deleteRefJnsNotif(id);
    await refresh();
  }
}
