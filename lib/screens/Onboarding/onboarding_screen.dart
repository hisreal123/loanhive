import 'package:flutter/material.dart';
import 'package:loanhive/screens/Components/color.dart';
import 'package:loanhive/screens/Onboarding/onboarding_page.dart';
import 'package:loanhive/screens/auth/login_screen.dart';
import 'package:loanhive/screens/auth/register_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _skipOnboarding() {
    // Navigate to the home page
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  // void _toLogin() {
  //   Navigator.pushReplacement(
  //       context, MaterialPageRoute(builder: (context) => LoginScreen()));
  // }

  void _toRegister() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => RegisterScreen()));
  }

  void _toNextPage() {
    if (_currentPage < 3) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _toRegister();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              children: [
                OnboardingPage(
                  title: 'Welcome to LoanHive',
                  description: 'Your journey to financial freedom starts here.',
                  image: 'assets/images/onboarding/analysis.png',
                ),
                OnboardingPage(
                  title: 'Track Your Loans',
                  description: 'Manage all your loans in one place.',
                  image: 'assets/images/onboarding/phone_chatting.png',
                ),
                OnboardingPage(
                  title: 'Get Insights',
                  description:
                      'Receive insights to help you make better financial decisions.',
                  image: 'assets/images/onboarding/selfie_phone.png',
                ),
                OnboardingPage(
                  title: 'Fast Approval & Disbursement',
                  description:
                      'Apply, Approve, Recieve - Simplicity guaranteed..',
                  image: 'assets/images/onboarding/get_started.png',
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: _currentPage == 3
                ? _getStartedButton()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: _skipOnboarding,
                          child: const Text('Skip')),
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.black,
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          backgroundColor: Colors.green,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: _toNextPage,
                        child: Text('Next'),
                      ),
                    ],
                  ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  // Get Started Button
  Widget _getStartedButton() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: primaryColor,
      ),
      width: MediaQuery.of(context).size.width * 0.9,
      child: TextButton(
          onPressed: _toRegister,
          child: Text(
            'Get Started ',
            style: TextStyle(color: textColorWhite),
          )),
    );
  }
}
