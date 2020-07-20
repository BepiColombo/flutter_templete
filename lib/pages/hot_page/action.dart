import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum HotAction { action }

class HotActionCreator {
  static Action onAction() {
    return const Action(HotAction.action);
  }
}
