import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  final TransactionModel transaction;

  const TransactionItem({super.key, required this.transaction});

  IconData _iconForTitle(String title) {
    final lower = title.toLowerCase();
    if (lower.contains('coffee')) return Icons.local_cafe_rounded;
    if (lower.contains('grab') || lower.contains('ride') || lower.contains('car')) return Icons.directions_car_rounded;
    if (lower.contains('gym')) return Icons.fitness_center_rounded;
    if (lower.contains('movie')) return Icons.movie_rounded;
    if (lower.contains('salary') || lower.contains('income')) return Icons.account_balance_wallet_rounded;
    return Icons.attach_money_rounded;
  }

  @override
  Widget build(BuildContext context) {
    final bool isIncome = transaction.amount.startsWith('+');
    final amountColor = isIncome ? Colors.green.shade700 : Colors.red.shade700;
    final icon = _iconForTitle(transaction.title);

    return Card(
      color: Colors.transparent,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        leading: Container(
          height: 46,
          width: 46,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.75),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.deepPurple, size: 24),
        ),
        title: Text(transaction.title, style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w600)),
        subtitle: Text(transaction.category, style: GoogleFonts.poppins(fontSize: 13, color: Colors.grey[700])),
        trailing: Text(transaction.amount, style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600, color: amountColor)),
      ),
    );
  }
}
