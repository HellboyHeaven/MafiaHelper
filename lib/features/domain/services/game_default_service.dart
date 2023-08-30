
import 'package:flutter/material.dart';
import 'package:mafia_helper/features/domain/entities/role.dart';
import 'package:mafia_helper/features/domain/services/game_service.dart';

class GameDefaultService implements GameService {
  int day = 0;

  final Set<Color> colorOrder = {};
  final Map<Role, int> allRoles = {};
  final Map<Role, int> votes = {};
  final kills = <Role>[];

  final currentKills = <Role>[];
  final currentMutes = <Role>[];

  @override
  // TODO: implement color
  Set<Color> get colors => {
    Colors.green,
    Colors.yellow,
    Colors.brown,
    Colors.cyan,
    Colors.red,
    Colors.grey.shade900,
    Colors.pink.shade200,
    Colors.lightGreen,
    Colors.purple,
    Colors.white,
    Colors.blue,
    Colors.orange,
  };
 /* Colors.lightGreen,
  Colors.black,
  Colors.cyan,
  Colors.green,
  Colors.yellow,
  Colors.brown,
  Colors.red,
  Colors.pink.shade200,
  Colors.purple,
  Colors.orange,
  Colors.blue,
  Colors.white,*/



  @override
  int getDay() => day;

  @override
  void nextDay() => day++;

  void vote(Role role) {
    int voteCount = votes[role] ?? 0;
    votes[role] = ++voteCount;
  }

  void kill(Role role) => currentKills.add(role);

  @override
  bool check<T extends Role>(Role role) => role.runtimeType == T ? true : false;

  @override
  void heal(Role role) => currentKills.remove(role);

  @override
  void mute(Role role) => currentMutes.add(role);




}