import 'package:flutter/material.dart';

class NotificationButton extends StatelessWidget {
  const NotificationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(120),
      ),
      onTap: () {},
      child: SizedBox(
        width: 60,
        height: 50,
        child: Center(
          child: Stack(
            children: [
              const Icon(
                Icons.notifications,
                color: Colors.white,
                size: 30,
              ),
              Container(
                width: 30,
                height: 30,
                alignment: Alignment.topRight,
                margin: const EdgeInsets.only(top: 1),
                child: Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                      border: Border.all(color: Colors.white, width: 1)),
                  child: const Padding(
                    padding: EdgeInsets.all(0.0),
                    child: Center(
                      child: Text(
                        '2',
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
