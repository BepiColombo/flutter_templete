import 'package:fish_redux/fish_redux.dart';
import 'package:taoke/global/state.dart';
import 'package:taoke/global/store.dart';
import 'package:taoke/pages/home_page/page.dart';
import 'package:taoke/pages/hot_page/page.dart';
import 'package:taoke/pages/splash_page/page.dart';

class Routes {
  static final PageRoutes routes = PageRoutes(
      pages: <String, Page<Object, dynamic>>{
        'home': HomePage(),
        'hot': HotPage(),
        'splash': SplashPage()
      },
      visitor: (String path, Page<Object, dynamic> page) {
        if (page.isTypeof<GlobalState>()) {
          page.connectExtraStore<GlobalState>(GlobalStore.store,
              (Object pagestate, GlobalState appState) {
            final GlobalState p = pagestate;
            if (p.themeColor != appState.themeColor) {
              if (pagestate is Cloneable) {
                final Object copy = pagestate.clone();
                final GlobalState newState = copy;
                newState.themeColor = appState.themeColor;
                return newState;
              }
            }
            return pagestate;
          });
        }
        page.enhancer.append(
          /// View AOP
          viewMiddleware: <ViewMiddleware<dynamic>>[
            safetyView<dynamic>(),
          ],

          /// Adapter AOP
          adapterMiddleware: <AdapterMiddleware<dynamic>>[
            safetyAdapter<dynamic>()
          ],

          /// Effect AOP
          effectMiddleware: [
            _pageAnalyticsMiddleware<dynamic>(),
          ],

          /// Store AOP
          middleware: <Middleware<dynamic>>[
            logMiddleware<dynamic>(tag: page.runtimeType.toString()),
          ],
        );
      });
}

/**
 * effect 打印日志
 */
EffectMiddleware<T> _pageAnalyticsMiddleware<T>({String tag = 'redux'}) {
  return (AbstractLogic<dynamic> logic, Store<T> store) {
    return (Effect<dynamic> effect) {
      return (Action action, Context<dynamic> ctx) {
        if (logic is Page<dynamic, dynamic> && action.type is Lifecycle) {
          print('${logic.runtimeType} ${action.type.toString()} ');
        }
        return effect?.call(action, ctx);
      };
    };
  };
}
