import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    SplashState state, Dispatch dispatch, ViewService viewService) {
  ScreenUtil.init(viewService.context,
      width: 750, height: 1334, allowFontScaling: false);
  return Container(
    child: Text("splash", style: TextStyle(fontSize: ScreenUtil().setSp(28))),
  );
}
