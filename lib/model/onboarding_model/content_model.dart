class OnBoardingContent {
  String image;
  String title;
  String description;

  OnBoardingContent({required this.image,required this.title,required this.description});
}

List<OnBoardingContent> contents = [
  OnBoardingContent(
      title: 'What is Webullish.com?',
      image: 'assets/images/onboarding1.svg',
      description: "Webullish.com is an online service that aims to study & identify bullish stock movements/technical breakouts in the stock market (NASDAQ and NYSE)."
  ),
  OnBoardingContent(
      title: 'Who are We ?',
      image: 'assets/images/onboarding2.svg',
      description: "We are full time stock traders & technical analysts from the SW Suburbs of Chicago! We absolutely love swing trading, but never make it look easy."
  ),
  OnBoardingContent(
      title: 'Why webullish.com?',
      image: 'assets/images/onboarding3.svg',
      description: "Easy To Follow: Our stock alerts are formatted in such a way that both new and experienced stock traders can greatly benefit from our research."
  ),
  OnBoardingContent(
      title: 'Spotting Bullish Trends Like Never Before!',
      image: 'assets/images/onboarding4.svg',
      description: "webullish.com has brought together a top-notch collection of chart-reading experts to develop a unique strategy of identifying areas."
  ),
];