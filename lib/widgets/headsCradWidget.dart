// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, file_names, no_logic_in_create_state
import 'package:flutter/material.dart';
import 'package:news_app/modules/headCardInfo.dart';

class HeadsCard extends StatelessWidget {
  HeadsCardsInfo info;
  HeadsCard({required this.info});

  Future<void> newMethod() async {
    await info.function();
    info.refreshFunction();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //initState();
        newMethod();
      },
      child: Container(
        height: MediaQuery.of(context).size.height / 5.8,
        width: MediaQuery.of(context).size.width / 2.5,
        alignment: Alignment.center,
        margin: const EdgeInsets.only(top: 10, right: 6, left: 6, bottom: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(image: info.image, fit: BoxFit.fill),
        ),
        child: Text(
          info.Title,
          style: const TextStyle(
            color: Color.fromARGB(255, 198, 198, 198),
            fontSize: 22,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                  color: Colors.black, blurRadius: 0.5, offset: Offset(0.5, 1))
            ],
          ),
        ),
      ),
    );
  }
}
