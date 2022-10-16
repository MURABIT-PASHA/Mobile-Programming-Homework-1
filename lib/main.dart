import 'dart:math';
import 'package:flutter/material.dart';
import 'package:homework_1/caesar_cypher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /// Order Text Design: Created by Murabit The Magnificent
  Text orderText(String order) => Text(
        order,
        style: const TextStyle(
            fontFamily: "Poppins", fontWeight: FontWeight.bold, fontSize: 20),
      );

  /// Input Text Decoration Design: Created by Murabit The Magnificent
  InputDecoration textFieldDecoration() => const InputDecoration(
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(
            width: 5.0,
            color: Colors.black,
          )));

  /// ButtonStyle
  ButtonStyle elevatedButtonStyle(Color colour) => ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(colour),
        minimumSize: MaterialStateProperty.all<Size>(const Size(150, 40)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: const BorderSide(color: Colors.white),
          ),
        ),
      );

  /// Container Colors designed by Murabit The Magnificent
  static const blue1 = Color(0xFF03045E);
  static const blue2 = Color(0xFF023E8A);
  static const blue3 = Color(0xFF0077B6);
  static const blue4 = Color(0xFF0096C7);
  static const blue5 = Color(0xFF00B4D8);
  static const blue6 = Color(0xFF48CAE4);
  static const blue7 = Color(0xFF90E0EF);
  static const blue8 = Color(0xFFADE8F4);
  static const blue9 = Color(0xFFCAF0F8);
  var rng = Random().nextInt(100);
  var visibility = false;
  String reversed = "";
  late int userNumber;
  late String binary;
  String guess = "";
  String text = "";
  int cryptNum = 0;
  int dateNum = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: blue9),
        child: ListView(
          children: [
            //First Quest
            Container(
              height: 220,
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: blue8,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  orderText("Bir Tahmin Girin:"),
                  SizedBox(
                    width: 300,
                    child: TextField(
                      decoration: textFieldDecoration(),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          visibility = false;
                        });
                        userNumber = int.parse(value);
                      },
                    ),
                  ),
                  ElevatedButton(
                    style: elevatedButtonStyle(blue1),
                      onPressed: () {
                        if (userNumber == rng) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return alert(
                                  "Kazandın", "Sayıyı doğru tahmin ettin");
                            },
                          );
                        } else if (userNumber < rng) {
                          setState(() {
                            guess = "Daha büyük sayı gir";
                            visibility = true;
                          });
                        } else {
                          setState(() {
                            guess = "Daha küçük sayı gir";
                            visibility = true;
                          });
                        }
                      },
                      child: const Text("Hesapla")),
                  Visibility(
                    visible: visibility,
                    child: Text(guess),
                  )
                ],
              ),
            ),
            //Second Quest
            Container(
              height: 220,
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: blue7,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  orderText("Binary girin:"),
                  SizedBox(
                    width: 300,
                    child: TextField(
                      decoration: textFieldDecoration(),
                      onChanged: (value) {
                        if (value.isEmpty) {
                          value = "0";
                        }
                        try {
                          userNumber = int.parse(value);
                          if (value[value.length - 1] != "0" &&
                              value[value.length - 1] != "1") {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return alert(
                                    "HATA", "Girdiğiniz sayı binary değil");
                              },
                            );
                          }
                          binary = value;
                        } catch (e) {
                          if (e.runtimeType == FormatException) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return alert(
                                    "HATA", "Hatalı formatta giriş yaptınız");
                              },
                            );
                          }
                        }
                      },
                    ),
                  ),
                  ElevatedButton(
                    style: elevatedButtonStyle(blue2),
                      onPressed: () {
                        List bin = binary.split("");
                        double sum = 0;
                        int index = 0;
                        for (String i in bin.reversed) {
                          if (i == "0") {
                            index++;
                            continue;
                          } else {
                            sum += pow(2, index);
                            index++;
                          }
                        }
                        // show the dialog
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return alert("Decimale Çevrildi", "$sum");
                          },
                        );
                      },
                      child: const Text("Hesapla")),
                ],
              ),
            ),
            //Third Quest
            Container(
              height: 220,
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: blue6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  orderText("Yazı girin:"),
                  SizedBox(
                    width: 300,
                    child: TextField(
                      decoration: textFieldDecoration(),
                      onChanged: (value) {
                        if (value.isEmpty) {
                          value = "";
                        } else {
                          List str = value.split("");
                          String newReversed = "";
                          for (String chr in str.reversed) {
                            newReversed += chr;
                          }
                          setState(() {
                            reversed = newReversed;
                          });
                        }
                      },
                    ),
                  ),
                  Text(reversed)
                ],
              ),
            ),
            //Fourth Quest
            Container(
              height: 250,
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: blue5,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  orderText("Yazı girin:"),
                  SizedBox(
                    width: 300,
                    child: TextField(
                      decoration: textFieldDecoration(),
                      onChanged: (value) {
                        if (value.isEmpty) {
                          value = "";
                        } else {
                          text = value;
                        }
                      },
                    ),
                  ),
                  orderText("Numara Girin:"),
                  SizedBox(
                    width: 300,
                    child: TextField(
                      decoration: textFieldDecoration(),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        if (value.isEmpty) {
                          value = '0';
                        } else {
                          cryptNum = int.parse(value);
                        }
                      },
                    ),
                  ),
                  ElevatedButton(
                    style: elevatedButtonStyle(blue3),
                      onPressed: () {
                        CaesarCypher caesarCypher =
                            CaesarCypher(text, cryptNum);
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return alert("Şifrelendi", caesarCypher.encrypt());
                          },
                        );
                      },
                      child: const Text("Hesapla")),
                ],
              ),
            ),
            //Fifth Quest
            Container(
              height: 220,
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: blue4,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  orderText("Saat girin:"),
                  SizedBox(
                    width: 300,
                    child: TextField(
                      decoration: textFieldDecoration(),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        if (value.isEmpty) {
                          value = '0';
                        } else {
                          dateNum = int.parse(value);
                        }
                      },
                    ),
                  ),
                  ElevatedButton(
                    style: elevatedButtonStyle(blue4),
                      onPressed: () {
                        Duration duration = Duration(hours: dateNum);
                        int dateHours = duration.inHours % 24;
                        int dateDays = (duration.inDays % 365).round();
                        int dateYears = (duration.inDays / 365).round();
                        String convertedText =
                            "$dateYears yıl $dateDays gün ve $dateHours saat";
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return alert(
                                "Saat Dönüşümü Yapıldı", convertedText);
                          },
                        );
                      },
                      child: const Text("Hesapla")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget alert(String title, String content) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            child: const Text("TAMAM"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      );
}
