import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utils/colors.dart';

class SacramentDetailsPage extends StatelessWidget {
  const SacramentDetailsPage({super.key});

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
                  _buildSacramentHeader(),
                  const SizedBox(height: 24),
                  _buildSacramentTimeline(),
                  const SizedBox(height: 24),
                  _buildSacramentDetails(),
                  const SizedBox(height: 24),
                  _buildCertificateSection(),
                  const SizedBox(height: 24),
                  _buildPhotoMemories(),
                  const SizedBox(height: 24),
                  _buildShareSection(),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  // 🌟 Modern App Bar with Sacrament Theme
  Widget _buildModernAppBar() {
    return SliverAppBar(
      expandedHeight: 300,
      pinned: true,
      elevation: 0,
      backgroundColor: baseColorOne,
      flexibleSpace: FlexibleSpaceBar(
        title: const Text(
          "Sacrament Details",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        background: Stack(
          fit: StackFit.expand,
          children: [
            // Background Image with Holy Theme
            Image.network(
              'https://images.unsplash.com/photo-1548625149-fc4a29cf7092?ixlib=rb-4.0.3',
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
            // Sacred Gradient Overlay
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.8),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            // Holy Light Effect
            Positioned(
              top: -50,
              right: -50,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.3),
                      blurRadius: 100,
                      spreadRadius: 50,
                    ),
                  ],
                ),
              ),
            ),
            // Sacrament Icon and Title
            Positioned(
              bottom: 60,
              left: 20,
              right: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.3),
                      ),
                    ),
                    child: const Icon(
                      Icons.auto_stories,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Holy Baptism",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Text(
                      "Sacrament of Initiation",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
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

  // 📿 Sacrament Header with Quick Info
  Widget _buildSacramentHeader() {
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
          // Sacrament Badge
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFFFD700), Color(0xFFFDB931)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Icon(
              Icons.auto_awesome,
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
                  "Sacrament Date",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_today,
                      size: 16,
                      color: baseColorOne,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      overflow: TextOverflow.clip,
                      "March 15, 2024",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: baseColorOne,
                      ),
                    ),
                  ],
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
                  "Valid",
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

  // ⏳ Timeline of Sacrament Events
  Widget _buildSacramentTimeline() {
    final timelineEvents = [
      _TimelineEvent(
        title: "Baptism Preparation",
        date: "March 1, 2024",
        description: "Completed preparation classes",
        icon: Icons.menu_book,
        color: baseColorOne,
        isCompleted: true,
      ),
      _TimelineEvent(
        title: "Rite of Acceptance",
        date: "March 8, 2024",
        description: "Welcome into the catechumenate",
        icon: Icons.handshake,
        color: const Color(0xFFC850C0),
        isCompleted: true,
      ),
      _TimelineEvent(
        title: "Sacrament of Baptism",
        date: "March 15, 2024",
        description: "Celebrated at St. Mary's Church",
        icon: Icons.church,
        color: const Color(0xFFFFD700),
        isCompleted: true,
        isCurrent: true,
      ),
      _TimelineEvent(
        title: "First Holy Communion",
        date: "Upcoming",
        description: "Preparation in progress",
        icon: Icons.auto_stories,
        color: Colors.grey,
        isCompleted: false,
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
              child: Icon(Icons.timeline, color: baseColorOne, size: 20),
            ),
            const SizedBox(width: 12),
            const Text(
              "Sacrament Journey",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        ...timelineEvents.map((event) => _buildTimelineEvent(event)),
      ],
    );
  }

  Widget _buildTimelineEvent(_TimelineEvent event) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: event.isCurrent
            ? Border.all(color: event.color, width: 2)
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
          // Timeline Icon
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: event.isCompleted
                  ? event.color.withOpacity(0.1)
                  : Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              event.icon,
              color: event.isCompleted ? event.color : Colors.grey,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          // Event Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        event.title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: event.isCompleted
                              ? Colors.black87
                              : Colors.grey,
                        ),
                      ),
                    ),
                    if (event.isCompleted)
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.check_circle,
                          color: Colors.green,
                          size: 16,
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  event.date,
                  style: TextStyle(
                    fontSize: 13,
                    color: event.isCompleted
                        ? event.color
                        : Colors.grey.shade500,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  event.description,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 📜 Sacrament Details Card
  Widget _buildSacramentDetails() {
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
                "Sacrament Information",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          _buildDetailCard(
            icon: Icons.calendar_month,
            label: "Date of Celebration",
            value: "March 15, 2024",
            color: baseColorOne,
            secondaryValue: "10:30 AM",
          ),
          _buildDetailCard(
            icon: Icons.church,
            label: "Church",
            value: "St. Mary's Church",
            color: const Color(0xFFC850C0),
            secondaryValue: "Chennai, Tamil Nadu",
          ),
          _buildDetailCard(
            icon: Icons.person,
            label: "Presiding Priest",
            value: "Fr. John Bosco",
            color: const Color(0xFFFBAB7E),
            secondaryValue: "Parish Priest",
          ),
          _buildDetailCard(
            icon: Icons.people,
            label: "Godparents",
            value: "Mr. & Mrs. Michael DSouza",
            color: const Color(0xFF4CAF50),
            secondaryValue: "Witnesses",
          ),
          _buildDetailCard(
            icon: Icons.numbers,
            label: "Registration Number",
            value: "BAP/2024/156",
            color: const Color(0xFF2196F3),
            secondaryValue: "Book No: 12, Page: 45",
          ),
        ],
      ),
    );
  }

  Widget _buildDetailCard({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
    String? secondaryValue,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: color.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: 16),
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
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (secondaryValue != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    secondaryValue,
                    style: TextStyle(
                      fontSize: 13,
                      color: color,
                      fontWeight: FontWeight.w500,
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

  // 📄 Certificate Download Section
  Widget _buildCertificateSection() {
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(
                  Icons.card_membership,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sacrament Certificate",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Official Church Document",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Certificate Preview
          Container(
            height: 160,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                image: NetworkImage(
                  'https://images.unsplash.com/photo-1583793237493-70d5e2a7579a?ixlib=rb-4.0.3',
                ),
                fit: BoxFit.cover,
                opacity: 0.2,
              ),
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        colors: [
                          Colors.white.withOpacity(0.9),
                          Colors.white.withOpacity(0.7),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.auto_stories, color: baseColorOne, size: 24),
                          const SizedBox(width: 8),
                          Text(
                            "Certificate of Baptism",
                            style: TextStyle(
                              color: baseColorOne,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        "This is to certify that",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      const Text(
                        "Baby Maria Fernandez",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        "was baptized on March 15, 2024",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: baseColorOne,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      "Valid Certificate",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Download Options
          Row(
            children: [
              Expanded(
                child: _buildDownloadButton(
                  icon: Icons.picture_as_pdf,
                  label: "PDF",
                  color: const Color(0xFFF44336),
                  onTap: () {
                    HapticFeedback.mediumImpact();
                  },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildDownloadButton(
                  icon: Icons.image,
                  label: "Image",
                  color: const Color(0xFF4CAF50),
                  onTap: () {
                    HapticFeedback.mediumImpact();
                  },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildDownloadButton(
                  icon: Icons.print,
                  label: "Print",
                  color: const Color(0xFF2196F3),
                  onTap: () {
                    HapticFeedback.mediumImpact();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDownloadButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              Icon(icon, color: color, size: 24),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  color: color,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 📸 Photo Memories Section
  Widget _buildPhotoMemories() {
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
                  child: Icon(Icons.photo_library, color: baseColorOne, size: 20),
                ),
                const SizedBox(width: 12),
                const Text(
                  "Photo Memories",
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
        SizedBox(
          height: 100,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildPhotoItem(
                'https://images.unsplash.com/photo-1548625149-fc4a29cf7092?ixlib=rb-4.0.3',
                'Baptism',
              ),
              _buildPhotoItem(
                'https://images.unsplash.com/photo-1477065193986-f1cf36512db1?ixlib=rb-4.0.3',
                'Ceremony',
              ),
              _buildPhotoItem(
                'https://images.unsplash.com/photo-1449505272090-ca8e55e3755e?ixlib=rb-4.0.3',
                'Family',
              ),
              _buildPhotoItem(
                'https://images.unsplash.com/photo-1517457373958-b7bdd4587205?ixlib=rb-4.0.3',
                'Celebration',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPhotoItem(String imageUrl, String label) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  // 🤝 Share Section
  Widget _buildShareSection() {
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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildShareOption(Icons.share, "Share", baseColorOne),
          _buildShareOption(Icons.download, "Save", baseColorTwo),
          _buildShareOption(Icons.email, "Email", const Color(0xFFFBAB7E)),
          _buildShareOption(Icons.share_location, "WhatsApp", const Color(0xFF4CAF50)),
        ],
      ),
    );
  }

  Widget _buildShareOption(IconData icon, String label, Color color) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          HapticFeedback.lightImpact();
        },
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(icon, color: color, size: 22),
              ),
              const SizedBox(height: 6),
              Text(
                label,
                style: TextStyle(
                  fontSize: 11,
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
      icon: const Icon(Icons.auto_awesome, color: Colors.white),
      label: const Text(
        "Request Copy",
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }
}

// Supporting Classes
class _TimelineEvent {
  final String title;
  final String date;
  final String description;
  final IconData icon;
  final Color color;
  final bool isCompleted;
  final bool isCurrent;

  _TimelineEvent({
    required this.title,
    required this.date,
    required this.description,
    required this.icon,
    required this.color,
    this.isCompleted = false,
    this.isCurrent = false,
  });
}

