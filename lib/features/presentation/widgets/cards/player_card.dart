import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mafia_helper/features/domain/entities/role.dart';
import 'package:mafia_helper/features/domain/services/role_service.dart';
import 'package:mafia_helper/injection_container.dart';

class PlayerCard extends StatefulWidget {
  PlayerCard(this._role, this._color,{super.key});

  final Color _color;
  Role? _role;

  @override
  State<PlayerCard> createState() => _PlayerCardState();

}

class _PlayerCardState extends State<PlayerCard> {
  final BorderRadius _borderRadius = BorderRadius.circular(20);


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: getIt.get<RoleService>().getImage(widget._role),
        ),
        color: Colors.grey,
        borderRadius: _borderRadius,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: AlignmentDirectional.topCenter,
        children: [
          Positioned(
            top:-10,
            child: Container(
              height: 20,
              width: 60,
              decoration: BoxDecoration(
                color: widget._color,
                borderRadius: _borderRadius,
              ),
            ),
          ),
        ],
      ),
    ) ;
  }
}
