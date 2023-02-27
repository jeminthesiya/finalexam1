import 'package:finalexam1/modal.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Add extends StatefulWidget {
  const Add({Key? key}) : super(key: key);

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  TextEditingController fname = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();

  List<Modal> contects = [];
  var uri;

  @override
  Widget build(BuildContext context) {
    var image;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "EDIT CONTECT",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: Center(
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Text(
                "<",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
          ),
          actions: [
            InkWell(
              onTap: () {
                Modal c1 = Modal(
                  name: fname.text,
                  number: phone.text,
                  emailid: email.text,
                );

                setState(() {
                  contects.add(c1);
                });
                Navigator.pushNamed(context, 'add', arguments: contects);
              },
              child: Icon(
                Icons.done,
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            CircleAvatar(
              backgroundImage: (image != null) ? FileImage(image!) : null,
              backgroundColor: Colors.grey,
              radius: 50,
              child: Text(
                (image != null) ? "" : "ADD",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    ImagePicker imagepicker = ImagePicker();
                    XFile? xfile = await imagepicker.pickImage(
                      source: ImageSource.camera,
                    );
                    setState(() {
                      uri = xfile!.path;
                    });
                  },
                  child: Text(
                    "CAMERA",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    ImagePicker imagepicker = ImagePicker();
                    XFile? xfile = await imagepicker.pickImage(
                        source: ImageSource.gallery);
                    setState(() {
                      uri = xfile!.path;
                    });
                  },
                  child: const Text(
                    "ALBUMS",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: fname,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  label: const Text(
                    "FIRST NAME.",
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: phone,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  label: const Text(
                    "MOBILE NO.",
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: email,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  label: const Text(
                    "E-MAIL",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
