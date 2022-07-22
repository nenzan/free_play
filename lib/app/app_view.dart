import 'package:flutter/material.dart';
import 'package:free_play/app/app_vm.dart';
import 'package:free_play/app/ui/splash/splash_view.dart';
import 'package:pmvvm/pmvvm.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  Widget build(context) {
    return MVVM<AppVm>(
      view: () => _AppView(),
      viewModel: AppVm(),
    );
  }
}

class _AppView extends StatelessView<AppVm> {
  const _AppView({Key? key}) : super(key: key);

  Widget render(context, vm) {
    return SplashScreen();
  }
}
