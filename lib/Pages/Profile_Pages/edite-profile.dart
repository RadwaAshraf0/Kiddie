// ignore: file_names
// ignore_for_file: avoid_print

import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kiddie/Pages/Profile_Pages/profile_page.dart';
import 'package:kiddie/Pages/Registration/forgetPassword_pages/new_password_page.dart';
import 'package:kiddie/components/utils.dart';
import 'package:kiddie/helper/background_image.dart';
import 'package:kiddie/helper/custom_text.dart';
import 'package:kiddie/models/Button/custom_button.dart';
import 'package:kiddie/models/TextFaild/customTextFaild.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class EditeProfile extends StatefulWidget {
  const EditeProfile({super.key});
  static String id = 'EditeProfile';

  @override
  State<EditeProfile> createState() => _EditeProfileState();
}

class _EditeProfileState extends State<EditeProfile> {
  bool isUpdate = false;
  Uint8List? _image;
  String? name;
  String? email;
  String? profilePhoto;
  bool isLoading = true;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    String? userId = FirebaseAuth.instance.currentUser?.uid;

    if (userId != null) {
      try {
        DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
            .collection('Users')
            .doc(userId)
            .get();

        if (userSnapshot.exists) {
          setState(() {
            name = userSnapshot['Name'] ?? 'User';
            email = userSnapshot['Email'] ?? 'No email available';
            profilePhoto = userSnapshot['profilePhoto'] ?? '';
            _nameController.text = name!;
            _emailController.text = email!;
            isLoading = false;
          });
        } else {
          setState(() {
            isLoading = false;
          });
        }
      } catch (e) {
        print('Error fetching user data: $e');
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  Future<String?> uploadImageToStorage(Uint8List image) async {
    try {
      String userId = FirebaseAuth.instance.currentUser!.uid;
      Reference ref = FirebaseStorage.instance
          .ref()
          .child('profilePictures')
          .child('$userId.jpg');

      UploadTask uploadTask = ref.putData(image);
      TaskSnapshot snap = await uploadTask;

      if (snap.state == TaskState.success) {
        String downloadUrl = await snap.ref.getDownloadURL();
        print("Image uploaded successfully. Download URL: $downloadUrl");
        return downloadUrl;
      } else {
        print("Upload failed. TaskState: ${snap.state}");
        return null;
      }
    } catch (e) {
      print("Error uploading image: $e");
      return null;
    }
  }

  Future<void> updateUserData(
      String name, String email, String? imageUrl) async {
    String? userId = FirebaseAuth.instance.currentUser?.uid;

    if (userId != null) {
      try {
        Map<String, dynamic> updatedData = {
          'Name': name,
          'Email': email,
        };
        if (imageUrl != null) {
          updatedData['profilePhoto'] = imageUrl;
        }

        await FirebaseFirestore.instance
            .collection('Users')
            .doc(userId)
            .update(updatedData);
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const ProfilePage()));
      } catch (e) {
        print("Error updating user data: $e");
      }
    }
  }

  Future<bool> doesFileExist(String userId) async {
    try {
      Reference ref = FirebaseStorage.instance
          .ref()
          .child('profilePictures')
          .child('$userId.jpg');
      await ref.getDownloadURL();
      return true;
    } catch (e) {
      if (e is FirebaseException && e.code == 'object-not-found') {
        print("File does not exist at path profilePictures/$userId.jpg");
        return false;
      }
      throw e; // Keep original error for other cases
    }
  }

  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    if (img != null) {
      setState(() {
        _image = img;
      });

      String? downloadUrl = await uploadImageToStorage(img);
      if (downloadUrl != null) {
        print("Uploaded and got download URL: $downloadUrl");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(
          child:
              CircularProgressIndicator()); // Show loading indicator while fetching data
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: BackgroundImage(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.1,
                    ),
                    child: Center(
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          _image != null
                              ? CircleAvatar(
                                  radius: 64,
                                  backgroundImage: MemoryImage(_image!),
                                )
                              : profilePhoto != null && profilePhoto!.isNotEmpty
                                  ? CircleAvatar(
                                      radius: 64,
                                      backgroundImage:
                                          NetworkImage(profilePhoto!),
                                    )
                                  : const CircleAvatar(
                                      radius: 64,
                                      backgroundImage: AssetImage(
                                          'assets/images/profile/profile.jpg'),
                                    ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.09,
                              height: MediaQuery.of(context).size.width * 0.09,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: const Color.fromARGB(199, 250, 207, 154),
                              ),
                              child: IconButton(
                                onPressed: selectImage,
                                icon: Icon(
                                  LineAwesomeIcons.camera_retro_solid,
                                  color: Colors.black,
                                  size:
                                      MediaQuery.of(context).size.width * 0.05,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              customTextFaild(
                hintText: 'User Name',
                textEditingController: _nameController,
                enable: false,
                iconButton: const Icon(LineAwesomeIcons.user),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              customTextFaild(
                hintText: 'Email',
                textEditingController: _emailController,
                enable: false,
                iconButton: const Icon(Icons.email_outlined),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.55,
                  top: MediaQuery.of(context).size.height * 0.02,
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => newPassword()),
                    );
                  },
                  child: CustomText(
                    text: '  Change Password?',
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).size.width * 0.0001,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              CustomButton(
                height: MediaQuery.of(context).size.height * 0.0001,
                width: MediaQuery.of(context).size.width * 0.0016,
                color: const Color.fromARGB(199, 250, 207, 154),
                onPressed: () async {
                  setState(() {
                    isUpdate = true;
                  });
                  String? imageUrl;
                  if (_image != null) {
                    imageUrl = await uploadImageToStorage(_image!);
                  }
                  await updateUserData(
                      _nameController.text, _emailController.text, imageUrl);
                  setState(() {
                    isUpdate = false; // Resetting update state after process
                  });
                },
                text: isUpdate
                    ? const CircularProgressIndicator(color: Colors.black)
                    : Text(
                        "Update",
                        style: TextStyle(
                            fontFamily: 'Playfair Display',
                            fontSize: MediaQuery.of(context).size.width * 0.09,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}
