import 'package:fish_redux/fish_redux.dart';

class HotState implements Cloneable<HotState> {

  @override
  HotState clone() {
    return HotState();
  }
}

HotState initState(Map<String, dynamic> args) {
  return HotState();
}
