//
// @author thinhth on 12/05/2021
//

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ModalsEvent extends Equatable {
  const ModalsEvent();

  @override
  List<Object?> get props => [];
}

class ShowLoadingEvent extends ModalsEvent {}

class HideLoadingEvent extends ModalsEvent {}

class DisplayModal1Event extends ModalsEvent {
  const DisplayModal1Event(this.modal1);
  final Widget modal1;

  @override
  List<Object?> get props => [modal1];
}

class HideModal1Event extends ModalsEvent {}

class DisplayModal2Event extends ModalsEvent {}
