//
// @author thinhth on 12/05/2021
//

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ModalsState extends Equatable {
  // const ModalsState();
  // @override
  // // TODO: implement props
  // List<Object?> get props => [];

  const ModalsState({this.isLoading = false, this.modalLv1, this.modalLv2});

  final bool isLoading;
  final Widget? modalLv1;
  final Widget? modalLv2;

  @override
  List<Object?> get props => [isLoading, modalLv1, modalLv2];

  ModalsState copyWith(
      {bool? loading, Widget? modal1, Widget? modal2, bool? hideModal1}) {
    final hideModalLv1 = hideModal1 ?? false;
    // Loggers.d("loading $loading");
    return ModalsState(
        isLoading: loading ?? isLoading,
        modalLv1: hideModalLv1 ? null : modal1 ?? modalLv1,
        modalLv2: modal2);
  }

  // void updateWith({bool? loading, Widget? modal1, Widget? modal2}) {
  //   Loggers.d("loading $loading");
  //   this.isLoading = loading ?? isLoading;
  // }
}

// class ShowLoadingState extends ModalsState {}
//
// class HideLoadingState extends ModalsState {}

// class DisplayModal1State extends ModalsState {}
