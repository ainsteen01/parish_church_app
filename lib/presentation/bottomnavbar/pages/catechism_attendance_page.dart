
import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class CatechismAttendancePage extends StatefulWidget {
  const CatechismAttendancePage({super.key});

  @override
  State<CatechismAttendancePage> createState() => _CatechismAttendancePageState();
}

class _CatechismAttendancePageState extends State<CatechismAttendancePage> {
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
                  _buildStudentQuickInfo(),
                  const SizedBox(height: 20),
                  _buildAttendanceOverview(),
                  const SizedBox(height: 24),
                  _buildMonthlyAttendance(),
                  const SizedBox(height: 24),
                  _buildExamMarksCard(),
                  const SizedBox(height: 24),
                  _buildSubjectWiseMarks(),
                  const SizedBox(height: 24),
                  _buildRecentActivity(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 📊 Modern App Bar
  Widget _buildModernAppBar() {
    return SliverAppBar(
      expandedHeight: 180,
      pinned: true,
      elevation: 0,
      backgroundColor: baseColorOne,
      flexibleSpace: FlexibleSpaceBar(
        title: const Text(
          "Attendance & Marks",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
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
            // Decorative Pattern
            CustomPaint(
              painter: AttendancePatternPainter(),
              size: Size.infinite,
            ),
            Positioned(
              bottom: 30,
              left: 20,
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.assignment_turned_in, color: Colors.white, size: 24),
                  ),
                  const SizedBox(width: 12),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Academic Year 2024",
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                      ),
                      Text(
                        "Term 1 Progress",
                        style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
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

  // 👤 Student Quick Info
  Widget _buildStudentQuickInfo() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
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
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFFFD700), baseColorOne],
              ),
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(2),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage('https://i.pravatar.cc/150?img=8'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Emily Fernandez",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 2),
                Text(
                  "Level 3 • First Holy Communion",
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: baseColorOne.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              "Roll No: 24",
              style: TextStyle(fontSize: 11, color: baseColorOne, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  // 📈 Attendance Overview Cards
  Widget _buildAttendanceOverview() {
    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            icon: Icons.check_circle,
            value: "85%",
            label: "Attendance",
            color: Colors.green,
            gradient: const [Color(0xFF4CAF50), Color(0xFF8BC34A)],
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildStatCard(
            icon: Icons.pending,
            value: "3",
            label: "Absent Days",
            color: Colors.orange,
            gradient: const [Color(0xFFFF9800), Color(0xFFFF5722)],
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildStatCard(
            icon: Icons.emoji_events,
            value: "A",
            label: "Avg. Grade",
            color: Colors.amber,
            gradient: const [Color(0xFFFFD700), Color(0xFFFDB931)],
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required String value,
    required String label,
    required Color color,
    required List<Color> gradient,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradient,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.white, size: 24),
          const SizedBox(height: 8),
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
        ],
      ),
    );
  }

  // 📅 Monthly Attendance Grid
  Widget _buildMonthlyAttendance() {
    final months = [
      _MonthAttendance(month: "Jan", percentage: 92, color: Colors.green),
      _MonthAttendance(month: "Feb", percentage: 88, color: Colors.green),
      _MonthAttendance(month: "Mar", percentage: 95, color: Colors.green),
      _MonthAttendance(month: "Apr", percentage: 78, color: Colors.orange),
      _MonthAttendance(month: "May", percentage: 82, color: Colors.green),
      _MonthAttendance(month: "Jun", percentage: 0, color: Colors.grey, isUpcoming: true),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Monthly Attendance",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: baseColorOne.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Text(
                "2024",
                style: TextStyle(fontSize: 11, color: baseColorOne, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: months.map((month) => _buildMonthIndicator(month)).toList(),
        ),
      ],
    );
  }

  Widget _buildMonthIndicator(_MonthAttendance month) {
    return Column(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: month.isUpcoming
                ? Colors.grey.shade200
                : month.color.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
            border: month.isUpcoming ? null : Border.all(color: month.color, width: 2),
          ),
          child: Center(
            child: month.isUpcoming
                ? Icon(Icons.remove, size: 16, color: Colors.grey.shade400)
                : Text(
              "${month.percentage}%",
              style: TextStyle(
                fontSize: 11,
                color: month.color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          month.month,
          style: TextStyle(
            fontSize: 11,
            color: month.isUpcoming ? Colors.grey.shade400 : Colors.grey.shade700,
            fontWeight: month.isUpcoming ? FontWeight.normal : FontWeight.w600,
          ),
        ),
      ],
    );
  }

  // 📝 Exam Marks Card
  Widget _buildExamMarksCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [baseColorOne, baseColorTwo],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
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
                "Term Exam Results",
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  "Term 1",
                  style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildExamStat("Total Marks", "450", "500", Colors.amber),
              _buildDivider(),
              _buildExamStat("Percentage", "90%", "A+", Colors.green),
              _buildDivider(),
              _buildExamStat("Rank", "3rd", "Class", Colors.blue),
            ],
          ),
          const SizedBox(height: 20),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: 0.9,
              backgroundColor: Colors.white.withOpacity(0.2),
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
              minHeight: 8,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExamStat(String label, String value, String subValue, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          subValue,
          style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 11),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(height: 30, width: 1, color: Colors.white.withOpacity(0.2));
  }

  // 📚 Subject-wise Marks
  Widget _buildSubjectWiseMarks() {
    final subjects = [
      _SubjectMark(
        subject: "Catechism",
        marks: "45/50",
        percentage: 90,
        grade: "A",
        color: baseColorOne,
      ),
      _SubjectMark(
        subject: "Bible Studies",
        marks: "42/50",
        percentage: 84,
        grade: "B+",
        color: const Color(0xFFC850C0),
      ),
      _SubjectMark(
        subject: "Prayer & Worship",
        marks: "48/50",
        percentage: 96,
        grade: "A+",
        color: Colors.amber,
      ),
      _SubjectMark(
        subject: "Sacraments",
        marks: "38/50",
        percentage: 76,
        grade: "B",
        color: const Color(0xFFFBAB7E),
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Subject-wise Performance",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        ...subjects.map((subject) => _buildSubjectRow(subject)),
      ],
    );
  }

  Widget _buildSubjectRow(_SubjectMark subject) {
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
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: subject.color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(Icons.menu_book, color: subject.color, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subject.subject,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 4),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: subject.percentage / 100,
                    backgroundColor: Colors.grey.shade200,
                    valueColor: AlwaysStoppedAnimation<Color>(subject.color),
                    minHeight: 4,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                subject.marks,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: subject.color),
              ),
              Text(
                subject.grade,
                style: TextStyle(fontSize: 12, color: subject.color.withOpacity(0.7)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 📋 Recent Activity
  Widget _buildRecentActivity() {
    final activities = [
      _Activity(
        date: "Mar 15, 2024",
        event: "Weekly Test",
        result: "18/20",
        status: "Passed",
        color: Colors.green,
      ),
      _Activity(
        date: "Mar 10, 2024",
        event: "Attendance",
        result: "Present",
        status: "Good",
        color: baseColorOne,
      ),
      _Activity(
        date: "Mar 8, 2024",
        event: "Assignment",
        result: "Submitted",
        status: "Completed",
        color: Colors.amber,
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Recent Activity",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        ...activities.map((activity) => _buildActivityItem(activity)),
      ],
    );
  }

  Widget _buildActivityItem(_Activity activity) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
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
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: activity.color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              activity.event == "Attendance" ? Icons.calendar_today : Icons.assignment,
              color: activity.color,
              size: 16,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  activity.event,
                  style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                ),
                Text(
                  activity.date,
                  style: TextStyle(fontSize: 11, color: Colors.grey.shade500),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: activity.color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              activity.result,
              style: TextStyle(fontSize: 11, color: activity.color, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}

// 🎨 Custom Painter
class AttendancePatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.05)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    for (double i = 0; i < size.width; i += 30) {
      canvas.drawLine(
        Offset(i, 0),
        Offset(i + 20, size.height),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Supporting Classes
class _MonthAttendance {
  final String month;
  final int percentage;
  final Color color;
  final bool isUpcoming;

  _MonthAttendance({
    required this.month,
    required this.percentage,
    required this.color,
    this.isUpcoming = false,
  });
}

class _SubjectMark {
  final String subject;
  final String marks;
  final double percentage;
  final String grade;
  final Color color;

  _SubjectMark({
    required this.subject,
    required this.marks,
    required this.percentage,
    required this.grade,
    required this.color,
  });
}

class _Activity {
  final String date;
  final String event;
  final String result;
  final String status;
  final Color color;

  _Activity({
    required this.date,
    required this.event,
    required this.result,
    required this.status,
    required this.color,
  });
}

