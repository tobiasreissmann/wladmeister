import 'package:color_remote/bloc/ipAddressBloc.dart';
import 'package:flutter/material.dart';

class IpAddressProvider extends InheritedWidget {
  IpAddressProvider({Key key, this.child}) : super(key: key, child: child);

  final Widget child;

  final bloc = IpAddressBloc();

  static of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(IpAddressProvider)as IpAddressProvider);
  }

  @override
  bool updateShouldNotify( IpAddressProvider oldWidget) {
    return true;
  }
}