import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text(
        'BreakFast',
        style: TextStyle(
          color: Colors.black, 
          fontSize: 19,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      backgroundColor: const Color.fromARGB(255, 227, 183, 20),
      elevation: 0.0,
      leading: GestureDetector(
        onTap: (){
          
        },
        child: Container(
          margin: const EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.white, 
              borderRadius: BorderRadius.circular(12.0)),
          child: SvgPicture.asset('assets/icons/leftarrow.svg',
          // height: 20,
          // width: 20,
          ),
        
        ),
      ),
      actions: [
         GestureDetector(
          onTap: (){

            },
          child: Container(
            margin: const EdgeInsets.all(10),
            alignment: Alignment.center,
            width: 35,
            decoration: BoxDecoration(
              color: const Color(0xffF7F8F8), 
              borderRadius: BorderRadius.circular(12.0),),
            child: SvgPicture.asset('assets/icons/dot.svg',
            // height: 20,
            // width: 20,
            ),
           
                   ),
         ),
      ],
    );
  }
}
