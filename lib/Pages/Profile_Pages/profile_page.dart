import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kiddie/Pages/Profile_Pages/edite-profile.dart';
import 'package:kiddie/models/progress_model.dart';
import 'package:kiddie/helper/background_image.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../helper/custom_text.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  static String id = 'ProfilePage';

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Default data
  String name = "Loading...";
  String email = "Loading...";
  String profilePhoto = "";
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    // Get the current user ID
    String? userId = FirebaseAuth.instance.currentUser?.uid;

    if (userId == null) {
      print("No user logged in.");
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
      return;
    }

    try {
      // Fetch User data
      final userSnapshot = await FirebaseFirestore.instance
          .collection('Users')
          .doc(userId)
          .get();

      // Ensure the widget is still mounted before updating state
      if (!mounted) return;

      setState(() {
        if (userSnapshot.exists) {
          name = userSnapshot['Name'] ?? "Unknown User";
          email = userSnapshot['Email'] ?? "No Email Provided";
          profilePhoto = userSnapshot['profilePhoto'] ?? "";
        }
        isLoading = false;
      });
    } catch (e) {
      print("Error fetching user data: $e");
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    String? userId = FirebaseAuth.instance.currentUser?.uid;

    if (userId == null) {
      return const Center(child: Text("User not logged in"));
    }

    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection('UserProgress')
          .doc(userId)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        }

        if (!snapshot.hasData || !snapshot.data!.exists) {
          return const Center(child: Text("No progress data found"));
        }

        var data = snapshot.data!.data() as Map<String, dynamic>? ?? {};
        int percentage = data['progress'] ?? 0;
        int cumulativeScore = data['total_score'] ?? 0;


        return Scaffold(
          resizeToAvoidBottomInset: false,
          extendBodyBehindAppBar: true,
          body: BackgroundImage(
            child: Column(
              children: <Widget>[
                // Profile Image Section
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.06,
                    ),
                    child: Center(
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.width * 0.33,
                            width: MediaQuery.of(context).size.width * 0.33,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(186, 0, 0, 0),
                              shape: BoxShape.circle,
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.width * 0.3,
                            width: MediaQuery.of(context).size.width * 0.3,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: profilePhoto.isNotEmpty
                                    ? NetworkImage(profilePhoto)
                                    : const AssetImage(
                                            'assets/images/profile/profile.jpg')
                                        as ImageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            right: MediaQuery.of(context).size.width * 0.01,
                            top: MediaQuery.of(context).size.width * 0.24,
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.09,
                              height: MediaQuery.of(context).size.width * 0.09,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: const Color.fromARGB(199, 250, 207, 154),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const EditeProfile(),
                                    ),
                                  );
                                },
                                icon: Icon(
                                  LineAwesomeIcons.edit,
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
                ),

                // Name, Email, and Edit Button Section
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Text(
                              name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontFamily: "Playfair Display",
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.06,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.045,
                              ),
                              child: Text(
                                email,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontFamily: "Playfair Display",
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.038,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Progress Bar Section
                      const SizedBox(
                        height: 65,
                      ),
                      isLoading
                          ? const CircularProgressIndicator()
                          : Progress(
                            percentage: percentage,
                            color: const Color.fromARGB(178, 0, 0, 0),
                            tcolor: Colors.white,
                            score: cumulativeScore,
                            displayTotalScore: true,
                          ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
