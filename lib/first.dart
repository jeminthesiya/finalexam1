import 'package:finalexam1/modal.dart';
import 'package:flutter/material.dart';

class First extends StatefulWidget {
  const First({Key? key}) : super(key: key);

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  @override
  Widget build(BuildContext context) {
    List<Modal> m1 = ModalRoute.of(context)!.settings.arguments as List<Modal>;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Icon(
            Icons.arrow_back,
            color: Colors.black26,
          ),
          actions: [
            PopupMenuButton(
              color: Colors.black26,
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 1,
                  child: Row(
                    children: [
                      Icon(Icons.star),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Get The App"),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 1,
                  child: Row(
                    children: [
                      Icon(Icons.star),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Get The App"),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        // body: Column(
        //   children: [
        //     SizedBox(
        //       height: 10,
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.all(10),
        //       child: Row(
        //         children: [
        //           Text(
        //             "MY CONTECT",
        //             style: TextStyle(color: Colors.black26),
        //           ),
        //         ],
        //       ),
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.all(10),
        //       child: TextField(
        //         decoration: InputDecoration(
        //           hintText: 'type name or number',
        //           border: OutlineInputBorder(),
        //         ),
        //       ),
        //     ),
        //     SizedBox(
        //       height: 512,
        //     ),
        //     Container(
        //       height: 50,
        //       width: double.infinity,
        //       color: Colors.white,
        //     ),
        // ListView.builder(
        //   itemCount: m1.length,
        //   itemBuilder: (context, index) {
        //     return con(m1[index].name!, m1[index].number!,
        //         m1[index].emailid!, index);
        //   },
        // ),
        //   ],
        // ),
        body: ListView.builder(
          itemCount: m1.length,
          itemBuilder: (context, index) {
            return con(
                m1[index].name!, m1[index].number!, m1[index].emailid!, index);
          },
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(right: 200, bottom: 10),
          child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                Colors.blue,
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "+",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 40,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget con(String? name, String? phone, String? email, int index) {
    return ListTile(
      leading: CircleAvatar(),
      title: Text("$name"),
      subtitle: Text("$phone"),
      trailing: InkWell(onTap: () {

      }, child: Icon(Icons.call)),
    );
  }
}
