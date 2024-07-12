import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Data Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final DatabaseReference _databaseReference = FirebaseDatabase.instance.ref();

  Map<String, dynamic> _data = {};

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

 void _fetchData() async {
  try {
    DataSnapshot snapshot = (await _databaseReference.child('DATA_CTC').once()) as DataSnapshot;
    if (snapshot.value != null) {
      Map<dynamic, dynamic> data = snapshot.value as Map<dynamic, dynamic>;
      setState(() {
        _data = data.map((key, value) => MapEntry(key.toString(), value));
      });
    } else {
      print('Data tidak ditemukan');
    }
  } catch (e) {
    print('Error saat fetching data: $e');
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Data'),
      ),
      body: _data.isNotEmpty
          ? ListView.builder(
              itemCount: _data.length,
              itemBuilder: (context, index) {
                String key = _data.keys.elementAt(index);
                dynamic value = _data[key]; // Tipe value dapat bervariasi
                return ListTile(
                  title: Text(key),
                  subtitle: Text(value.toString()),
                );
              },
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
