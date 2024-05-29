import 'package:flutter/material.dart';
import 'package:test_cal_widget/constants/assets.dart';
import 'package:test_cal_widget/widgets/main_app_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'SpiritOfDoha',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCB2226),
      appBar: AppBar(
        backgroundColor: const Color(0xFFCB2226),
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // LARGE CARD
            MainAppCard(
              padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 22),
              borderRadius: BorderRadius.circular(8),
              offset: const Offset(16, 16),
              frontCardBorder: Border.all(color: const Color(0xFFED1C24), width: 1),
              backCardBorder: Border.all(color: const Color(0xFFED1C24), width: 1),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(Assets.imagesOnboardingIllustration),
                  const SizedBox(height: 20),
                  const Text(
                    'مرحبا بك في حاسبة الألعاب الذاتية',
                    style: TextStyle(fontSize: 24),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'يمكنك حساب نتائج جميع جلساتك في مختلف الألعاب من خلال الحاسبة الذكية',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 28),
                  MainAppCard(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    borderRadius: BorderRadius.circular(8),
                    offset: const Offset(4, 5),
                    backCardBorder: Border.all(color: const Color(0xFFED1C24), width: 1),
                    frontCardColor: Colors.white.withOpacity(0.9),
                    size: const Size.fromHeight(46),
                    child: const Text('إبدأ الأن'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // TEXT FORM FIELD
            MainAppCard(
              borderRadius: BorderRadius.circular(8),
              offset: const Offset(4, 5),
              backCardBorder: Border.all(color: const Color(0xFFED1C24), width: 1),
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'أدخل اسمك',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(16),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // DROPDOWN CARD
            MainAppCard(
              borderRadius: BorderRadius.circular(8),
              offset: const Offset(16, 16),
              backCardBorder: Border.all(color: const Color(0xFFED1C24), width: 1),
              child: DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  hintText: 'أختر اللعبة',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(16),
                ),
                items: const [
                  DropdownMenuItem(
                    value: 'Tic Tac Toe',
                    child: Text('Tic Tac Toe'),
                  ),
                  DropdownMenuItem(
                    value: 'Rock Paper Scissors',
                    child: Text('Rock Paper Scissors'),
                  ),
                ],
                onChanged: (value) {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
