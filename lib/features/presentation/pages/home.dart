import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mafia_helper/features/domain/entities/role.dart';
import 'package:mafia_helper/features/domain/entities/roles/detective.dart';
import 'package:mafia_helper/features/domain/entities/roles/doctor.dart';
import 'package:mafia_helper/features/domain/entities/roles/killer.dart';
import 'package:mafia_helper/features/domain/entities/roles/lover.dart';
import 'package:mafia_helper/features/domain/entities/roles/mafia.dart';
import 'package:mafia_helper/features/domain/entities/roles/mafia_boss.dart';
import 'package:mafia_helper/features/presentation/bloc/role_list_cubit.dart';
import 'package:mafia_helper/features/presentation/widgets/cards/role_card.dart';
import 'package:mafia_helper/features/presentation/widgets/table.dart';

import '../../domain/entities/roles/citizen.dart';

class Home extends StatelessWidget {
  Home({super.key});



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.deepOrangeAccent, canvasColor: Colors.lightBlueAccent),
      home: Scaffold(
        appBar: AppBar(title: const Text('Mafia Helper'),centerTitle: true,),
        body:  SafeArea(
          child: BlocProvider(
            create: (_) => RoleListCubit(),
            child: MafiaGameView(),
          )
        ),
      ),
    );
  }
}

class MafiaGameView extends StatelessWidget {
  MafiaGameView({super.key});


  final List<RoleCard<Role>> roleCards = [
    RoleCard<Citizen>(6),
    RoleCard<Mafia>(1),
    RoleCard<MafiaBoss>(1),
    RoleCard<Detective>(1),
    RoleCard<Doctor>(1),
    RoleCard<Killer>(1),
    RoleCard<Lover>(1),
  ];

  void randomize(BuildContext context) {
    var roles = roleCards.map((r) => r.getRoles()).reduce((value, element) => value + element);
    roles.shuffle();
    context.read<RoleListCubit>().fetchList(roles);
  }


  @override
  Widget build(BuildContext context) {
    final state = context.watch<RoleListCubit>().state;

    return SingleChildScrollView(
      child: Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 50),
                child: Wrap(
                    spacing: 50,
                    alignment: WrapAlignment.center,
                    children: roleCards
                ),
              ),

              Padding(
                padding: EdgeInsets.all(50.0),
                child: ElevatedButton(
                  onPressed: () => randomize(context),
                  child: Text('Рандом', style: TextStyle(fontSize: 50),),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 50),
                child:  ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: 100.0,
                    maxWidth: 800.0,
                  ),
                  child: TableExample(state.roles),
                ),
              ),
            ],
          )
      ),
    );
  }
}
