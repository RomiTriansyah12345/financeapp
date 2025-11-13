import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AtmCard extends StatelessWidget {
  final String bankName;
  final String cardNumber;
  final String balance;
  final Color color1;
  final Color color2;

  const AtmCard({
    super.key,
    required this.bankName,
    required this.cardNumber,
    required this.balance,
    required this.color1,
    required this.color2,
  });

  // small helper to show a small bank icon circle
  Widget _bankIcon() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.18),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Icon(Icons.account_balance, color: Colors.white, size: 20),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: LinearGradient(colors: [color1, color2], begin: Alignment.topLeft, end: Alignment.bottomRight),
        boxShadow: [
          BoxShadow(color: color2.withOpacity(0.28), blurRadius: 10, offset: const Offset(0, 6)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // top row: bank name and icon
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(bankName,
                  style: GoogleFonts.poppins(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
              _bankIcon(),
            ],
          ),

          const Spacer(),
          // card number and small chip
          Row(
            children: [
              Container(
                width: 36,
                height: 24,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.18),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Icon(Icons.credit_card, color: Colors.white70, size: 16),
              ),
              const SizedBox(width: 10),
              Text(cardNumber, style: GoogleFonts.poppins(color: Colors.white70)),
            ],
          ),

          const SizedBox(height: 12),
          // balance label and amount
          Text('Balance', style: GoogleFonts.poppins(color: Colors.white70, fontSize: 12)),
          const SizedBox(height: 6),
          Text(balance, style: GoogleFonts.poppins(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
