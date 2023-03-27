import 'package:async_redux/async_redux.dart';
import 'package:pokedex_asyn_redux/state/app_state.dart';

/// An action that adds a loading state to the application state.
abstract class LoadingAction extends ReduxAction<AppState> {
  LoadingAction({required this.actionKey});

  final String actionKey;

  @override
  void before() => dispatchSync(WaitAction.add(actionKey));

  @override
  void after() => dispatchSync(WaitAction.remove(actionKey));
}
