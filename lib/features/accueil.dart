import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:remotelock/features/auth/userData.dart';

class Accueil extends StatefulWidget {
  const Accueil({super.key});

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [],
      ),
      body: SingleChildScrollView(
        dragStartBehavior: DragStartBehavior.down,
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          decoration: BoxDecoration(
            color: Colors.black87,
            border: Border.all(color: Colors.grey, width: 1.5),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Column(
                  children: [
                    const Text(
                      "Mes appareils",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    Text(
                      UserData.fullname,
                      style: const TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    // const SnackBarCustom(textContent: '',)
                  ],
                ),
              ),
              // Expanded(
              //     child: ListView.builder(
              //   itemCount: candidates.length,
              //   shrinkWrap: true,
              //   physics: const NeverScrollableScrollPhysics(),
              //   itemBuilder: (context, index) {
              //     return Column(
              //       children: [
              //         GestureDetector(
              //           onTap: () {
              //             print("object");
              //           },
              //           child: Container(
              //             padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              //             width: MediaQuery.sizeOf(context).width * 0.85,
              //             height: 70,
              //             decoration: BoxDecoration(
              //                 color: Colors.lightBlueAccent,
              //                 border: Border.all(color: Colors.blueGrey, width: 1.5),
              //                 borderRadius: BorderRadius.circular(20)),
              //             child: Row(
              //               mainAxisAlignment: MainAxisAlignment.center,
              //               children: [
              //                 SizedBox(
              //                     width: MediaQuery.sizeOf(context).width * 0.40, child: Icon(candidates[index].icon)),
              //                 SizedBox(
              //                     width: MediaQuery.sizeOf(context).width * 0.40,
              //                     child: Column(
              //                       children: [
              //                         Text(candidates[index].name),
              //                         Row(
              //                           children: [const Icon(Icons.ac_unit_sharp), Text(candidates[index].status)],
              //                         )
              //                       ],
              //                     )),
              //                 SizedBox(
              //                   width: MediaQuery.sizeOf(context).width * 0.40,
              //                   child: const Icon(Icons.arrow_forward_ios_rounded),
              //                 )
              //               ],
              //             ),
              //           ),
              //         ),
              //         const Gap(10)
              //       ],
              //     );
              //   },
              // ))
            ],
          ),
        ),
      ),
    );
  }
}
