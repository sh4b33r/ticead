abstract class NavpageEvent {}

class NavTabChangeCLicked extends NavpageEvent {
 NavTabChangeCLicked({required this.index});
final int index;
}
