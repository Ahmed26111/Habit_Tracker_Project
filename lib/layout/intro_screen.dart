import 'package:flutter/material.dart';
import 'package:habit_tracker_project/shared/util/custom_wave_clipper.dart';
import 'package:habit_tracker_project/layout/home_screen.dart';



class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(

        children: [

          Container(
            width: double.infinity,
            height: double.infinity,
            color: Theme.of(context).primaryColor,
          ),

          Positioned(
            top: 87,
            left: 65,
            child: Image.asset(
              'assets/image-boy-remove (1).png',
              height: 300,
            ),
            ),

          Align(
            alignment: Alignment.bottomCenter,
            child: ClipPath(
              clipper: CustomWaveClipper(),
              child: Container(
                height: 450,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
            ),
          ),

          Positioned(
            top: 80,
            left: 40,
            child:  Text(
                'Hi !',
                style:  TextStyle(
                  color: Theme.of(context).canvasColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 35
                ),
            ),
          ),

          Positioned(
            top: 500,
            left: 30,
            child:  Text(
                'Are You Ready',
                style:  TextStyle(
                  color: Theme.of(context).primaryColorDark,
                  fontWeight: FontWeight.w400,
                  fontSize: 30
                ),
            ),
          ),

          Positioned(
            top: 540,
            left: 30,
            child:  Text(
              'To build some habits?',
              style:  TextStyle(
                  color: Theme.of(context).primaryColorDark,
                  fontWeight: FontWeight.bold,
                  fontSize: 30
              ),
            ),
            ),

          Positioned(
            top: 650,
            left: 80,
            child: ElevatedButton(
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context)=>HomeScreen()
                      )
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  )
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 13,
                  children: [
                    Text('Continue',
                        style:  TextStyle(
                            color: Theme.of(context).canvasColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 25
                        ),

                    ),
                    Icon(Icons.arrow_forward,size: 25,color: Theme.of(context).canvasColor,)
                  ],
                )
            )
            ),

        ],
      ),
    );
  }
}
