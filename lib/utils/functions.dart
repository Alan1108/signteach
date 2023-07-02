import 'package:firebase_core/firebase_core.dart';
import 'package:signteach/firebase_options.dart';

void initializeFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
