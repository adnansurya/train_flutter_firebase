part of 'pages.dart';

class WelcomePage extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const WelcomePage({Key? key});

  List<String> get images => [];

  TextStyle get whiteTextStyle => const TextStyle(color: Colors.white);

  get child => null; // Define getter whiteTextStyle

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children: [
            Image.asset(
              'assets/images/page-image.png',
              height: 310,
              fit: BoxFit.fill,
            ),
            Text(
              "Welcome",
              style: dangerTextStyle.copyWith(fontSize: 38),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 5),
            Text(
              "This application requires \ndirect permission from \nPT.KAI",
              style: announcementTextStyle.copyWith(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 61),
            SizedBox(
              height: 60,
              width: MediaQuery.of(context).size.width - (2 * defaultMargin),
              child: ElevatedButton(
                onPressed: () {
                  // Show registration modal
                  showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                          return Wrap(
                            children: [
                              // Modal content
                              Container(
                                color: Colors.transparent,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(30),
                                        topLeft: Radius.circular(30)),
                                  ),
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: defaultMargin),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Spacing
                                        const SizedBox(
                                          height: 25,
                                        ),
                                        Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Hello!!!",
                                                  style:
                                                      whiteTextStyle.copyWith(
                                                    fontSize: 20,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                Text(
                                                  "Sign Up",
                                                  style:
                                                      whiteTextStyle.copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 30,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const Spacer(),
                                            InkWell(
                                              onTap: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Image.asset(
                                                'assets/images/close.png',
                                                height: 30,
                                                width: 30,
                                              ),
                                            )
                                          ],
                                        ),

                                        // TextField for email
                                        const SizedBox(height: 15,),
                                        TextField(
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),
                                            hintText: "name@example.com",
                                            labelText: "e-mail from company",
                                            suffixIcon: InkWell(
                                              onTap: () {
                                                // When the column is tapped
                                              }, 
                                              child: const Icon(Icons.visibility_outlined)
                                            )
                                          )
                                        ),
                                        
                                        // TextField for username
                                        const SizedBox(height: 15,),
                                        TextField(
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),
                                            hintText: "username",
                                            labelText: "username",
                                            suffixIcon: InkWell(
                                              onTap: () {
                                                // When the column is tapped
                                              }, 
                                              child: const Icon(Icons.visibility_outlined)
                                            )
                                          )
                                        ),

                                        // TextField for password
                                        const SizedBox(height: 15,),
                                        TextField(
                                          obscureText: true, // Show password as dots
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),
                                            hintText: "password",
                                            labelText: "password",
                                            suffixIcon: InkWell(
                                              onTap: () {
                                                // When the column is tapped
                                              }, 
                                              child: const Icon(Icons.lock_outline)
                                            )
                                          )
                                        ),
                                        // TextField for confirming password
                                        const SizedBox(height: 15,),
                                        TextField(
                                          obscureText: true, // Show password as dots
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),
                                            hintText: "confirm password",
                                            labelText: "confirm password",
                                            suffixIcon: InkWell(
                                              onTap: () {
                                                // When the column is tapped
                                              }, 
                                              child: const Icon(Icons.lock_outline)
                                            )
                                          )
                                        ),
                                        const SizedBox(height: 15,),
                                        SizedBox(
                                          width: 325, // Make the button the same size as other buttons
                                          height: 60, // Make the button the same size as other buttons
                                          child: ElevatedButton(
                                            onPressed: () {
                                              // Add sign up logic here
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: secondaryColor,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(15),
                                                side: const BorderSide(
                                                  color: Colors.white, width: 3), // Fix here
                                              ),
                                            ),
                                            child: Text(
                                              "Sign Up",
                                              style: announcementTextStyle.copyWith(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                                color: primaryColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 15,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text("Already have an account?", style: whiteTextStyle.
                                            copyWith(color: primaryColor, fontSize: 18)),
                                            const SizedBox(width: 5), 
                                            // Add space between texts
                                            Text("Sign in", style: whiteTextStyle.
                                            copyWith(color: secondaryColor, fontSize: 18)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: secondaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  "Sign Up",
                  style: announcementTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: primaryColor,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15), // Fix here
            SizedBox(
              height: 60,
              width: MediaQuery.of(context).size.width -
                  (2 * defaultMargin),
              child: ElevatedButton(
                onPressed: () {
                  // Show sign in modal
                  showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                          return Wrap(
                            children: [
                              // Modal content
                              Container(
                                color: Colors.transparent,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(30),
                                        topLeft: Radius.circular(30)),
                                  ),
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: defaultMargin),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Spacing
                                        const SizedBox(
                                          height: 25,
                                        ),
                                        Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Hello!!!",
                                                  style:
                                                      whiteTextStyle.copyWith(
                                                    fontSize: 20,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                Text(
                                                  "Sign In",
                                                  style:
                                                      whiteTextStyle.copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 30,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const Spacer(),
                                            InkWell(
                                              onTap: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Image.asset(
                                                'assets/images/close.png',
                                                height: 30,
                                                width: 30,
                                              ),
                                            )
                                          ],
                                        ),

                                        // TextField for email
                                        const SizedBox(height: 15,),
                                        TextField(
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),
                                            hintText: "name@example.com",
                                            labelText: "e-mail from company",
                                            suffixIcon: InkWell(
                                              onTap: () {
                                                // When the column is tapped
                                              }, 
                                              child: const Icon(Icons.visibility_outlined)
                                            )
                                          )
                                        ),
                                        
                                        // TextField for username
                                        const SizedBox(height: 15,),
                                        TextField(
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),
                                            hintText: "username",
                                            labelText: "username",
                                            suffixIcon: InkWell(
                                              onTap: () {
                                                // When the column is tapped
                                              }, 
                                              child: const Icon(Icons.visibility_outlined)
                                            )
                                          )
                                        ),

                                        // TextField for password
                                        const SizedBox(height: 15,),
                                        TextField(
                                          obscureText: true, // Show password as dots
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),
                                            hintText: "password",
                                            labelText: "password",
                                            suffixIcon: InkWell(
                                              onTap: () {
                                                // When the column is tapped
                                              }, 
                                              child: const Icon(Icons.lock_outline)
                                            )
                                          )
                                        ),
                                        // TextField for confirming password
                                        const SizedBox(height: 15,),
                                        SizedBox(
                                          width: 325, // Make the button the same size as other buttons
                                          height: 60, // Make the button the same size as other buttons
                                          child: ElevatedButton(
                                            onPressed: () {
                                              // Add sign in logic here
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: secondaryColor,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(15),
                                                side: const BorderSide(
                                                  color: Colors.white, width: 3), // Fix here
                                              ),
                                            ),
                                            child: Text(
                                              "Sign In",
                                              style: announcementTextStyle.copyWith(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                                color: primaryColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: secondaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  "Sign In",
                  style: announcementTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: primaryColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
