import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<HotState> buildEffect() {
  return combineEffects(<Object, Effect<HotState>>{
    HotAction.action: _onAction,
  });
}

void _onAction(Action action, Context<HotState> ctx) {
}
