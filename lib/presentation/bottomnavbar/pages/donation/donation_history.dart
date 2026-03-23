import 'package:flutter/material.dart';

import '../../../../utils/colors.dart';

class DonationHistoryPage extends StatefulWidget {
  const DonationHistoryPage({super.key});

  @override
  State<DonationHistoryPage> createState() => _DonationHistoryPageState();
}

class _DonationHistoryPageState extends State<DonationHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FB),
      body: CustomScrollView(
        slivers: [
          _buildModernAppBar(),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSummaryCards(),
                  const SizedBox(height: 24),
                  _buildFilterSection(),
                  const SizedBox(height: 20),
                  _buildDonationList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 🎯 Modern App Bar
  Widget _buildModernAppBar() {
    return SliverAppBar(
      expandedHeight: 160,
      pinned: true,
      elevation: 0,
      backgroundColor: baseColorOne,
      flexibleSpace: FlexibleSpaceBar(
        title: const Text(
         "",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
        background: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [baseColorOne, baseColorTwo],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            Positioned(
              right: -20,
              top: -20,
              child: Icon(Icons.volunteer_activism, size: 120, color: Colors.white.withOpacity(0.1)),
            ),
            Positioned(
              bottom: 30,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Your Generosity",
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Total Donated",
                    style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(20),
        child: Container(
          height: 20,
          decoration: const BoxDecoration(
            color: Color(0xffF5F7FB),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
        ),
      ),
    );
  }

  // 📊 Summary Cards
  Widget _buildSummaryCards() {
    return Row(
      children: [
        Expanded(
          child: _buildSummaryCard(
            icon: Icons.account_balance,
            label: "Total Given",
            value: "₹12,500",
            color: baseColorOne,
            bgColor: baseColorOne.withOpacity(0.1),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildSummaryCard(
            icon: Icons.favorite,
            label: "This Month",
            value: "₹2,500",
            color: Colors.green,
            bgColor: Colors.green.withOpacity(0.1),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildSummaryCard(
            icon: Icons.card_giftcard,
            label: "Donations",
            value: "12",
            color: Colors.orange,
            bgColor: Colors.orange.withOpacity(0.1),
          ),
        ),
      ],
    );
  }

  Widget _buildSummaryCard({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
    required Color bgColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(height: 8),
          Text(value, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color)),
          const SizedBox(height: 4),
          Text(label, style: TextStyle(fontSize: 11, color: Colors.grey.shade600)),
        ],
      ),
    );
  }

  // 🔍 Filter Section
  Widget _buildFilterSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Recent Transactions",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Row(
            children: [
              Text(
                "This Year",
                style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
              ),
              const SizedBox(width: 4),
              Icon(Icons.arrow_drop_down, size: 16, color: Colors.grey.shade600),
            ],
          ),
        ),
      ],
    );
  }

  // 📋 Donation List
  Widget _buildDonationList() {
    final donations = [
      _DonationItem(
        id: "DON-2024-001",
        date: "Mar 15, 2024",
        purpose: "Sunday Offering",
        amount: "₹500",
        status: "Completed",
        color: Colors.green,
        icon: Icons.church,
        receipt: true,
      ),
      _DonationItem(
        id: "DON-2024-002",
        date: "Mar 10, 2024",
        purpose: "Building Fund",
        amount: "₹2,000",
        status: "Completed",
        color: baseColorOne,
        icon: Icons.construction,
        receipt: true,
      ),
      _DonationItem(
        id: "DON-2024-003",
        date: "Mar 5, 2024",
        purpose: "Charity - Food Drive",
        amount: "₹1,000",
        status: "Completed",
        color: Colors.orange,
        icon: Icons.food_bank,
        receipt: true,
      ),
      _DonationItem(
        id: "DON-2024-004",
        date: "Feb 28, 2024",
        purpose: "Easter Collection",
        amount: "₹750",
        status: "Completed",
        color: Colors.purple,
        icon: Icons.celebration,
        receipt: true,
      ),
      _DonationItem(
        id: "DON-2024-005",
        date: "Feb 20, 2024",
        purpose: "Monthly Tithe",
        amount: "₹3,000",
        status: "Completed",
        color: Colors.teal,
        icon: Icons.title,
        receipt: true,
      ),
      _DonationItem(
        id: "DON-2024-006",
        date: "Feb 15, 2024",
        purpose: "Candle Offering",
        amount: "₹250",
        status: "Completed",
        color: Colors.amber,
        icon: Icons.emoji_objects,
        receipt: true,
      ),
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: donations.length,
      itemBuilder: (context, index) {
        return _buildDonationItem(donations[index], index);
      },
    );
  }

  Widget _buildDonationItem(_DonationItem donation, int index) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      duration: Duration(milliseconds: 300 + (index * 50)),
      curve: Curves.easeOutQuad,
      builder: (context, double value, child) {
        return Transform.translate(
          offset: Offset(0, 20 * (1 - value)),
          child: Opacity(
            opacity: value,
            child: Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 8, offset: const Offset(0, 2)),
                ],
              ),
              child: Row(
                children: [
                  // Icon
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: donation.color.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Icon(donation.icon, color: donation.color, size: 22),
                  ),
                  const SizedBox(width: 14),

                  // Details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                donation.purpose,
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                            ),
                            Text(
                              donation.amount,
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: donation.color),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            Icon(Icons.calendar_today, size: 12, color: Colors.grey.shade400),
                            const SizedBox(width: 4),
                            Text(
                              donation.date,
                              style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
                            ),
                            const SizedBox(width: 16),
                            Icon(Icons.receipt, size: 12, color: Colors.grey.shade400),
                            const SizedBox(width: 4),
                            Text(
                              donation.id,
                              style: TextStyle(fontSize: 11, color: Colors.grey.shade500),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Receipt Button
                  if (donation.receipt)
                    Container(
                      margin: const EdgeInsets.only(left: 8),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: baseColorOne.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.file_download, color: baseColorOne, size: 18),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// 📦 Donation Item Model
class _DonationItem {
  final String id;
  final String date;
  final String purpose;
  final String amount;
  final String status;
  final Color color;
  final IconData icon;
  final bool receipt;

  _DonationItem({
    required this.id,
    required this.date,
    required this.purpose,
    required this.amount,
    required this.status,
    required this.color,
    required this.icon,
    required this.receipt,
  });
}

