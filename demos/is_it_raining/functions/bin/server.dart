import 'package:firebase_functions/firebase_functions.dart';
import '../lib/src/time.dart';
import '../lib/src/weather.dart';

void main(List<String> args) {
  var message = 'Is it raining in Aarhus?\n\n';

  fireUp(args, (firebase) {
    // Set maxInstances to control costs during unexpected traffic spikes.
    firebase.https.onRequest(
      name: 'IsItRainingInAarhus',
      options: const HttpsOptions(
        cors: Cors(['*']),
        maxInstances: Instances(5),
      ),
      (request) async {
        final now = DateTime.now().inDenmark;
        final weather = await getWeather(now);
        final answer = (weather == 'raining') ? 'Yes' : 'Nope, it\'s $weather';
        return Response(200, body: '$message$answer at ${now.time}.');
      },
    );
  });
}
