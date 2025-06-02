import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:moneytoring/utils/theme.dart';
import 'package:sizer/sizer.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  void _onIntroEnd(BuildContext context) {
    Navigator.of(context).pushReplacementNamed('/home');
  }

  @override
  Widget build(BuildContext context) {
    const titleStyle = TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold);
    const bodyStyle = TextStyle(fontSize: 16.0);
    const pageDecoration = PageDecoration(
      titleTextStyle: titleStyle,
      bodyTextStyle: bodyStyle,
      contentMargin: EdgeInsets.symmetric(horizontal: 24),
      imagePadding: EdgeInsets.only(top: 40),
    );

    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Controla tus gastos",
          body:
              "Anota tus ingresos y gastos de forma rápida. Mantén tu economía siempre clara y bajo control.",
          image: SvgPicture.asset(
            'assets/onboarding/coins.svg',
            width: 70.w,
            height: 70.h,
            
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Establece metas",
          body:
              "Crea objetivos de ahorro que se adapten a ti y alcanza tus metas paso a paso.",
          image: SvgPicture.asset(
            'assets/onboarding/money_stair.svg',
            width: 50.w,
            height: 50.h,
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Visualiza tu evolución",
          body:
              "Consulta gráficos claros y estadísticas útiles para tomar mejores decisiones financieras.",
          image: const Icon(Icons.bar_chart, size: 120, color: Colors.green),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Toma el control",
          body:
              "Empieza hoy con Moneytoring y da el primer paso hacia una vida financiera más saludable.",
          image: const Icon(Icons.savings, size: 120, color: Colors.green),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      showSkipButton: true,
      skip: Text(
        "Saltar",
        style: TextStyle(
          color: AppColors.green,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
      next: Icon(
        Icons.arrow_forward_ios,
        color: AppColors.green,
        size: 22,
      ),
      done: Text(
        "¡Empezar!",
        style: TextStyle(
          color: AppColors.green,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      back: Text(
        "Volver!",
        style: TextStyle(
          color: AppColors.green,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      dotsDecorator: DotsDecorator(
        activeColor: AppColors.green,
        color: Colors.grey.shade300,
        size: const Size(8.0, 8.0),
        activeSize: const Size(20.0, 8.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      curve: Curves.easeInOut,
    );
  }
}
