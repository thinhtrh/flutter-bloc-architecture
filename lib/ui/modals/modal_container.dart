//
// @author thinhth on 12/05/2021
//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/blocs/blocs.dart';
import 'package:todo_bloc/ui/ui.dart';
import 'package:todo_bloc/utils/utils.dart';

class ModalContainer extends StatelessWidget {
  const ModalContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ModalsBloc, ModalsState>(
      builder: (context, state) {
        final bool isFetching = state.isLoading;
        Loggers.d("ModalContainer $isFetching");
        final Widget? modal1 = state.modalLv1;
        final Widget? modal2 = state.modalLv2;

        if (isFetching || modal1 is Widget || modal2 is Widget) {
          return Stack(
            children: [
              Positioned(
                  top: 0,
                  left: 0,
                  child: GestureDetector(
                    onTap: () {
                      Loggers.d("on Tap");
                    },
                    child: Container(
                      width: MyMetrics.getScreenWidth(context),
                      height: MyMetrics.getScreenHeight(context),
                      color: MyColors.black.withOpacity(0.8),
                    ),
                  )),
              Positioned(
                width: MyMetrics.getScreenWidth(context),
                height: MyMetrics.getScreenHeight(context),
                child: Center(child: modal1 ?? Container()),
              ),
              Positioned(
                width: MyMetrics.getScreenWidth(context),
                height: MyMetrics.getScreenHeight(context),
                child: modal2 ?? Container(),
              ),
              isFetching == true
                  ? Container(
                      width: MyMetrics.getScreenWidth(context),
                      height: MyMetrics.getScreenHeight(context),
                      color: MyColors.white.withOpacity(0),
                      child: Center(
                        child: CircularProgressIndicator(
                          color: MyColors.green,
                        ),
                      ),
                    )
                  : Container(),
            ],
          );
        }

        return Container();
      },
    );
  }
}
