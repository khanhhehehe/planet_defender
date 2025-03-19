import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class BottomNavigationCubit extends Cubit<int> {
  BottomNavigationCubit() : super(0);

  void changeTab(int index) {
    emit(index);
  }
}
