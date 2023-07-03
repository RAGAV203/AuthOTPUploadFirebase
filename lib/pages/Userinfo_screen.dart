import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/user_model.dart';
import '../provider/auth_provider.dart';
import '../widgets/custom_button.dart';

class UserInformationScreen extends StatefulWidget {
  const UserInformationScreen({super.key});

  @override
  State<UserInformationScreen> createState() => _UserInformationScreenState();
}

class _UserInformationScreenState extends State<UserInformationScreen> {
  
  final nameController = TextEditingController();
  final emailController = TextEditingController(); 
  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
  }
  

  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Center(
             child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  height: 130,
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                     shape: BoxShape.circle,
                     color: Colors.blue.shade50,
                  ),
                  child: const CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 50,
                    child: Icon(
                        Icons.account_circle,
                        size: 50,
                        color: Colors.white,
                    ),
                  ),
                ),
                
                const SizedBox(height: 20),
                const Text(
                  "Register",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Enter your Details",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black38,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                textField(
                  hintText:"Name",
                  icon: Icons.account_circle,
                  inputType: TextInputType.name,
                  maxLines: 1,
                  controller: nameController,
                  ),
                textField(
                  hintText:"emailid@example.com",
                  icon: Icons.account_circle,
                  inputType: TextInputType.emailAddress,
                  maxLines: 1,
                  controller: emailController,
                  ),

                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.width *0.80,
                    child: CustomButton(
                      text: "Continue",
                      onPressed: () => storeData(),
                    ),
                    
                  )
              ],   
           ),
        ),
      ),
      ),

    );
  }
 Widget textField({
  required String hintText, 
  required IconData icon, 
  required TextInputType inputType, 
  required int maxLines, 
  required TextEditingController controller,
   }){
     return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
          cursorColor: Colors.grey,
          controller: controller,
          keyboardType: inputType,
          maxLines: maxLines,
          decoration: InputDecoration(
            prefixIcon: Container(
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black,
              ),
              child: Icon(
                icon,
                 size: 20,
                color: Colors.white,
              ),
              ),
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.black
              ),
              ),
              hintText: hintText,
              alignLabelWithHint: true,
              border: InputBorder.none,
              fillColor: Colors.grey,
              filled: true,

          ),
      ),
      );
 }

 void storeData() async {
 
  final ap = Provider.of<AuthProvider>(context, listen: false);
 
  UserModel userModel = UserModel(
    name: nameController.text.trim(),
    email: emailController.text.trim(),
    createdAt: "", photo: "", phoneNumber: "", uid: "",);
    ap.saveUserDataToFirebase(
      context: context,
      userModel: userModel,
      onSuccess: () {}
    );
  
 }

}