import 'package:flutter/material.dart';

class TrainingPlan extends StatefulWidget {
  @override
  _TrainingPlanState createState() => _TrainingPlanState();
}

class _TrainingPlanState extends State<TrainingPlan> {

  IconData iconState = false ? Icons.error_outline : Icons.arrow_drop_down_circle_outlined;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage("assets/images/trainingplan.png"),
            alignment: Alignment.centerRight,
            fit: BoxFit.contain,
          ),
        ),
    child: Scaffold(
      backgroundColor: Colors.transparent,
      bottomNavigationBar: BottomAppBar(
        color: Colors.black.withOpacity(1.0),

        child: Row(
          children: [
            Spacer(),
            IconButton(icon: Icon(Icons.keyboard_return), onPressed: () {
              Navigator.pushReplacementNamed(context, '/my_gym');
            }),
            Spacer(flex: 200),
            IconButton(icon: Icon(Icons.notifications_rounded), onPressed: () {}),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
          child: Icon(
            iconState,
            size: 50,
          ),
        onPressed: () {
          // Respond to button press
          Navigator.pushNamed(context, '/infection_control');
        },

      ),

    floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
    ),
    );
  }
}