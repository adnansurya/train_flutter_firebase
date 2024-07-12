import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import services to change orientation
import 'package:tap_project/pages/pages.dart'; // Import the main library file
import 'package:tap_project/shared/shared.dart'; // Import shared to access secondaryColor

// Contoh data login, ganti dengan data nyata jika ada
final List<String> loginList = [
  'yusrilyudhap@gmail.com',
  'anotherduyy@gmail.com',
];

final Map<String, int> imageStatus = {};
// Pemetaan key dari Firebase ke path gambar di Flutter
final Map<String, String> firebaseKeyToImagePath = {
  'VAR_WKA_SIG_SHT1764_I_RSET': 'assets/images/VAR.WKA.SIG_SHT1764.I_RSET.png',
  // Tambahkan pemetaan lain di sini
};

void main() {
  // Contoh penggunaan
  String key = 'VAR_WKA_SIG_SHT1764_I_RSET';
  String? imagePath = firebaseKeyToImagePath[key];
  
  if (kDebugMode) {
    print(imagePath);
  } // Output: assets/images/VAR.WKA.SIG_SHT1764.I_RSET.png
}


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String currentLoggedInUser = ''; // Variable untuk menyimpan email pengguna yang sedang login

  @override
  void initState() {
    super.initState();
    // Set the orientation to landscape
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    _fetchImageStatusFromFirebase();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _fetchImageStatusFromFirebase() {
  DatabaseReference ref = FirebaseDatabase.instance.ref().child('imageStatus');
  ref.onValue.listen((event) {
    final data = event.snapshot.value as Map?;
    if (data != null) {
      print('Data received from Firebase: $data');
      setState(() {
        // Memperbarui status gambar berdasarkan data dari Firebase
        data.forEach((key, value) {
          String imagePath = firebaseKeyToImagePath[key] ?? '';
          if (imagePath.isNotEmpty && imageStatus.containsKey(imagePath)) {
            print('Updating status for $imagePath to ${value['Value']}');
            imageStatus[imagePath] = value['Value'];
          } else {
            print('Image path $imagePath not found in imageStatus map');
          }
        });
      });
    }
  });
}


  String _getImagePathFromFirebaseKey(String firebaseKey) {
    // Menggunakan pemetaan key dari Firebase ke path gambar di Flutter
    return firebaseKeyToImagePath[firebaseKey] ?? 'assets/image/path.png';
  }

  void _showLoginList(BuildContext context) {
    // Menampilkan daftar login dalam sebuah dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Login List'),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: loginList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(loginList[index]),
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _logout(BuildContext context) {
    // Mengembalikan orientasi ke potret sebelum beralih ke WelcomePage
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]).then((_) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const WelcomePage(),
        ),
      );
    });
  }

  Color _getImageColor(String imagePath, int status) {
    // Menentukan warna berdasarkan status gambar
    if (imagePath.contains('LB')) {
      if (status == 0) {
        return Colors.transparent; // No color filter, original image color
      } else if (status == 1) {
        return Colors.green; // menyala (hijau)
      } else {
        return Colors.red; // ada kendala (merah)
      }
    } else {
      switch (status) {
        case 0:
          return Colors.grey; // mati
        case 1:
          return Colors.yellow; // menyala
        case 2:
          return Colors.red; // ada kendala
        default:
          return Colors.white; // default color
      }
    }
  }

  void _showImageStatus(BuildContext context, String imagePath) {
    // Menampilkan status gambar dalam sebuah dialog
    int status = imageStatus[imagePath] ?? 1;
    String statusText;
    switch (status) {
      case 0:
        statusText = 'Mati (Abu)';
        break;
      case 1:
        statusText = 'Menyala (Kuning/Hijau)';
        break;
      case 2:
        statusText = 'Ada Kendala (Merah)';
        break;
      default:
        statusText = 'Tidak Diketahui';
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Image Status'),
          content: Text('Status: $statusText'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set background color to black
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          ElevatedButton(
            onPressed: () {
              // Menentukan email pengguna yang sedang login (di sini hanya contoh menggunakan user pertama)
              setState(() {
                currentLoggedInUser = loginList.isNotEmpty ? loginList[0] : '';
              });
              _showLoginList(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: secondaryColor,
              // Set button color to secondaryColor
            ),
            child: const Text(
              'View Login List',
              style: TextStyle(color: Colors.black), // Set text color to black
            ),
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            color: Colors.white, // Set icon color to white
            onPressed: () {
              _logout(context);
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          // First row of images
          _buildPositionedImage('assets/images/1789.png', 0, 180, 55, 17),
          _buildPositionedImage('assets/images/1787.png', 56, 180, 55, 17),
          _buildPositionedImage('assets/images/1785.png', 112, 180, 55, 17),
          _buildPositionedImage('assets/images/rel-pendek1.png', 169, 180, 38, 17),
          _buildPositionedImage('assets/images/T1.png', 220, 111, 83, 71),
          _buildPositionedImage('assets/images/rel-pendek2.png', 214, 180, 38, 17),
          _buildPositionedImage('assets/images/rel-pendek3.png', 253, 180, 38, 17),
          _buildPositionedImage('assets/images/rel-120d.png', 207, 194, 94, 55),
          _buildPositionedImage('assets/images/T6.png', 296, 180, 55, 17),
          _buildPositionedImage('assets/images/1796x.png', 310, 108, 60, 20),
          _buildPositionedImage('assets/images/rel-miring1.png', 303, 50, 72, 62),
          _buildPositionedImage('assets/images/T5.png', 365, 47, 82, 15),
          _buildPositionedImage('assets/images/T3.png', 370, 110, 72, 16),
          _buildPositionedImage('assets/images/1795x.png', 442, 109, 64, 17),
          _buildPositionedImage('assets/images/T2.png', 353, 186, 180, 5),
          _buildPositionedImage('assets/images/rel-miring2.png', 437, 53, 72, 64),
          _buildPositionedImage('assets/images/T7.png', 509, 109, 24, 17),
          _buildPositionedImage('assets/images/T4.png', 535, 180, 55, 17),
          _buildPositionedImage('assets/images/rel-diagonal.png', 533, 124, 69, 52),
          _buildPositionedImage('assets/images/tel-t.png', 542, 107, 41, 21),
          _buildPositionedImage('assets/images/rel-pendek4.png', 598, 180, 38, 17),
          _buildPositionedImage('assets/images/1764.png', 636, 180, 55, 17),
          _buildPositionedImage('assets/images/1762.png', 693, 180, 55, 17),
          _buildPositionedImage('assets/images/1760.png', 748, 180, 55, 17),
          _buildPositionedImage('assets/images/LB1760.png', 777, 165, 30, 14),
          _buildPositionedImage('assets/images/LB1761.png', 683, 200, 30, 14),
          _buildPositionedImage('assets/images/LB1762.png', 734, 157, 30, 14),
          _buildPositionedImage('assets/images/LB1763.png', 514, 202, 30, 14),
          _buildPositionedImage('assets/images/LB1765.png', 436, 143, 30, 14),
          _buildPositionedImage('assets/images/LB1767.png', 428, 68, 30, 14),
          _buildPositionedImage('assets/images/LB1782.png', 339, 164, 30, 14),
          _buildPositionedImage('assets/images/LB1784.png', 350, 88, 30, 14),
          _buildPositionedImage('assets/images/LB1786.png', 353, 31, 30, 14),
          _buildPositionedImage('assets/images/LB1787.png', 51, 216, 30, 14),
          _buildPositionedImage('assets/images/LB1788.png', 101, 162, 30, 14),
          _buildPositionedImage('assets/images/LB1789.png', 3, 199, 30, 14),
          _buildPositionedImage('assets/images/VAR.WKA.SIG_SHT1764.I_RSET.png', 623, 160, 27, 18),
        ],
      ),
    );
  }

  Widget _buildPositionedImage(String imagePath, double left, double top, double width, double height) {
    int status = imageStatus[imagePath] ?? 1; // Default to 1 (menyala) if not found
    return Positioned(
      left: left,
      top: top,
      child: GestureDetector(
        onTap: () {
          _showImageStatus(context, imagePath);
        },
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(
            _getImageColor(imagePath, status),
            BlendMode.srcATop,
          ),
          child: Image.asset(
            imagePath,
            width: width,
            height: height,
          ),
        ),
      ),
    );
  }
}