import 'package:firebase_auth/firebase_auth.dart';

final String uid = FirebaseAuth.instance.currentUser!.uid;

class RemoteRoutes {
  final String userDoc = 'Users/$uid/';
  final String fileDoc = 'Files/$uid';
}
