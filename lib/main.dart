import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'src/screens/tire_list_screen.dart';
import 'src/providers/tire_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final tireProvider = TireProvider();
  await tireProvider.fetchTires();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<TireProvider>.value(value: tireProvider),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prolog Pneus',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const TireListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}