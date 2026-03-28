import 'package:flutter/material.dart';

class FindStorePage extends StatefulWidget {
  const FindStorePage({super.key});

  @override
  State<FindStorePage> createState() => _FindStorePageState();
}

class _FindStorePageState extends State<FindStorePage> {

  final Color primaryDark = const Color(0xFF4A3B52);
  final Color primaryOrange = const Color.fromARGB(232, 202, 86, 44);
  final Color bgColor = const Color(0xFFF8F8F8);

  bool isLoading = false;
  String currentLocation = 'Fetching location...';

  List<Map<String , dynamic>> stores = [];

  @override
  void initState(){
    super.initState();
    _fetchRealLocationAndStores();
  }
  
  Future<void> _fetchRealLocationAndStores() async{
    setState(() => isLoading = true);
    await Future.delayed(const Duration(seconds: 2));

  }
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}