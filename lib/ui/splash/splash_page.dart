import 'package:flutter/material.dart';
import 'package:map_lesson/ui/main/map_page.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';
import '../../view_model/splash_view_model.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SplashViewModel(),
      builder: (context, child) {
        return Scaffold(
          body: Consumer<SplashViewModel>(
            builder: (context, viewModel, child) {
              WidgetsBinding.instance.addPostFrameCallback(
                    (timeStamp) {
                  if (viewModel.latLong != null) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MapPage(
                          latLong: viewModel.latLong!,
                        ),
                      ),
                    );
                  }
                },
              );
              return Center(
                child: Lottie.asset("assets/lottie/map.json")
              );
            },
          ),
        );
      },
    );
  }
}