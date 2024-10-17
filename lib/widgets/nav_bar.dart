import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  CustomNavBar({required this.selectedIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Color(0xFF0D0F14), 
      selectedItemColor: Color(0xFFC99856), 
      unselectedItemColor: Colors.white,  
      currentIndex: selectedIndex,  
      onTap: onTap,                 
      items: const [
          BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),    
          label: 'Home',              
        ),
          BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_outlined),  
          label: 'Cart',                   
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_outlined),      
          label: 'Account',        
        ),
      ],
    );
  }
}
