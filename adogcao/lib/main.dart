import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'views/registration_screen.dart';
import 'views/login_screen.dart';
import 'widgets/pet_avatar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyBvdUkpspWIeK_DweVK2UwPaDbKI0ifc0I",
        authDomain: "adogcao-9dd8c.firebaseapp.com",
        projectId: "adogcao-9dd8c",
        storageBucket: "adogcao-9dd8c.appspot.com",
        messagingSenderId: "172314211734",
        appId: "1:172314211734:web:abcd1234efgh5678ijkl90",
        measurementId: "G-XXXXXXXXXX",
      ),
    );
    print("Firebase Initialized");
  } catch (e) {
    print("Error initializing Firebase: $e");
  }
  runApp(AdoptionApp());
}

class AdoptionApp extends StatelessWidget {
  const AdoptionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: AdoptionScreen(),
        ),
      ),
      routes: {
        '/cadastro': (context) => RegistrationScreen(),
        '/login': (context) => LoginScreen(),
      },
    );
  }
}

class AdoptionScreen extends StatelessWidget {
  const AdoptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black,
                const Color.fromARGB(255, 0, 13, 32).withAlpha(200)
              ],
            ),
          ),
        ),
        Positioned.fill(
          child: CustomPaint(
            painter: CurvedLinesPainter(),
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  PetAvatar(
                    name: 'Leo',
                    imageUrl:
                        'https://p2.trrsf.com/image/fget/cf/774/0/images.terra.com/2024/03/29/1527502278-golden-retriever.jpg',
                  ),
                  PetAvatar(
                    name: 'Tom',
                    imageUrl: 'lib/images/tom.png',
                    isAssetImage: true,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              PetAvatar(
                name: 'Lua',
                imageUrl: 'lib/images/lua.png',
                isAssetImage: true,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  PetAvatar(
                    name: 'Thor',
                    imageUrl: 'lib/images/thor.png',
                    isAssetImage: true,
                  ),
                  PetAvatar(
                    name: 'Mel',
                    imageUrl: 'lib/images/mel.png',
                    isAssetImage: true,
                  ),
                ],
              ),
              const SizedBox(height: 50),
              const Text(
                'Adote o animal perfeito para você!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Explore perfis de animais prontos para adoção e use filtros personalizados para encontrar o companheiro ideal. Comece sua jornada de adoção e encontre um amigo para a vida toda!',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40, vertical: 20), // Ajuste do padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Entrar',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16), // Definindo o tamanho da fonte
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CurvedLinesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.grey.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    Path path1 = Path();
    path1.moveTo(0, size.height * 0.20);
    path1.quadraticBezierTo(
      size.width / 2,
      size.height * 0.15,
      size.width,
      size.height * 0.20,
    );
    canvas.drawPath(path1, paint);

    Path path2 = Path();
    path2.moveTo(0, size.height * 0.30);
    path2.quadraticBezierTo(
      size.width / 2,
      size.height * 0.25,
      size.width,
      size.height * 0.30,
    );
    canvas.drawPath(path2, paint);

    Path path3 = Path();
    path3.moveTo(0, size.height * 0.40);
    path3.quadraticBezierTo(
      size.width / 2,
      size.height * 0.35,
      size.width,
      size.height * 0.40,
    );
    canvas.drawPath(path3, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
