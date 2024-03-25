import 'package:coderoots/features/doctors_restful/presentation/view/doctor_page.dart';
import 'package:flutter/material.dart';

import '../../doctors_graph/presentation/view/product_page.dart';

class LayoutsPage extends StatefulWidget {
  const LayoutsPage({super.key});

  @override
  State<LayoutsPage> createState() => _LayoutsPageState();
}

class _LayoutsPageState extends State<LayoutsPage> {
  int selectedIndex = 0;
  List containScreen = [
    const DoctorPage(),
    const ProductsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: containScreen[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        iconSize: 24,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.local_hospital),
            label: "Doctors",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.production_quantity_limits),
            label: "Products",
          ),
        ],
      ),
    );
  }
}
