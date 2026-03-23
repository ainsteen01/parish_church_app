
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/routes.dart';

class CatechismPage extends StatefulWidget {
  const CatechismPage({super.key});

  @override
  State<CatechismPage> createState() => _CatechismPageState();
}

class _CatechismPageState extends State<CatechismPage> {
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
                  _buildWelcomeSection(),
                  const SizedBox(height: 24),
                  _buildProgressOverview(),
                  const SizedBox(height: 24),
                  _buildStudentInfoCard(),
                  const SizedBox(height: 24),
                  _buildAcademicInfo(),
                  const SizedBox(height: 24),
                  _buildClassSchedule(),
                  const SizedBox(height: 24),
                  _buildUpcomingClasses(),
                  const SizedBox(height: 24),
                  _buildLearningMaterials(),
                  const SizedBox(height: 24),
                  _buildRecentAssessments(),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  // 📚 Modern App Bar with Catechism Theme
  Widget _buildModernAppBar() {
    return SliverAppBar(
      expandedHeight: 260,
      pinned: true,
      elevation: 0,
      backgroundColor: baseColorOne,
      flexibleSpace: FlexibleSpaceBar(
        title: const Text(
          "",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        background: Stack(
          fit: StackFit.expand,
          children: [
            // Educational Background Pattern
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    baseColorOne,
                    baseColorTwo,
                    const Color(0xFF6B4EFF),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            // Book Pattern Overlay
            CustomPaint(
              painter: BookPatternPainter(),
              size: Size.infinite,
            ),
            // Floating Educational Icons
            ...List.generate(8, (index) {
              return Positioned(
                left: (index * 70.0) % 400,
                top: (index * 50.0) % 300,
                child: Opacity(
                  opacity: 0.1,
                  child: Icon(
                    _getEducationalIcon(index),
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              );
            }),
            // Main Content
            Positioned(
              bottom: 40,
              left: 20,
              right: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(
                      Icons.menu_book,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Faith Formation",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Catechism Classes • Level 3",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 16,
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

  IconData _getEducationalIcon(int index) {
    final icons = [
      Icons.menu_book,
      Icons.school,
      Icons.auto_stories,
      Icons.church,
      Icons.abc,
      Icons.book,
      Icons.lightbulb,
      Icons.star,
    ];
    return icons[index % icons.length];
  }

  // 👋 Welcome Section
  Widget _buildWelcomeSection() {
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
          // Student Avatar with Academic Border
          Stack(
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFFD700), baseColorOne],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(2),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://i.pravatar.cc/150?img=8',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: const Icon(
                    Icons.check,
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
                const Text(
                  "Welcome back,",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  "Emily Fernandez",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: baseColorOne.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                       overflow: TextOverflow.ellipsis ,
                        "CAT-2024-156",
                        style: TextStyle(
                          fontSize: 10,
                          color: baseColorOne,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.amber.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 12),
                          SizedBox(width: 2),
                          Text(
                            "Top Performer",
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.amber,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 📊 Progress Overview
  Widget _buildProgressOverview() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [baseColorOne, baseColorTwo],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: baseColorOne.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Academic Progress",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  "Term 1 of 4",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              _buildProgressStat("Classes", "24/32", 0.75, Colors.amber),
              _buildProgressStat("Assignments", "8/12", 0.67, Colors.green),
              _buildProgressStat("Attendance", "92%", 0.92, Colors.blue),
            ],
          ),
          const SizedBox(height: 20),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: 0.72,
              backgroundColor: Colors.white.withOpacity(0.2),
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
              minHeight: 8,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Overall Progress",
                style: TextStyle(color: Colors.white70, fontSize: 12),
              ),
              Text(
                "72% Complete",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProgressStat(String label, String value, double progress, Color color) {
    return Expanded(
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 11,
            ),
          ),
          const SizedBox(height: 6),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.white.withOpacity(0.2),
              valueColor: AlwaysStoppedAnimation<Color>(color),
              minHeight: 4,
            ),
          ),
        ],
      ),
    );
  }

  // 👤 Student Information Card
  Widget _buildStudentInfoCard() {
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
                child: Icon(Icons.person_outline, color: baseColorOne, size: 20),
              ),
              const SizedBox(width: 12),
              const Text(
                "Student Information",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          _buildInfoRow(
            icon: Icons.badge,
            label: "Full Name",
            value: "Emily Maria Fernandez",
            color: baseColorOne,
          ),
          _buildInfoRow(
            icon: Icons.numbers,
            label: "Class",
            value: "Level 3 - First Holy Communion",
            color: const Color(0xFFC850C0),
            badge: "Grade A",
          ),
          _buildInfoRow(
            icon: Icons.person,
            label: "Teacher",
            value: "Sr. Mary Catherine",
            color: const Color(0xFFFBAB7E),
            subtitle: "Catechist since 2015",
          ),
          _buildInfoRow(
            icon: Icons.calendar_today,
            label: "Enrollment Date",
            value: "September 5, 2023",
            color: const Color(0xFF4CAF50),
          ),
          _buildInfoRow(
            icon: Icons.group,
            label: "Batch",
            value: "Morning Batch • Room 203",
            color: const Color(0xFF2196F3),
          ),
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, attendencePageRoute);
            },
            child: Text(
              "View Attendance", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w700, fontSize: 17),),
          )
        ],
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
    String? subtitle,
    String? badge,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: color, size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      label,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const SizedBox(width: 8),
                    if (badge != null)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          badge,
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.green,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 📚 Academic Information
  Widget _buildAcademicInfo() {
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
                child: Icon(Icons.school, color: baseColorOne, size: 20),
              ),
              const SizedBox(width: 12),
              const Text(
                "Academic Information",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          Row(
            children: [
              Expanded(
                child: _buildAcademicChip(
                  icon: Icons.menu_book,
                  label: "Curriculum",
                  value: "CCC Catechism",
                  color: baseColorOne,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildAcademicChip(
                  icon: Icons.timer,
                  label: "Duration",
                  value: "2 hours/week",
                  color: const Color(0xFFC850C0),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildAcademicChip(
                  icon: Icons.people,
                  label: "Class Size",
                  value: "18 Students",
                  color: const Color(0xFFFBAB7E),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildAcademicChip(
                  icon: Icons.emoji_events,
                  label: "Achievements",
                  value: "3 Awards",
                  color: Colors.amber,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAcademicChip({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.1)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: color, size: 16),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey.shade600,
                  ),
                ),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 13,
                    color: color,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 🗓️ Class Schedule
  Widget _buildClassSchedule() {
    final schedule = [
      _ScheduleItem(
        day: "Sunday",
        time: "9:00 AM - 10:30 AM",
        subject: "Catechism Class",
        room: "Room 203",
        teacher: "Sr. Mary",
        color: baseColorOne,
        isToday: DateTime.now().weekday == DateTime.sunday,
      ),
      _ScheduleItem(
        day: "Wednesday",
        time: "4:00 PM - 5:30 PM",
        subject: "Bible Study",
        room: "Room 105",
        teacher: "Fr. John",
        color: const Color(0xFFC850C0),
        isToday: DateTime.now().weekday == DateTime.wednesday,
      ),
      _ScheduleItem(
        day: "Friday",
        time: "5:00 PM - 6:30 PM",
        subject: "Prayer Group",
        room: "Chapel",
        teacher: "Sr. Catherine",
        color: const Color(0xFFFBAB7E),
        isToday: DateTime.now().weekday == DateTime.friday,
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
                  child: Icon(Icons.calendar_month, color: baseColorOne, size: 20),
                ),
                const SizedBox(width: 12),
                const Text(
                  "Class Schedule",
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
              child: const Text(
                "Weekly",
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
        ...schedule.map((item) => _buildScheduleItem(item)),
      ],
    );
  }

  Widget _buildScheduleItem(_ScheduleItem item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: item.isToday
            ? Border.all(color: item.color, width: 2)
            : null,
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
          // Day Indicator
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: item.color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  item.day.substring(0, 1),
                  style: TextStyle(
                    color: item.color,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  item.day.substring(1, 3),
                  style: TextStyle(
                    color: item.color,
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      item.subject,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    if (item.isToday)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: item.color.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          "Today",
                          style: TextStyle(
                            fontSize: 10,
                            color: item.color,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                // Expanded(
                //   child:
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.access_time, size: 12, color: Colors.grey.shade500),
                        const SizedBox(width: 4),
                        Text(
                          item.time,
                          style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                        ),
                        const SizedBox(width: 12),
                        Icon(Icons.room, size: 12, color: Colors.grey.shade500),
                        const SizedBox(width: 4),
                        Text(
                          item.room,
                          style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                        ),
                      ],
                    ),
                  ),
               // ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.person, size: 12, color: Colors.grey.shade500),
                    const SizedBox(width: 4),
                    Text(
                      item.teacher,
                      style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              HapticFeedback.lightImpact();
            },
            icon: Icon(Icons.chevron_right, color: Colors.grey.shade400),
          ),
        ],
      ),
    );
  }

  // ⏰ Upcoming Classes
  Widget _buildUpcomingClasses() {
    final upcoming = [
      _UpcomingClass(
        title: "The Sacraments",
        date: "Tomorrow",
        time: "9:00 AM",
        preparation: "Read Chapter 5",
        color: baseColorOne,
      ),
      _UpcomingClass(
        title: "Prayer Workshop",
        date: "Wed, Mar 20",
        time: "4:00 PM",
        preparation: "Bring prayer book",
        color: const Color(0xFFC850C0),
      ),
    ];

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [baseColorOne.withOpacity(0.05), baseColorTwo.withOpacity(0.05)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.white),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Upcoming Classes",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          ...upcoming.map((item) => _buildUpcomingItem(item)),
        ],
      ),
    );
  }

  Widget _buildUpcomingItem(_UpcomingClass item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: item.color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(Icons.event_available, color: item.color, size: 24),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        item.title,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: item.date == "Tomorrow"
                            ? Colors.orange.withOpacity(0.1)
                            : Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        item.date,
                        style: TextStyle(
                          fontSize: 10,
                          color: item.date == "Tomorrow"
                              ? Colors.orange
                              : Colors.grey,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.access_time, size: 10, color: Colors.grey.shade500),
                    const SizedBox(width: 4),
                    Text(
                      item.time,
                      style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.lightbulb, size: 10, color: Colors.grey.shade500),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        item.preparation,
                        style: TextStyle(
                          fontSize: 11,
                          color: item.color,
                          fontStyle: FontStyle.italic,
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
    );
  }

  // 📖 Learning Materials
  Widget _buildLearningMaterials() {
    final materials = [
      _MaterialItem(
        title: "Catechism of Catholic Church",
        type: "Textbook",
        pages: "Chapter 5 • Pages 45-62",
        progress: 0.7,
        color: baseColorOne,
      ),
      _MaterialItem(
        title: "Sacrament Preparation Guide",
        type: "Workbook",
        pages: "Unit 3 • Activities",
        progress: 0.4,
        color: const Color(0xFFC850C0),
      ),
      _MaterialItem(
        title: "Bible Stories for Children",
        type: "Supplementary",
        pages: "New Testament",
        progress: 0.9,
        color: const Color(0xFFFBAB7E),
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
                  child: Icon(Icons.library_books, color: baseColorOne, size: 20),
                ),
                const SizedBox(width: 12),
                const Text(
                  "Learning Materials",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            TextButton(
              onPressed: () {},
              child: const Text("View All"),
            ),
          ],
        ),
        const SizedBox(height: 16),
        ...materials.map((item) => _buildMaterialItem(item)),
      ],
    );
  }

  Widget _buildMaterialItem(_MaterialItem item) {
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
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: item.color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.menu_book, color: item.color, size: 20),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      item.type,
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: item.color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.download, color: item.color, size: 18),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: LinearProgressIndicator(
                    value: item.progress,
                    backgroundColor: Colors.grey.shade200,
                    valueColor: AlwaysStoppedAnimation<Color>(item.color),
                    minHeight: 4,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                "${(item.progress * 100).toInt()}%",
                style: TextStyle(
                  fontSize: 12,
                  color: item.color,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.info_outline, size: 12, color: Colors.grey.shade400),
              const SizedBox(width: 4),
              Text(
                item.pages,
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.grey.shade500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 📝 Recent Assessments
  Widget _buildRecentAssessments() {
    final assessments = [
      _AssessmentItem(
        title: "Chapter 4 Quiz",
        subject: "Sacraments",
        date: "Mar 10, 2024",
        score: "18/20",
        grade: "A",
        color: Colors.green,
      ),
      _AssessmentItem(
        title: "Memory Verse Test",
        subject: "Scripture",
        date: "Mar 3, 2024",
        score: "15/15",
        grade: "A+",
        color: Colors.amber,
      ),
      _AssessmentItem(
        title: "Prayer Assignment",
        subject: "Spirituality",
        date: "Feb 25, 2024",
        score: "22/25",
        grade: "B+",
        color: baseColorOne,
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
              child: Icon(Icons.assignment_turned_in, color: baseColorOne, size: 20),
            ),
            const SizedBox(width: 12),
            const Text(
              "Recent Assessments",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        ...assessments.map((item) => _buildAssessmentItem(item)),
      ],
    );
  }

  Widget _buildAssessmentItem(_AssessmentItem item) {
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
              color: item.color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(Icons.quiz, color: item.color, size: 20),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        item.title,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: item.color.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        item.grade,
                        style: TextStyle(
                          fontSize: 12,
                          color: item.color,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  item.subject,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.calendar_today, size: 10, color: Colors.grey.shade500),
                    const SizedBox(width: 4),
                    Text(
                      item.date,
                      style: TextStyle(fontSize: 10, color: Colors.grey.shade500),
                    ),
                    const SizedBox(width: 12),
                    Icon(Icons.score, size: 10, color: Colors.grey.shade500),
                    const SizedBox(width: 4),
                    Text(
                      item.score,
                      style: TextStyle(
                        fontSize: 10,
                        color: item.color,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 🎯 Floating Action Button
  Widget _buildFloatingActionButton() {
    return FloatingActionButton.extended(
      onPressed: () {
        HapticFeedback.mediumImpact();
      },
      backgroundColor: const Color(0xFFFFD700),
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      icon: const Icon(Icons.assignment, color: Colors.white),
      label: const Text(
        "Submit Assignment",
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }
}

// 🎨 Custom Painter for Book Pattern
class BookPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.05)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    final path = Path();
    final double width = size.width;
    final double height = size.height;

    // Draw book-like lines
    for (double i = 20; i < width; i += 40) {
      for (double j = 20; j < height; j += 40) {
        path.addRect(Rect.fromLTWH(i, j, 20, 25));
      }
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Supporting Classes
class _ScheduleItem {
  final String day;
  final String time;
  final String subject;
  final String room;
  final String teacher;
  final Color color;
  final bool isToday;

  _ScheduleItem({
    required this.day,
    required this.time,
    required this.subject,
    required this.room,
    required this.teacher,
    required this.color,
    required this.isToday,
  });
}

class _UpcomingClass {
  final String title;
  final String date;
  final String time;
  final String preparation;
  final Color color;

  _UpcomingClass({
    required this.title,
    required this.date,
    required this.time,
    required this.preparation,
    required this.color,
  });
}

class _MaterialItem {
  final String title;
  final String type;
  final String pages;
  final double progress;
  final Color color;

  _MaterialItem({
    required this.title,
    required this.type,
    required this.pages,
    required this.progress,
    required this.color,
  });
}

class _AssessmentItem {
  final String title;
  final String subject;
  final String date;
  final String score;
  final String grade;
  final Color color;

  _AssessmentItem({
    required this.title,
    required this.subject,
    required this.date,
    required this.score,
    required this.grade,
    required this.color,
  });
}

