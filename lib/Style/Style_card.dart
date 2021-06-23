import 'package:flutter/material.dart';

class StyleCard {
  final kDefaultCardShadow = BoxShadow(
    offset: Offset(0, 20),
    blurRadius: 50,
    color: Colors.black.withOpacity(0.1),
  );
  final kDefaultShadow = BoxShadow(
    offset: Offset(0, 50),
    blurRadius: 50,
    color: Color(0xFF0700B1).withOpacity(0.15),
  );
}