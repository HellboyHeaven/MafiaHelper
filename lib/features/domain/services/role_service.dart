import 'package:flutter/cupertino.dart';
import '../entities/role.dart';

abstract class RoleService {
  ImageProvider getImage(Role? role);
  ImageProvider getImageByType<T extends Role>();
}