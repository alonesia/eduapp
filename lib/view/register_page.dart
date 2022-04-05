import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

enum Gender { lakiLaki, perempuan }

class _RegisterPageState extends State<RegisterPage> {
  final emailCtrl = TextEditingController();
  final nameCtrl = TextEditingController();
  final skhCtrl = TextEditingController();
  String? gender = "Laki-laki";
  String? kelas = "Kelas I";

  List<String> listKelas = ['Kelas I', 'Kelas II', 'Kelas III'];
  GlobalKey<FormState> _keyForm = GlobalKey<FormState>();

  //cek valid email
  bool isValidEmail(mail) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(mail);
  }

  setGender(Gender type) {
    if (type == Gender.lakiLaki) {
      setState(() {
        gender = "Laki-laki";
      });
    } else {
      setState(() {
        gender = "Perempuan";
      });
    }
  }

  setKelas(String? kls) {
    setState(() {
      kelas = kls;
    });
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: const Text(
            "Yuk isi data diri",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _keyForm,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Email",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                          border: Border.all(color: const Color(0XFFD6D6D6))),
                      child: TextFormField(
                        validator: (val) {
                          return val!.isEmpty
                              ? "Email tidak boleh kosong"
                              : (isValidEmail(val)
                                  ? null
                                  : "Email tidak valid");
                        },
                        controller: emailCtrl,
                        decoration: const InputDecoration(
                          disabledBorder: InputBorder.none,
                          border: InputBorder.none,
                          hintText: "contoh : email@gmail.com",
                          hintStyle: TextStyle(
                            color: Color(0XFFAAAAAA),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Nama lengkap",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                          border: Border.all(color: const Color(0XFFD6D6D6))),
                      child: TextFormField(
                        controller: nameCtrl,
                        validator: (val) {
                          return val!.isEmpty
                              ? "Nama tidak boleh kosong"
                              : null;
                        },
                        decoration: const InputDecoration(
                          disabledBorder: InputBorder.none,
                          border: InputBorder.none,
                          hintText: "contoh : Heri Purnomo",
                          hintStyle: TextStyle(
                            color: Color(0XFFAAAAAA),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Jenis Kelamin",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setGender(Gender.lakiLaki);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: gender == "Laki-laki"
                                  ? const Color(0XFF4a4b4c)
                                  : Colors.white,
                              border: Border.all(
                                color: gender == "Laki-laki"
                                    ? Colors.black
                                    : const Color(0XFFD6D6D6),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: (32),
                              vertical: (12),
                            ),
                            child: Text(
                              "Laki-Laki",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: gender == "Laki-laki"
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: (8),
                        ),
                        GestureDetector(
                          onTap: () {
                            setGender(Gender.perempuan);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: gender == "Perempuan"
                                  ? const Color(0XFF4a4b4c)
                                  : Colors.white,
                              border: Border.all(
                                color: gender == "Perempuan"
                                    ? Colors.black
                                    : const Color(0XFFD6D6D6),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: (32),
                              vertical: (12),
                            ),
                            child: Text(
                              "Perempuan",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: gender == "Perempuan"
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 1, color: Colors.grey.withOpacity(0.5)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          isExpanded: true,
                          value: kelas,
                          hint: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text('Kelas'),
                          ),
                          items: listKelas
                              .map((String e) => DropdownMenuItem<String>(
                                    child: Text(e),
                                    value: e,
                                  ))
                              .toList(),
                          onChanged: (String? value) {
                            setState(() {
                              setKelas(value);
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Nama Sekolah",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                          border: Border.all(color: const Color(0XFFD6D6D6))),
                      child: TextFormField(
                        controller: skhCtrl,
                        validator: (val) {
                          return val!.isEmpty
                              ? "Nama sekolah tidak boleh kosong"
                              : null;
                        },
                        decoration: const InputDecoration(
                          disabledBorder: InputBorder.none,
                          border: InputBorder.none,
                          hintText: "nama sekolah",
                          hintStyle: TextStyle(
                            color: Color(0XFFAAAAAA),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: _height / 7,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            primary: Color(0xff3A7FD5),
                            fixedSize: const Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                                side: const BorderSide(
                                    color: Colors.blue,
                                    style: BorderStyle.solid,
                                    width: 1))),
                        onPressed: () {
                          if (_keyForm.currentState!.validate()) {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text("Nama Lengkap: ${nameCtrl.text}"),
                                        Text("Email : ${emailCtrl.text}"),
                                        Text("Sekolah : ${skhCtrl.text}"),
                                        Text("Kelas : $kelas"),
                                        Text(
                                            "Jenis Kelamin : $gender"), //untuk alert dialog
                                      ],
                                    ),
                                  );
                                });
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Form tidak valid!")));
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            //Image.asset("assets/auth/ic_google.png"),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Daftar",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ));
  }
}
