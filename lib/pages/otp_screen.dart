import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import '../provider/auth_provider.dart';
import 'package:provider/provider.dart';

import '../utilis/utilis.dart';
import '../widgets/custom_button.dart';
//import 'Userinfo_screen.dart';
import 'home_page.dart';

class OtpScreen extends StatefulWidget {
  final String verificationId;  
  const OtpScreen({super.key, required this.verificationId});
   
  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String? otpCode;
  @override
  Widget build(BuildContext context) {
    final isLoading =Provider.of<AuthProvider>(context, listen: true).isLoading;
    return Scaffold(
      body: SafeArea(
        child: isLoading == true ? const Center(child: CircularProgressIndicator(color: Colors.blue,),
        ) 
        : Center(
             child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: const Icon(Icons.arrow_back),
                  ),
                ),
                Container(
                  width: 200,
                  height: 60,
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                     shape: BoxShape.circle,
                     color: Colors.blue.shade50,
                  ),
                  child: Image.asset(
                      "assets/Online-learning.gif",
                      ),
                ),
                
                const SizedBox(height: 20),
                const Text(
                  "Verification",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Enter the OTP sent to your mobile number",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black38,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                  const SizedBox(height: 20),
                  Pinput(
                    length: 6,
                    showCursor: true,
                    defaultPinTheme: PinTheme(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.blue.shade200
                          ),
                      ),
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onCompleted: (value){
                      setState(() {
                        otpCode =value;
                      });
                    }, 
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: CustomButton(
                      text: "Verify",
                      onPressed: () {
                        if(otpCode != null) {
                          verifyOtp(context, otpCode!);
                        } else {
                          showSnackBar(context, "Enter valid 6-Digit Code");
                        }
                      }
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text("Didn't recieve the code?",style: TextStyle(
                    fontSize: 14, 
                    fontWeight: FontWeight.bold,
                    color: Colors.black38,
                    ),
                  ),
                  const SizedBox(height:15),
                  const Text(
                    "Resend Code",
                    style: TextStyle(
                    fontSize: 15, 
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    ),
                  ),
              ],   
           ),
        ),
      ),
      ),
    );
  }

  void verifyOtp(BuildContext context, String userOtp){
    final ap = Provider.of<AuthProvider>(context,listen: false); 
    ap.verifyOtp(
      context: context,
       verificationId: widget.verificationId, userOtp: userOtp, 
       onSuccess: () {
          ap.checkExistingUser().then((value) async {
            if (value==true){

            } else {

                Navigator.pushAndRemoveUntil(
                  context, MaterialPageRoute(
                    builder: (context) => Homepage()),
                    (route) =>false);
            }
          },
        );
    },
  );
 }
}


