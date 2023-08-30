

import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:mafia_helper/features/domain/entities/role.dart';
import 'package:mafia_helper/features/domain/services/game_service.dart';
import 'package:mafia_helper/features/presentation/widgets/cards/player_card.dart';
import 'package:mafia_helper/injection_container.dart';

import '../../domain/entities/roles/citizen.dart';



class TableExample extends StatelessWidget {
  TableExample(this._roles, { super.key});

  final List<Role> _roles;

  final Set<Color> _colors = getIt.get<GameService>().colors;

  @override
  Widget build(BuildContext context) {
    int i = 0;

    return Container(
      child: GridView.count(
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        crossAxisCount: 5,
        childAspectRatio: 1,
        children: List.generate(25, (index) {
          if ([0,4,6,7,8,11,12,13,16,17,18,20,24].contains(index)) {
            return SizedBox();
          }
          return PlayerCard(_roles.length > i ? _roles[i] : null , _colors.elementAt(i++));
        }),
      ),
    );
  }
}


