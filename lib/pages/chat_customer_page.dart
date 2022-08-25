import 'package:animise_application/theme/theme.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:url_launcher/url_launcher.dart';
// ignore: unused_import
import 'package:flutter_launch/flutter_launch.dart';

class ChatCustomerPage extends StatelessWidget {
  const ChatCustomerPage({ Key? key }) : super(key: key);

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
        backgroundColor: primaryOrangeColor,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 81,
              ),
              Image.asset(
                "assets/Umaru_Chat.png",
                width: 300,
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                child: Text("Chat on Whatsapp",
                ),
                  onPressed: (){
                    openwhatsapp();
              
            },
                
                style: ElevatedButton.styleFrom(
                  primary: primaryOrangeColor,
                ),
                
                
              ),
            ],
          ),
        ),
      ),
    );
  }
}

openwhatsapp() {
  // return launchUrl(
  //   Uri.parse(
  //     // 'https://wa.me/1234567890' //you use this url also
  //     'whatsapp://send?phone=+6283147690333',//put your number here
  //   ),
  // );
}
//Gak mau ke open whatsapp nya

