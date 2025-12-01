import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/api_services.dart';
import 'ref_jns_notif_event.dart';
import 'ref_jns_notif_state.dart';

class RefJnsNotifBloc extends Bloc<RefJnsNotifEvent, RefJnsNotifState> {
  final ApiService api;

  RefJnsNotifBloc(this.api) : super(RefJnsNotifInitial()) {
    on<LoadRefJnsNotif>((event, emit) async {
      emit(RefJnsNotifLoading());
      try {
        final data = await api.fetchRefJnsNotifs();
        emit(RefJnsNotifLoaded(data));
      } catch (e) {
        emit(RefJnsNotifError(e.toString()));
      }
    });

    on<SaveRefJnsNotif>((event, emit) async {
      if (event.data.kdJnsNotif == null) {
        await api.createRefJnsNotif(event.data);
      } else {
        await api.updateRefJnsNotif(event.data);
      }

      add(LoadRefJnsNotif());
    });

    on<DeleteRefJnsNotif>((event, emit) async {
      await api.deleteRefJnsNotif(event.id);
      add(LoadRefJnsNotif());
    });
  }
}
