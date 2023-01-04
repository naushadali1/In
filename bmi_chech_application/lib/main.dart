import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'BMI App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtcont = TextEditingController();
  var ftcont = TextEditingController();
  var incont = TextEditingController();
  String result = '';
  var bgcolor = Color.fromARGB(255, 109, 140, 194);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text("BMI APP"),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            width: 300,
            height: 400,
            decoration: BoxDecoration(
              color: bgcolor,
              border: Border.all(
                width: 2,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "BMI",
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 7,
                ),
                TextField(
                  controller: wtcont,
                  decoration: const InputDecoration(
                      label: Text("Enter your Weight"),
                      prefixIcon: Icon(Icons.line_weight)),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 7,
                ),
                TextField(
                  controller: ftcont,
                  decoration: const InputDecoration(
                      label: Text("Enter your height in feets"),
                      prefixIcon: Icon(Icons.height)),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 7,
                ),
                TextField(
                  controller: incont,
                  decoration: const InputDecoration(
                      label: Text("Enter your height in Inches"),
                      prefixIcon: Icon(Icons.height)),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 19,
                ),
                ElevatedButton(
                    onPressed: () {
                      var wt = wtcont.text.toString();
                      var ft = ftcont.text.toString();
                      var inch = incont.text.toString();
                      if (wt != "" && ft != "" && inch != "") {
                        var iinch = int.parse(inch);
                        var ift = int.parse(ft);
                        var iwt = int.parse(wt);
                        var tinch = (ift * 12) + iinch;
                        var tcmeter = tinch * 2.54;
                        var tmeter = tcmeter / 100.0;
                        var tbmi = iwt / (tmeter * tmeter);
                        String msg;
                        if (tbmi > 25) {
                          msg = 'Your are Over weight';
                          bgcolor = Color.fromARGB(255, 253, 90, 90);
                        } else if (tbmi < 19) {
                          msg = 'Your are under weight';
                          bgcolor = Color.fromARGB(255, 246, 133, 133);
                        } else {
                          msg = 'Your are healthy';
                          bgcolor = Color.fromARGB(255, 174, 249, 177);
                        }
                        setState(() {
                          result =
                              "$msg \n Your BMI is ${tbmi.toStringAsFixed(2)}";
                        });
                      } else {
                        setState(() {
                          result = "Please fill all Fields";
                        });
                      }
                    },
                    child: const Text('Caculate')),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  result,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ));
  }
}
