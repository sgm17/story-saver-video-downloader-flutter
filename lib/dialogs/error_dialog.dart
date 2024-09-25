import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({super.key});

  @override
  Widget build(BuildContext context) {
    void toggleRetry() {
      Navigator.of(context).pop();
    }

    return Center(
      child: SingleChildScrollView(
        child: SizedBox(
          height: 146.0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 53.0),
            child: Material(
              borderRadius: BorderRadius.circular(10.0),
              color: const Color.fromARGB(255, 217, 217, 217),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                          "There's no data yet. Please enter the content to fill it.",
                          overflow: TextOverflow.visible,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            height: 1.152999997138977,
                            fontSize: 16.0,
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w300,
                            color: Color.fromARGB(255, 0, 0, 0),

                            /* letterSpacing: 0.0, */
                          )),
                    ),
                  ),
                  GestureDetector(
                    onTap: toggleRetry,
                    child: Container(
                        alignment: Alignment.center,
                        height: 36.0,
                        decoration: const BoxDecoration(
                            border: Border(
                                top: BorderSide(
                                    color: Color.fromARGB(255, 147, 147, 147),
                                    width: 0.5))),
                        child: const Text("Accept",
                            overflow: TextOverflow.visible,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              height: 1.1530000141688757,
                              fontSize: 14.0,
                              fontFamily: 'Gilroy',
                              fontWeight: FontWeight.w300,
                              color: Color.fromARGB(255, 63, 141, 253),

                              /* letterSpacing: 0.0, */
                            ))),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
