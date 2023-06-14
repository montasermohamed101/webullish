import 'package:flutter/material.dart';
import 'package:webullish/utils/app_colors.dart';
import 'package:webullish/view/widgets/my_text.dart';

class TermsScreen extends StatelessWidget {

  final text = '- Any Content On(Or Sent On Behalf) Webullish.Com Should Not Be Taken As A Professional Financial Advice, Or Construed As Providing Financial Guidance For Trading Securities. '
      '- Webullish.Com Or Any Of It\'s Associates Will Never Tell You To Buy, Hold, Or Sell A Certain Security. It Is Your Responsibility To Study, Confirm, And Decide What Is Best For Your Own Investments. '
      '- It Is Your Responsibility To Determine When To Enter, And When To Exit Each Trade. Webullish.Com And It\'s Associates Are Not Responsible For Your Own Entry, And Exit Points. '
      '- Webullish.Com Or Any Of It’s Associates Is Not Responsible For Your Trading Choices. '
      '-The Information Shared In The Swing Trading Alerts Including Entry Points & Price Targets Should Never Be Used As "Buy" Or "Sell" Signals. That Information Is Relayed ONLY To Pinpoint Certain Areas On The Trading Charts, Thus, Should Be Used As "Buy" Or "Sell" Signals.'
      'Webullish.Com Or Any Of It’s Associates Is Not Responsible For Any Losses Incurred As A Result Of Using Our Alerts. Information Provided In This Correspondence Is Intended Solely For Informational Purposes, And Is Obtained From Various Sources That Are Believed To Be Credible. Information Is In No Way Guaranteed To Be Accurate. Webullish.Com Members Must Do Their Own Due Diligence, And Execute Trades At Their Own Risk At All Times.';

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: MyText(text: 'Terms & Conditions',color: AppColors.ancientColor,
        fontWeight: FontWeight.bold,
          size: 22,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Image.asset('assets/images/back_arrow.png'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0,vertical: 65),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MyText(text: 'Read The Following', color: AppColors.ancientColor,
              fontWeight: FontWeight.bold,
                size: 17,
                 textAlign: TextAlign.start,
              ),
              const SizedBox(height: 15),
              MyText(
                // text:text.replaceAll('-', '\n\n-'),
                text:text.replaceFirst('- ', '-').replaceAll('- ', '\n\n- '),
                color: AppColors.whiteColor,
              fontWeight: FontWeight.w500,
                size: 17,
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
