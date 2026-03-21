import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utils/colors.dart';

class ParishInfoPage extends StatelessWidget {
  const ParishInfoPage({super.key});

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
                  _buildSectionHeader(
                    title: "Parish Details",
                    subtitle: "Information about your parish",
                  ),
                  const SizedBox(height: 16),

                  // Modern card grid layout
                  _buildInfoGrid(),

                  const SizedBox(height: 24),
                  _buildSectionHeader(
                    title: "Mass Schedule",
                    subtitle: "Weekly mass timings",
                    icon: Icons.calendar_today,
                  ),
                  const SizedBox(height: 16),
                  _buildModernMassTimingCard(),

                  const SizedBox(height: 24),
                  _buildQuickActions(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Modern Section Header
  Widget _buildSectionHeader({
    required String title,
    String? subtitle,
    IconData? icon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (icon != null) ...[
              Icon(icon, color: baseColorOne, size: 20),
              const SizedBox(width: 8),
            ],
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: -0.5,
              ),
            ),
          ],
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ],
    );
  }

  // Grid layout for info cards
  Widget _buildInfoGrid() {
    final parishInfo = [
      _ParishInfoItem(
        icon: Icons.church,
        title: "Parish Name",
        value: "St. Mary's Church",
        gradient: const [Color(0xFF4158D0), Color(0xFFC850C0)],
      ),
      _ParishInfoItem(
        icon: Icons.person,
        title: "Priest",
        value: "Fr. John Bosco",
        gradient: const [Color(0xFF0093E9), Color(0xFF80D0C7)],
      ),
      _ParishInfoItem(
        icon: Icons.location_on,
        title: "Address",
        value: "123 Church Street, Chennai, Tamil Nadu",
        gradient: const [Color(0xFFFBAB7E), Color(0xFFF7CE68)],
        isLongText: true,
      ),
      _ParishInfoItem(
        icon: Icons.phone,
        title: "Contact",
        value: "+91 98765 43210",
        gradient: const [Color(0xFF85FFBD), Color(0xFFFFFB7D)],
      ),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.1,
      ),
      itemCount: parishInfo.length,
      itemBuilder: (context, index) {
        final info = parishInfo[index];
        return _buildModernInfoCard(info);
      },
    );
  }

  // Modern animated info card
  Widget _buildModernInfoCard(_ParishInfoItem info) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      duration: Duration(milliseconds: 500 + (200 * info.hashCode % 300)),
      curve: Curves.easeOutQuad,
      builder: (context, double value, child) {
        return Transform.translate(
          offset: Offset(0, 20 * (1 - value)),
          child: Opacity(
            opacity: value,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Material(
                  color: Colors.white,
                  child: InkWell(
                    onTap: () {
                      // Add haptic feedback and navigation
                      HapticFeedback.lightImpact();
                    },
                    child: Stack(
                      children: [
                        // Gradient overlay
                        Positioned(
                          top: -20,
                          right: -20,
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: info.gradient,
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              shape: BoxShape.circle,
                             // opacity: 0.1,
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Icon with gradient background
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: info.gradient,
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Icon(
                                  info.icon,
                                  color: Colors.white,
                                  size: 22,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                info.title,
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                info.value,
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  height: 1.2,
                                ),
                                maxLines: info.isLongText ? 3 : 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  // Modern mass timing card
  Widget _buildModernMassTimingCard() {
    final massTimings = [
      _MassTiming(day: "Weekdays", time: "6:00 AM", isToday: false),
      _MassTiming(day: "Saturday", time: "6:00 AM • 6:00 PM", isToday: DateTime.now().weekday == DateTime.saturday),
      _MassTiming(day: "Sunday", time: "7:00 AM • 9:00 AM • 6:00 PM", isToday: DateTime.now().weekday == DateTime.sunday),
    ];

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: const LinearGradient(
          colors: [Color(0xFF1A1B4B), Color(0xFF2D2F6B)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1A1B4B).withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: Material(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                // Header with decorative elements
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Icon(
                        Icons.access_time_filled,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Mass Timings",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: -0.5,
                          ),
                        ),
                        Text(
                          "Join us in prayer",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.notifications_none,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Timing list
                ...massTimings.map((timing) => _buildModernTimeChip(timing)),

                const SizedBox(height: 16),

                // Reminder button
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white.withOpacity(0.2),
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TextButton(
                    onPressed: () {
                      HapticFeedback.mediumImpact();
                    },
                    child: const Text(
                      "Set Mass Reminder",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Modern time chip
  Widget _buildModernTimeChip(_MassTiming timing) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: timing.isToday
            ? Colors.white.withOpacity(0.15)
            : Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: timing.isToday
            ? Border.all(
          color: Colors.white.withOpacity(0.3),
          width: 1,
        )
            : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              if (timing.isToday) ...[
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Color(0xFF4CAF50),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
              ],
              Text(
                timing.day,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: timing.isToday ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
            ],
          ),
          Text(
            timing.time,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: timing.isToday ? FontWeight.w700 : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  // Quick actions section
  Widget _buildQuickActions() {
    final actions = [
      _QuickAction(
        icon: Icons.map,
        label: "Directions",
        color: const Color(0xFF4158D0),
      ),
      _QuickAction(
        icon: Icons.share,
        label: "Share",
        color: const Color(0xFFC850C0),
      ),
      _QuickAction(
        icon: Icons.calendar_month,
        label: "Events",
        color: const Color(0xFFFBAB7E),
      ),
      _QuickAction(
        icon: Icons.info,
        label: "More Info",
        color: const Color(0xFF85FFBD),
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Quick Actions",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: actions.map((action) {
            return _buildActionButton(action);
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildActionButton(_QuickAction action) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          HapticFeedback.lightImpact();
        },
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: action.color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  action.icon,
                  color: action.color,
                  size: 24,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                action.label,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 🌈 Modern App Bar
  Widget _buildModernAppBar() {
    return SliverAppBar(
      expandedHeight: 220,
      pinned: true,
      elevation: 0,
      backgroundColor: baseColorOne,
      flexibleSpace: FlexibleSpaceBar(
        title: const Text(
          "Parish Information",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        background: Stack(
          fit: StackFit.expand,
          children: [
            // Animated gradient background
            AnimatedContainer(
              duration: const Duration(seconds: 2),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [baseColorOne, baseColorTwo, Color(0xFF6B4EFF)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.0, 0.5, 1.0],
                ),
              ),
            ),

            // Decorative pattern
            Positioned.fill(
              child: CustomPaint(
                painter: WavePainter(),
              ),
            ),

            // Floating particles
            ...List.generate(10, (index) {
              return Positioned(
                left: (index * 40.0) % 400,
                top: (index * 30.0) % 300,
                child: Opacity(
                  opacity: 0.1,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              );
            }),

            // Main content
            const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.church,
                    size: 70,
                    color: Colors.white,
                  ),
                  SizedBox(height: 12),
                  Text(
                    "St. Mary's Church",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -0.5,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Est. 1850",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
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
}

// Supporting classes and models
class _ParishInfoItem {
  final IconData icon;
  final String title;
  final String value;
  final List<Color> gradient;
  final bool isLongText;

  _ParishInfoItem({
    required this.icon,
    required this.title,
    required this.value,
    required this.gradient,
    this.isLongText = false,
  });
}

class _MassTiming {
  final String day;
  final String time;
  final bool isToday;

  _MassTiming({
    required this.day,
    required this.time,
    required this.isToday,
  });
}

class _QuickAction {
  final IconData icon;
  final String label;
  final Color color;

  _QuickAction({
    required this.icon,
    required this.label,
    required this.color,
  });
}

// Custom painter for wave pattern
class WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.05)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final path = Path();
    for (double i = 0; i < size.width; i += 30) {
      path.moveTo(i, 0);
      path.quadraticBezierTo(
          i + 15,
          size.height * 0.3,
          i + 30,
          0
      );
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

