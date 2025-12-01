import 'package:equatable/equatable.dart';
import '../model/RefJnsNotif.dart';

abstract class RefJnsNotifEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadRefJnsNotif extends RefJnsNotifEvent {}

class SaveRefJnsNotif extends RefJnsNotifEvent {
  final RefJnsNotif data;
  SaveRefJnsNotif(this.data);
}


class DeleteRefJnsNotif extends RefJnsNotifEvent {
  final int id;
  DeleteRefJnsNotif(this.id);
}
