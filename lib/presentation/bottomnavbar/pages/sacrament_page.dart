import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utils/colors.dart';
import '../../../utils/routes.dart';

class SacramentsPage extends StatefulWidget {
  const SacramentsPage({super.key});

  @override
  State<SacramentsPage> createState() => _SacramentsPageState();
}

class _SacramentsPageState extends State<SacramentsPage> {
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
                  _buildStatsSection(),
                  const SizedBox(height: 24),
                  _buildCategoryFilter(),
                  const SizedBox(height: 24),
                  _buildSacramentsGrid(),
                  const SizedBox(height: 24),
                  GestureDetector(
                      onTap: (){
                       Navigator.pushNamed(context, sacramentsDeatilPageRoute);
                      },
                      child: _buildUpcomingSacraments()),
                  const SizedBox(height: 24),
                  _buildSacramentResources(),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  // ✨ Modern App Bar with Sacred Design
  Widget _buildModernAppBar() {
    return SliverAppBar(
      expandedHeight: 240,
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
            // Stained Glass Effect Background
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    baseColorOne,
                    baseColorTwo,
                    const Color(0xFFFFD700),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: const [0.0, 0.6, 1.0],
                ),
              ),
            ),
            // Stained Glass Pattern
            CustomPaint(
              painter: StainedGlassPainter(),
              size: Size.infinite,
            ),
            // Floating Sacred Symbols
            ...List.generate(8, (index) {
              return Positioned(
                left: (index * 60.0) % 400,
                top: (index * 40.0) % 300,
                child: Opacity(
                  opacity: 0.1,
                  child: Icon(
                    _getSacredIcon(index),
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
                      Icons.auto_stories,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Sacraments of the Church",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Seven gates to divine grace",
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

  IconData _getSacredIcon(int index) {
    final icons = [
      Icons.church,
      Icons.auto_stories,
      Icons.water_drop,
      Icons.wine_bar,
      Icons.favorite,
      Icons.handshake,
      Icons.local_hospital,
      Icons.person,
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
          // Profile Avatar with Holy Light
          Stack(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  gradient: const RadialGradient(
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
                      image: NetworkImage(
                        'https://i.pravatar.cc/150?img=7',
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
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
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
                  "David Fernandez",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: baseColorOne.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    "Parishioner since 1995",
                    style: TextStyle(
                      fontSize: 11,
                      color: baseColorOne,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFFFD700).withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(
              Icons.notifications_active,
              color: Color(0xFFFFD700),
              size: 24,
            ),
          ),
        ],
      ),
    );
  }

  // 📊 Stats Section
  Widget _buildStatsSection() {
    final stats = [
      _StatCard(
        icon: Icons.auto_stories,
        value: "7",
        label: "Sacraments",
        gradient: const [baseColorOne, baseColorTwo],
        iconBgColor: Colors.white,
      ),
      _StatCard(
        icon: Icons.check_circle,
        value: "4",
        label: "Received",
        gradient: const [Color(0xFF4CAF50), Color(0xFF8BC34A)],
        iconBgColor: Colors.white,
      ),
      _StatCard(
        icon: Icons.pending,
        value: "3",
        label: "Pending",
        gradient: const [Color(0xFFFF9800), Color(0xFFFF5722)],
        iconBgColor: Colors.white,
      ),
    ];

    return Row(
      children: stats.map((stat) => Expanded(child: _buildStatCard(stat))).toList(),
    );
  }

  Widget _buildStatCard(_StatCard stat) {
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
            color: stat.gradient[0].withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: stat.iconBgColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(stat.icon, color: stat.iconBgColor, size: 24),
          ),
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

  // 🏷️ Category Filter
  Widget _buildCategoryFilter() {
    final categories = ["All", "Initiation", "Healing", "Service"];
    int selectedIndex = 0;

    return Container(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(right: 12),
            child: FilterChip(
              selected: index == selectedIndex,
              label: Text(categories[index]),
              onSelected: (value) {},
              selectedColor: baseColorOne,
              checkmarkColor: Colors.white,
              labelStyle: TextStyle(
                color: index == selectedIndex ? Colors.white : Colors.grey.shade700,
                fontWeight: FontWeight.w600,
              ),
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
                side: BorderSide(
                  color: index == selectedIndex ? baseColorOne : Colors.grey.shade200,
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            ),
          );
        },
      ),
    );
  }

  // 📜 Sacraments Grid
  Widget _buildSacramentsGrid() {
    final sacraments = [
      _SacramentItem(
        title: "Holy Baptism",
        subtitle: "Initiation",
        description: "First sacrament of Christian initiation",
        icon: Icons.water_drop,
        gradient: const [Color(0xFF4158D0), Color(0xFF6B4EFF)],
        date: "March 15, 2024",
        status: "Completed",
        progress: 1.0,
        imageUrl: 'https://images.unsplash.com/photo-1548625149-fc4a29cf7092',
        members: 1,
      ),
      _SacramentItem(
        title: "Holy Communion",
        subtitle: "Initiation",
        description: "Receive the Body and Blood of Christ",
        icon: Icons.auto_stories,
        gradient: const [Color(0xFFC850C0), Color(0xFF4158D0)],
        date: "May 20, 2024",
        status: "Upcoming",
        progress: 0.6,
        imageUrl: 'https://images.unsplash.com/photo-1477065193986-f1cf36512db1',
        members: 2,
      ),
      _SacramentItem(
        title: "Confirmation",
        subtitle: "Initiation",
        description: "Seal of the Holy Spirit",
        icon: Icons.local_fire_department,
        gradient: const [Color(0xFFFBAB7E), Color(0xFFF7CE68)],
        date: "June 10, 2024",
        status: "Preparation",
        progress: 0.3,
        imageUrl: 'https://images.unsplash.com/photo-1449505272090-ca8e55e3755e',
        members: 1,
      ),
      _SacramentItem(
        title: "Holy Matrimony",
        subtitle: "Service",
        description: "Sacrament of marriage",
        icon: Icons.favorite,
        gradient: const [Color(0xFF85FFBD), Color(0xFFFFFB7D)],
        date: "Dec 5, 2024",
        status: "Scheduled",
        progress: 0.0,
        imageUrl: 'https://images.unsplash.com/photo-1519741497674-611481863552',
        members: 2,
      ),
      _SacramentItem(
        title: "Reconciliation",
        subtitle: "Healing",
        description: "Sacrament of penance and confession",
        icon: Icons.healing,
        gradient: const [Color(0xFFA8E6CF), Color(0xFF3B9AE1)],
        date: "Weekly",
        status: "Available",
        progress: 0.0,
        imageUrl: 'https://images.unsplash.com/photo-1517457373958-b7bdd4587205',
        members: 1,
      ),
      _SacramentItem(
        title: "Anointing of Sick",
        subtitle: "Healing",
        description: "Sacrament for the sick and suffering",
        icon: Icons.local_hospital,
        gradient: const [Color(0xFFFF9A9E), Color(0xFFFAD0C4)],
        date: "On Request",
        status: "Available",
        progress: 0.0,
        imageUrl: 'https://images.unsplash.com/photo-1516627145497-ae6968895b74',
        members: 1,
      ),
      _SacramentItem(
        title: "Holy Orders",
        subtitle: "Service",
        description: "Sacrament of ordained ministry",
        icon: Icons.church,
        gradient: const [Color(0xFFB993D6), Color(0xFF8CA6DB)],
        date: "Vocational",
        status: "Inquiry",
        progress: 0.0,
        imageUrl: 'https://images.unsplash.com/photo-1548625149-fc4a29cf7092',
        members: 1,
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
                  child: Icon(Icons.auto_stories, color: baseColorOne, size: 20),
                ),
                const SizedBox(width: 12),
                const Text(
                  "Sacraments",
                  style: TextStyle(
                    fontSize: 20,
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
                "7 total",
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
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.85,
          ),
          itemCount: sacraments.length,
          itemBuilder: (context, index) {
            return _buildSacramentCard(sacraments[index], index);
          },
        ),
      ],
    );
  }

  Widget _buildSacramentCard(_SacramentItem sacrament, int index) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      duration: Duration(milliseconds: 400 + (index * 100)),
      curve: Curves.easeOutQuad,
      builder: (context, double value, child) {
        return Transform.scale(
          scale: value,
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
                    HapticFeedback.lightImpact();
                  },
                  child: Stack(
                    children: [
                      // Background Image with Overlay
                      Positioned.fill(
                        child: Image.network(
                          sacrament.imageUrl,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: sacrament.gradient[0].withOpacity(0.1),
                            );
                          },
                        ),
                      ),
                      // Gradient Overlay
                      Positioned.fill(
                        child: Container(
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
                      ),
                      // Content
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Icon and Status
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: sacrament.gradient,
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Icon(
                                    sacrament.icon,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: _getStatusColor(sacrament.status).withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: _getStatusColor(sacrament.status),
                                      width: 1,
                                    ),
                                  ),
                                  child: Text(
                                    sacrament.status,
                                    style: TextStyle(
                                      fontSize: 9,
                                      color: _getStatusColor(sacrament.status),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            // Title and Subtitle
                            Text(
                              sacrament.title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              sacrament.subtitle,
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 8),
                            // Progress Bar
                            if (sacrament.progress > 0) ...[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: LinearProgressIndicator(
                                  value: sacrament.progress,
                                  backgroundColor: Colors.white.withOpacity(0.2),
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    _getStatusColor(sacrament.status),
                                  ),
                                  minHeight: 4,
                                ),
                              ),
                              const SizedBox(height: 4),
                            ],
                            // Date and Members
                            Row(
                              children: [
                                Icon(
                                  Icons.calendar_today,
                                  color: Colors.white70,
                                  size: 10,
                                ),
                                const SizedBox(width: 4),
                                Expanded(
                                  child: Text(
                                    sacrament.date,
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 10,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                if (sacrament.members > 1) ...[
                                  const SizedBox(width: 8),
                                  Icon(
                                    Icons.people,
                                    color: Colors.white70,
                                    size: 10,
                                  ),
                                  const SizedBox(width: 2),
                                  Text(
                                    "${sacrament.members}",
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ],
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
        );
      },
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case "Completed":
        return Colors.green;
      case "Upcoming":
        return Colors.orange;
      case "Preparation":
        return Colors.blue;
      case "Scheduled":
        return Colors.purple;
      case "Available":
        return Colors.teal;
      default:
        return Colors.grey;
    }
  }

  // ⏰ Upcoming Sacraments
  Widget _buildUpcomingSacraments() {
    final upcoming = [
      _UpcomingSacrament(
        name: "Holy Communion",
        date: "May 20, 2024",
        time: "10:30 AM",
        participants: 12,
        icon: Icons.auto_stories,
        color: baseColorTwo,
      ),
      _UpcomingSacrament(
        name: "Confirmation",
        date: "June 10, 2024",
        time: "6:00 PM",
        participants: 8,
        icon: Icons.local_fire_department,
        color: const Color(0xFFFBAB7E),
      ),
      _UpcomingSacrament(
        name: "Baptism",
        date: "June 15, 2024",
        time: "9:00 AM",
        participants: 3,
        icon: Icons.water_drop,
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
              child: Icon(Icons.upcoming, color: baseColorOne, size: 20),
            ),
            const SizedBox(width: 12),
            const Text(
              "Upcoming Sacraments",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        ...upcoming.map((sacrament) => _buildUpcomingItem(sacrament)),
      ],
    );
  }

  Widget _buildUpcomingItem(_UpcomingSacrament sacrament) {
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
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: sacrament.color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(sacrament.icon, color: sacrament.color, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sacrament.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.calendar_today, size: 12, color: Colors.grey.shade500),
                    const SizedBox(width: 4),
                    Text(
                      sacrament.date,
                      style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                    ),
                    const SizedBox(width: 12),
                    Icon(Icons.access_time, size: 12, color: Colors.grey.shade500),
                    const SizedBox(width: 4),
                    Text(
                      sacrament.time,
                      style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: sacrament.color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Icon(Icons.people, size: 12, color: sacrament.color),
                const SizedBox(width: 4),
                Text(
                  "${sacrament.participants}",
                  style: TextStyle(
                    fontSize: 12,
                    color: sacrament.color,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 📚 Sacrament Resources
  Widget _buildSacramentResources() {
    final resources = [
      _ResourceItem(
        title: "Baptism Preparation",
        type: "Guide",
        icon: Icons.menu_book,
        color: baseColorOne,
      ),
      _ResourceItem(
        title: "Communion Catechism",
        type: "PDF",
        icon: Icons.picture_as_pdf,
        color: const Color(0xFFF44336),
      ),
      _ResourceItem(
        title: "Marriage Guidelines",
        type: "Document",
        icon: Icons.description,
        color: const Color(0xFF4CAF50),
      ),
      _ResourceItem(
        title: "Confirmation Workbook",
        type: "Book",
        icon: Icons.auto_stories,
        color: const Color(0xFFFF9800),
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
                  "Resources",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            TextButton(
              onPressed: () {

              },
              child: const Text("View All"),
            ),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: resources.length,
            itemBuilder: (context, index) {
              return _buildResourceCard(resources[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildResourceCard(_ResourceItem resource) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 12),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: resource.color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(resource.icon, color: resource.color, size: 16),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  resource.type,
                  style: TextStyle(
                    fontSize: 11,
                    color: resource.color,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            resource.title,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
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
      icon: const Icon(Icons.add, color: Colors.white),
      label: const Text(
        "Schedule Sacrament",
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }
}

// 🎨 Custom Painter for Stained Glass Effect
class StainedGlassPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.05)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final path = Path();
    final double width = size.width;
    final double height = size.height;

    // Draw stained glass pattern
    for (double i = 0; i < width; i += 40) {
      for (double j = 0; j < height; j += 40) {
        path.moveTo(i, j);
        path.lineTo(i + 20, j + 20);
        path.moveTo(i + 40, j);
        path.lineTo(i + 20, j + 20);
      }
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// 📊 Supporting Classes
class _StatCard {
  final IconData icon;
  final String value;
  final String label;
  final List<Color> gradient;
  final Color iconBgColor;

  _StatCard({
    required this.icon,
    required this.value,
    required this.label,
    required this.gradient,
    required this.iconBgColor,
  });
}

class _SacramentItem {
  final String title;
  final String subtitle;
  final String description;
  final IconData icon;
  final List<Color> gradient;
  final String date;
  final String status;
  final double progress;
  final String imageUrl;
  final int members;

  _SacramentItem({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.icon,
    required this.gradient,
    required this.date,
    required this.status,
    required this.progress,
    required this.imageUrl,
    required this.members,
  });
}

class _UpcomingSacrament {
  final String name;
  final String date;
  final String time;
  final int participants;
  final IconData icon;
  final Color color;

  _UpcomingSacrament({
    required this.name,
    required this.date,
    required this.time,
    required this.participants,
    required this.icon,
    required this.color,
  });
}

class _ResourceItem {
  final String title;
  final String type;
  final IconData icon;
  final Color color;

  _ResourceItem({
    required this.title,
    required this.type,
    required this.icon,
    required this.color,
  });
}
