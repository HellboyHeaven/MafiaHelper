import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mafia_helper/features/domain/entities/role.dart';
import 'package:mafia_helper/features/domain/services/role_factory.dart';
import 'package:mafia_helper/features/domain/services/role_service.dart';
import 'package:mafia_helper/injection_container.dart';
import 'package:mafia_helper/numericRangeFormatter.dart';


class RoleCard<T extends Role> extends StatefulWidget {
  RoleCard(this._count, {super.key}) {

    _image = getIt.get<RoleService>().getImageByType<T>();
  }
  late ImageProvider _image;
  int _count = 0;



  @override
  State<RoleCard> createState() => _RoleCardState();

  List<Role> getRoles() {
    var result = <Role>[];
    for(int i=0; i<_count; i++) {
      result.add(RoleFactory.createRole<T>());
    }
    return result;
  }
}

class _RoleCardState extends State<RoleCard> {
   final BorderRadius _borderRadius = BorderRadius.circular(40);
   late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget._count.toString());
    _controller.addListener(onEdited);

  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  void onEdited() {
    setState(() {
      widget._count = int.parse(_controller.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: _borderRadius,
        border: Border.all(color: Colors.blueAccent),
        color: Colors.indigoAccent,
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: 50,
          maxWidth: 200,
        ),
        child: AspectRatio(
          aspectRatio: 1/1.25,
          child : Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget> [
              AspectRatio(
                aspectRatio: 1,
                child:  Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        alignment: FractionalOffset.topCenter,
                        image: widget._image,
                      ),
                  ),
                ),
              ),
              FractionallySizedBox(
                widthFactor: 0.25,
                child: TextField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    NumericRangeFormatter(min: 0, max: 12),
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  controller: _controller,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
