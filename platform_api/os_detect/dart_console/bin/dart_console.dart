import 'package:os_detect/os_detect.dart' as Platform;

void main(List<String> arguments) {
  final onAndroid = Platform.isAndroid;

  print('onAndroid: $onAndroid.');
}
