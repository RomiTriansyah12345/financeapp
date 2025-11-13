import 'package:flutter/material.dart';
import '../widgets/atm_card.dart';
import '../widgets/transaction_item.dart';
import '../models/transaction.dart';
import '../widgets/grid_menu_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final transactions = [
      TransactionModel('Coffee Shop', '-Rp35.000', 'Food'),
      TransactionModel('Grab Ride', '-Rp25.000', 'Travel'),
      TransactionModel('Gym Membership', '-Rp150.000', 'Health'),
      TransactionModel('Movie Ticket', '-Rp60.000', 'Event'),
      TransactionModel('Salary', '+Rp5.000.000', 'Income'),
    ];

    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ======= Header dengan icon profil + nama =======
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      // Icon profil user
                      CircleAvatar(
                        radius: 28,
                        backgroundColor: Colors.blue.shade100,
                        child: const Icon(
                          Icons.person_rounded,
                          color: Colors.blue,
                          size: 32,
                        ),
                      ),
                      const SizedBox(width: 12),
                      // Nama dan sapaan
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Hello, Romi 👋",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Welcome back!",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.notifications_none_rounded,
                        color: Colors.black87, size: 28),
                    onPressed: () {},
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // ======= Total Balance Card dengan icon uang =======
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF007BFF), Color(0xFF00B4DB)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        CircleAvatar(
                          radius: 22,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.account_balance_wallet_rounded,
                              color: Colors.blue, size: 28),
                        ),
                        SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Total Balance",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Rp 36.150.000",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Icon(Icons.arrow_forward_ios,
                        color: Colors.white, size: 18),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // ======= My Cards Section =======
              const Text(
                "My Cards",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),

              SizedBox(
                height: 190,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    AtmCard(
                      bankName: 'BCA',
                      cardNumber: '**** 2345',
                      balance: 'Rp12.500.000',
                      color1: Color.fromARGB(255, 2, 75, 147),
                      color2: Color.fromARGB(255, 2, 125, 248),
                    ),
                    AtmCard(
                      bankName: 'Mandiri',
                      cardNumber: '**** 8765',
                      balance: 'Rp8.500.000',
                      color1: Color(0xFFFFD700),
                      color2: Color(0xFFFFC107),
                    ),
                    AtmCard(
                      bankName: 'BRI',
                      cardNumber: '**** 5678',
                      balance: 'Rp7.150.000',
                      color1: Color.fromARGB(255, 47, 47, 47),
                      color2: Color.fromARGB(255, 101, 101, 101),
                    ),
                    AtmCard(
                      bankName: 'BNI',
                      cardNumber: '**** 6789',
                      balance: 'Rp8.150.000',
                      color1: Color(0xFF004D40),
                      color2: Color(0xFF00BFA5),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // ======= Quick Access Section =======
              const Text(
                'Quick Access',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  GridMenuItem(
                      icon: Icons.health_and_safety,
                      label: 'Health',
                      color: Colors.redAccent),
                  GridMenuItem(
                      icon: Icons.travel_explore,
                      label: 'Travel',
                      color: Colors.blueAccent),
                  GridMenuItem(
                      icon: Icons.fastfood,
                      label: 'Food',
                      color: Colors.orangeAccent),
                  GridMenuItem(
                      icon: Icons.event,
                      label: 'Event',
                      color: Colors.purpleAccent),
                  GridMenuItem(
                      icon: Icons.savings,
                      label: 'Savings',
                      color: Colors.teal),
                  GridMenuItem(
                      icon: Icons.bar_chart,
                      label: 'Reports',
                      color: Colors.indigo),
                ],
              ),

              const SizedBox(height: 24),

              // ======= Recent Transactions =======
              const Text(
                'Recent Transactions',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),

              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  final colors = [
                    Colors.pink.shade50,
                    Colors.blue.shade50,
                    Colors.green.shade50,
                    Colors.orange.shade50,
                    Colors.purple.shade50,
                  ];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: colors[index % colors.length],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TransactionItem(transaction: transactions[index]),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
