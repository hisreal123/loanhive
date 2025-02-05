import 'package:flutter/material.dart';
import 'package:loanhive/screens/Onboarding/getting_started.dart';
import 'package:loanhive/screens/Onboarding/onboarding_page.dart';
import 'package:loanhive/screens/homepage.dart';

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
      MaterialPageRoute(builder: (context) => GettingStarted()),
    );
  }

  void _toNextPage() {
    if (_currentPage < 2) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _skipOnboarding();
    }
  }

  // Color? getColor(Set<MaterialState> states) => Colors.blue;

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
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: _skipOnboarding, child: const Text('Skip')),
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
}
