import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:assignment/page/home_page.dart';
import 'package:assignment/widget/button_widget.dart';

class OnBoardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SafeArea(
    child: IntroductionScreen(
      pages: [
        PageViewModel(
          title: 'Cheetah',
          body: 'The cheetah (Acinonyx jubatus) is a large cat native to Africa and central Iran..',
          image: buildImage('assets/Cheetah.webp'),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: 'Lion',
          body: 'The lion (Panthera leo) is a large felid of the genus Panthera native mainly to Africa',
          image: buildImage('assets/Lion.webp'),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: 'Tiger',
          body: 'The tiger (Panthera tigris) is the largest living cat species and a member of the genus Panthera.',
          footer: ButtonWidget(
            text: 'Continue',
            onClicked: () => goToHome(context),
          ),
          image: buildImage('assets/Tiger.webp'),
          decoration: getPageDecoration(),
        ),

      ],
      done: Text('Read', style: TextStyle(fontWeight: FontWeight.w600)),
      onDone: () => goToHome(context),
      showSkipButton: true,
      skip: Text('Skip'),
      onSkip: () => goToHome(context),
      next: Icon(Icons.arrow_forward),
      dotsDecorator: getDotDecoration(),
      onChange: (index) => print('Page $index selected'),
      globalBackgroundColor: Theme.of(context).primaryColor,
      skipFlex: 0,
      nextFlex: 0,
      // isProgressTap: false,
      // isProgress: false,
      // showNextButton: false,
      // freeze: true,
      // animationDuration: 1000,
    ),
  );

  void goToHome(context) => Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (_) => HomePage()),
  );

  Widget buildImage(String path) =>
      Center(child: Image.asset(path, width: 350));

  DotsDecorator getDotDecoration() => DotsDecorator(
    color: Color(0xFFBDBDBD),
    //activeColor: Colors.orange,
    size: Size(10, 10),
    activeSize: Size(22, 10),
    activeShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
  );

  PageDecoration getPageDecoration() => PageDecoration(
    titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
    bodyTextStyle: TextStyle(fontSize: 20),
    descriptionPadding: EdgeInsets.all(16).copyWith(bottom: 0),
    imagePadding: EdgeInsets.all(24),
    pageColor: Colors.white,
  );
}
