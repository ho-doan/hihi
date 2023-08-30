part of 'ccc_cubit.dart';

@immutable
sealed class CccState {}

final class CccInitial extends CccState {}

final class CccSuccess extends CccState {
  final int count;

  CccSuccess(this.count);
}
