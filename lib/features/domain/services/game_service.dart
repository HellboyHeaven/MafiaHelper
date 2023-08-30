import 'package:flutter/material.dart';

import '../entities/role.dart';

abstract class GameService {
  final Set<Color> colors = {};
  int getDay();
  void nextDay();
  void vote(Role role);
  void kill(Role role);
  bool check<T extends Role>(Role role);
  void heal(Role role);
  void mute(Role role);
}