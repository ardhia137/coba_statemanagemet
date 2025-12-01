import 'package:equatable/equatable.dart';
import '../model/RefJnsNotif.dart';

abstract class RefJnsNotifState extends Equatable {
  @override
  List<Object?> get props => [];
}

class RefJnsNotifInitial extends RefJnsNotifState {}

class RefJnsNotifLoading extends RefJnsNotifState {}

class RefJnsNotifLoaded extends RefJnsNotifState {
  final List<RefJnsNotif> data;
  RefJnsNotifLoaded(this.data);

  @override
  List<Object?> get props => [data];
}

class RefJnsNotifError extends RefJnsNotifState {
  final String message;
  RefJnsNotifError(this.message);
}
