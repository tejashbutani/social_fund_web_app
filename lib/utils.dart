import 'package:flutter/material.dart';

class Utils {
  Color getStatusColor(String sts) {
    Color c = Colors.black;
    switch (sts) {
      case 'Pending':
        c = Colors.amber.shade600;
        break;
      case 'Rejected':
        c = Colors.red.shade600;
        break;
      case 'Approved':
        c = Colors.green.shade800;
        break;
    }
    return c;
  }
}
