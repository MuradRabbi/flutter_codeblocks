import 'dart:ui';

import '../service/service.dart';

class Pet {
  @override
  String toString() {
    return 'Name: $name, Color: ${color.toString()}, state: $state';
  }

  final String? name;
  final Color? color;
  final PetState? state;

  const Pet(
      this.name,
      this.color,
      this.state,
      );
}


enum PetState {
  CONTENT,
  MEOWING,
  PURRING,
}


enum PetAction {
  ENTERING,
  LEAVING,
}



// Pet randomCat() => availablePets[rand.nextInt(availablePets.length)];