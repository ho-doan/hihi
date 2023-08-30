import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'ccc_state.dart';

class CccCubit extends Cubit<CccState> {
  CccCubit() : super(CccInitial());
  void onPush() {
    var c = 0;
    final cc = state;
    if (cc is CccSuccess) {
      c = cc.count;
    }
    emit(CccSuccess(c + 1));
  }

  void onPop() {
    var c = 0;
    final cc = state;
    if (cc is CccSuccess) {
      c = cc.count;
    }
    emit(CccSuccess(c - 1));
  }
}
