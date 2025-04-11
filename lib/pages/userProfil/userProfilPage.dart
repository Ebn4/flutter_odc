
import 'package:app/pages/login/login.dart';
import 'package:app/pages/userProfil/userProfilCtrl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../login/loginControl.dart';

class UserProfilePage extends ConsumerStatefulWidget {
  const UserProfilePage({super.key});

  @override
  ConsumerState<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends ConsumerState<UserProfilePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      var loginState=ref.read(loginControlPorvider);
      var ctrl=ref.read(userProfileCtrlProvider.notifier);
      ctrl.recupererUser(loginState.user);

    });
  }

  @override
  Widget build(BuildContext context,) {
    final state = ref.watch(userProfileCtrlProvider);
    final controller = ref.read(userProfileCtrlProvider.notifier);

    final userName = state.user?.name ?? "100 blaze";
    final userEmail = state.user?.email ?? "100mails@gmail.com";

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profil Utilisateur',
          style: TextStyle(fontSize: 26, color: Colors.white),
        ),
        elevation: 12,
        backgroundColor: Colors.red,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white),
            onPressed: () => controller.actualiserUser(),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 80,
                backgroundColor: Colors.red,
                child: Icon(Icons.person, size: 80, color: Colors.white),
              ),
              const SizedBox(height: 20),
              Text(
                userName,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                userEmail,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 60),
              ElevatedButton(
                onPressed: () async {
                  await controller.deconnecterUser();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) =>  Login()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 50, vertical: 15),
                ),
                child: const Text(
                  'Déconnexion',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
