import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utils/colors.dart';

class FamilyDetailsPage extends StatelessWidget {
  const FamilyDetailsPage({super.key});

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
                  _buildFamilyHeader(),
                  const SizedBox(height: 24),
                  _buildQuickStats(),
                  const SizedBox(height: 24),
                  _buildFamilyInfoSection(),
                  const SizedBox(height: 24),
                  _buildMembersSection(),
                  const SizedBox(height: 24),
                  _buildRecentActivities(),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  // Modern App Bar with Family Cover
  Widget _buildModernAppBar() {
    return SliverAppBar(
      expandedHeight: 280,
      pinned: true,
      elevation: 0,
      backgroundColor: baseColorOne,
      flexibleSpace: FlexibleSpaceBar(
        title: const Text(
          "Family Details",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        background: Stack(
          fit: StackFit.expand,
          children: [
            // Background Image with Gradient Overlay
            Image.network(
              'https://images.unsplash.com/photo-1511895426328-dc8714191300?ixlib=rb-4.0.3',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [baseColorOne, baseColorTwo],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                );
              },
            ),
            // Gradient Overlay
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.7),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            // Family Crest/Icon
            Positioned(
              bottom: 60,
              left: 20,
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 20,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.family_restroom,
                      size: 40,
                      color: baseColorOne,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Fernandez Family",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -0.5,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          "Member since 1985",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
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

  // Family Header with Quick Info
  Widget _buildFamilyHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: [
          // Family Badge
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [baseColorOne, baseColorTwo],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Icon(
              Icons.emoji_events,
              color: Colors.white,
              size: 32,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Family of the Month",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "December 2024",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: baseColorOne,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Row(
              children: [
                Icon(Icons.verified, color: Colors.green, size: 20),
                SizedBox(width: 4),
                Text(
                  "Active",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Quick Stats Cards
  Widget _buildQuickStats() {
    final stats = [
      _StatItem(
        icon: Icons.people,
        value: "6",
        label: "Members",
        color: baseColorOne,
        gradient: const [baseColorOne, Color(0xFF6B4EFF)],
      ),
      _StatItem(
        icon: Icons.location_city,
        value: "Ward 3",
        label: "Ward",
        color: const Color(0xFFC850C0),
        gradient: const [Color(0xFFC850C0), Color(0xFF4158D0)],
      ),
      _StatItem(
        icon: Icons.cake,
        value: "3",
        label: "Birthdays\nthis month",
        color: const Color(0xFFFBAB7E),
        gradient: const [Color(0xFFFBAB7E), Color(0xFFF7CE68)],
      ),
    ];

    return Row(
      children: stats.map((stat) => Expanded(child: _buildStatCard(stat))).toList(),
    );
  }

  Widget _buildStatCard(_StatItem stat) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: stat.gradient,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: stat.color.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(stat.icon, color: Colors.white, size: 28),
          const SizedBox(height: 8),
          Text(
            stat.value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            stat.label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  // Family Information Section
  Widget _buildFamilyInfoSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: baseColorOne.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.info_outline, color: baseColorOne, size: 20),
              ),
              const SizedBox(width: 12),
              const Text(
                "Family Information",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          _buildInfoRow(
            icon: Icons.family_restroom,
            label: "Family Name",
            value: "Fernandez Family",
            color: baseColorOne,
          ),
          _buildInfoRow(
            icon: Icons.numbers,
            label: "Ward",
            value: "Ward 3 - St. Joseph",
            color: const Color(0xFFC850C0),
          ),
          _buildInfoRow(
            icon: Icons.location_on,
            label: "Address",
            value: "42, Church Street, Anna Nagar, Chennai - 600040",
            color: const Color(0xFFFBAB7E),
            isLongText: true,
          ),
          _buildInfoRow(
            icon: Icons.phone,
            label: "Contact",
            value: "+91 98765 43210",
            color: const Color(0xFF4CAF50),
          ),
          _buildInfoRow(
            icon: Icons.email,
            label: "Email",
            value: "fernandez.family@email.com",
            color: const Color(0xFF2196F3),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
    bool isLongText = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: isLongText ? 3 : 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Family Members Section
  Widget _buildMembersSection() {
    final members = [
      _FamilyMember(
        name: "Carlos Fernandez",
        role: "Head of Family",
        age: 58,
        relation: "Father",
        avatar: 'https://i.pravatar.cc/150?img=1',
        isHead: true,
      ),
      _FamilyMember(
        name: "Maria Fernandez",
        role: "Homemaker",
        age: 54,
        relation: "Mother",
        avatar: 'https://i.pravatar.cc/150?img=2',
      ),
      _FamilyMember(
        name: "David Fernandez",
        role: "Software Engineer",
        age: 28,
        relation: "Son",
        avatar: 'https://i.pravatar.cc/150?img=3',
      ),
      _FamilyMember(
        name: "Sarah Fernandez",
        role: "Doctor",
        age: 26,
        relation: "Daughter",
        avatar: 'https://i.pravatar.cc/150?img=4',
      ),
      _FamilyMember(
        name: "Little Anna",
        role: "Student",
        age: 8,
        relation: "Granddaughter",
        avatar: 'https://i.pravatar.cc/150?img=5',
      ),
      _FamilyMember(
        name: "Joseph Fernandez",
        role: "Retired",
        age: 82,
        relation: "Grandfather",
        avatar: 'https://i.pravatar.cc/150?img=6',
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: baseColorOne.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(Icons.people_outline, color: baseColorOne, size: 20),
                ),
                const SizedBox(width: 12),
                const Text(
                  "Family Members",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: baseColorOne.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                "${members.length} members",
                style: TextStyle(
                  color: baseColorOne,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: members.length,
          itemBuilder: (context, index) {
            return _buildMemberCard(members[index], index);
          },
        ),
      ],
    );
  }

  Widget _buildMemberCard(_FamilyMember member, int index) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      duration: Duration(milliseconds: 400 + (index * 100)),
      curve: Curves.easeOutQuad,
      builder: (context, double value, child) {
        return Transform.translate(
          offset: Offset(0, 20 * (1 - value)),
          child: Opacity(
            opacity: value,
            child: Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // Avatar with gradient border
                  Stack(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [baseColorOne, baseColorTwo],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          shape: BoxShape.circle,
                        ),
                        padding: const EdgeInsets.all(2),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                            image: DecorationImage(
                              image: NetworkImage(member.avatar),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      if (member.isHead)
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                            child: const Icon(
                              Icons.star,
                              color: Colors.white,
                              size: 12,
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                member.name,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: baseColorOne.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                "${member.age} yrs",
                                style: TextStyle(
                                  fontSize: 11,
                                  color: baseColorOne,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          member.role,
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          member.relation,
                          style: TextStyle(
                            fontSize: 12,
                            color: baseColorTwo,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      HapticFeedback.lightImpact();
                    },
                    icon: Icon(
                      Icons.chevron_right,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // Recent Activities Section
  Widget _buildRecentActivities() {
    final activities = [
      _ActivityItem(
        icon: Icons.cake,
        title: "Birthday Celebration",
        description: "Sarah's birthday - 25 years",
        time: "2 days ago",
        color: const Color(0xFFFBAB7E),
      ),
      _ActivityItem(
        icon: Icons.church,
        title: "Sunday Mass",
        description: "Family attended together",
        time: "3 days ago",
        color: baseColorOne,
      ),
      _ActivityItem(
        icon: Icons.volunteer_activism,
        title: "Charity Event",
        description: "Participated in food drive",
        time: "1 week ago",
        color: const Color(0xFF4CAF50),
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: baseColorOne.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(Icons.history, color: baseColorOne, size: 20),
            ),
            const SizedBox(width: 12),
            const Text(
              "Recent Activities",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        ...activities.map((activity) => _buildActivityItem(activity)),
      ],
    );
  }

  Widget _buildActivityItem(_ActivityItem activity) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: activity.color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(activity.icon, color: activity.color, size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  activity.title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  activity.description,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
          Text(
            activity.time,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade500,
            ),
          ),
        ],
      ),
    );
  }

  // Floating Action Button
  Widget _buildFloatingActionButton() {
    return FloatingActionButton.extended(
      onPressed: () {
        HapticFeedback.mediumImpact();
      },
      backgroundColor: baseColorOne,
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      icon: const Icon(Icons.edit),
      label: const Text(
        "Edit Family",
        style: TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

// Supporting Classes
class _StatItem {
  final IconData icon;
  final String value;
  final String label;
  final Color color;
  final List<Color> gradient;

  _StatItem({
    required this.icon,
    required this.value,
    required this.label,
    required this.color,
    required this.gradient,
  });
}

class _FamilyMember {
  final String name;
  final String role;
  final int age;
  final String relation;
  final String avatar;
  final bool isHead;

  _FamilyMember({
    required this.name,
    required this.role,
    required this.age,
    required this.relation,
    required this.avatar,
    this.isHead = false,
  });
}

class _ActivityItem {
  final IconData icon;
  final String title;
  final String description;
  final String time;
  final Color color;

  _ActivityItem({
    required this.icon,
    required this.title,
    required this.description,
    required this.time,
    required this.color,
  });
}

// Colors
