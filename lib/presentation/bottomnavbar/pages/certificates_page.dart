import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utils/colors.dart';

class CertificatesPage extends StatefulWidget {
  const CertificatesPage({super.key});

  @override
  State<CertificatesPage> createState() => _CertificatesPageState();
}

class _CertificatesPageState extends State<CertificatesPage> {
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
                  _buildCertificateStats(),
                  const SizedBox(height: 24),
                  _buildCategoryFilter(),
                  const SizedBox(height: 24),
                  _buildCertificatesGrid(),
                  const SizedBox(height: 24),
                  _buildRecentDownloads(),
                  const SizedBox(height: 24),
                  _buildRequestCertificate(),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  // 📜 Modern App Bar with Certificate Theme
  Widget _buildModernAppBar() {
    return SliverAppBar(
      expandedHeight: 200,
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
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [baseColorOne, baseColorTwo, const Color(0xFFFFD700)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            // Certificate Pattern Overlay
            CustomPaint(
              painter: CertificatePatternPainter(),
              size: Size.infinite,
            ),
            // Floating Certificate Icons
            ...List.generate(6, (index) {
              return Positioned(
                left: (index * 80.0) % 400,
                top: (index * 60.0) % 300,
                child: Opacity(
                  opacity: 0.1,
                  child: Icon(
                    _getCertificateIcon(index),
                    color: Colors.white,
                    size: 50,
                  ),
                ),
              );
            }),
            Positioned(
              bottom: 30,
              left: 20,
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(Icons.card_membership, color: Colors.white, size: 30),
                  ),
                  const SizedBox(width: 16),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Digital Certificates",
                        style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Download & Share",
                        style: TextStyle(color: Colors.white70, fontSize: 14),
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

  IconData _getCertificateIcon(int index) {
    final icons = [
      Icons.card_membership,
      Icons.auto_stories,
      Icons.favorite,
      Icons.church,
      Icons.water_drop,
      Icons.receipt,
    ];
    return icons[index % icons.length];
  }

  // 👤 Welcome Section with User Info
  Widget _buildWelcomeSection() {
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
                  image: NetworkImage('https://i.pravatar.cc/150?img=7'),
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
                  "Fernandez Family",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 2),
                Text(
                  "Parishioner since 1985 • 8 certificates",
                  style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: baseColorOne.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.cloud_download, color: baseColorOne, size: 20),
          ),
        ],
      ),
    );
  }

  // 📊 Certificate Statistics
  Widget _buildCertificateStats() {
    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            icon: Icons.card_membership,
            value: "8",
            label: "Total",
            color: baseColorOne,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildStatCard(
            icon: Icons.cloud_download,
            value: "24",
            label: "Downloads",
            color: Colors.green,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildStatCard(
            icon: Icons.pending,
            value: "2",
            label: "Pending",
            color: Colors.orange,
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
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
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
          Icon(icon, color: color, size: 22),
          const SizedBox(height: 6),
          Text(
            value,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color),
          ),
          Text(
            label,
            style: TextStyle(fontSize: 10, color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }

  // 🏷️ Category Filter
  Widget _buildCategoryFilter() {
    final categories = ["All", "Sacraments", "Donations", "Membership"];

    return Container(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(right: 10),
            child: FilterChip(
              selected: index == 0,
              label: Text(categories[index]),
              onSelected: (value) {},
              selectedColor: baseColorOne,
              checkmarkColor: Colors.white,
              labelStyle: TextStyle(
                fontSize: 12,
                color: index == 0 ? Colors.white : Colors.grey.shade700,
              ),
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
                side: BorderSide(color: index == 0 ? baseColorOne : Colors.grey.shade200),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            ),
          );
        },
      ),
    );
  }

  // 📋 Certificates Grid
  Widget _buildCertificatesGrid() {
    final certificates = [
      _CertificateItem(
        id: "BAP-2024-001",
        title: "Baptism Certificate",
        date: "March 15, 2024",
        type: "Sacrament",
        format: "PDF",
        size: "2.4 MB",
        icon: Icons.water_drop,
        color: baseColorOne,
        gradient: const [baseColorOne, Color(0xFF6B4EFF)],
        imageUrl: 'https://images.unsplash.com/photo-1548625149-fc4a29cf7092',
        downloads: 3,
      ),
      _CertificateItem(
        id: "MAR-2024-023",
        title: "Marriage Certificate",
        date: "Dec 5, 2024",
        type: "Sacrament",
        format: "PDF",
        size: "3.1 MB",
        icon: Icons.favorite,
        color: const Color(0xFFFF6B6B),
        gradient: const [Color(0xFFFF6B6B), Color(0xFFFF8E8E)],
        imageUrl: 'https://images.unsplash.com/photo-1519741497674-611481863552',
        downloads: 5,
      ),
      _CertificateItem(
        id: "CON-2024-156",
        title: "Confirmation",
        date: "June 10, 2024",
        type: "Sacrament",
        format: "PDF",
        size: "1.8 MB",
        icon: Icons.local_fire_department,
        color: const Color(0xFFFFA726),
        gradient: const [Color(0xFFFFA726), Color(0xFFFFB74D)],
        imageUrl: 'https://images.unsplash.com/photo-1507692049790-de58290a4334',
        downloads: 2,
      ),
      _CertificateItem(
        id: "DON-2024-089",
        title: "Donation Receipt",
        date: "Feb 28, 2024",
        type: "Donation",
        format: "PDF",
        size: "1.2 MB",
        icon: Icons.receipt,
        color: Colors.green,
        gradient: const [Color(0xFF4CAF50), Color(0xFF8BC34A)],
        imageUrl: 'https://images.unsplash.com/photo-1554224155-6726b3ff858f',
        downloads: 1,
        amount: "₹5,000",
      ),
      _CertificateItem(
        id: "MEM-2024-045",
        title: "Membership Card",
        date: "Jan 1, 2024",
        type: "Membership",
        format: "Image",
        size: "0.8 MB",
        icon: Icons.card_membership,
        color: Colors.purple,
        gradient: const [Color(0xFF9C27B0), Color(0xFFBA68C8)],
        imageUrl: 'https://images.unsplash.com/photo-1519681393784-d120267933ba',
        downloads: 7,
      ),
      _CertificateItem(
        id: "FHC-2024-112",
        title: "First Holy Communion",
        date: "May 20, 2024",
        type: "Sacrament",
        format: "PDF",
        size: "2.1 MB",
        icon: Icons.auto_stories,
        color: const Color(0xFFC850C0),
        gradient: const [Color(0xFFC850C0), Color(0xFFE1B0E1)],
        imageUrl: 'https://images.unsplash.com/photo-1519681393784-d120267933ba',
        downloads: 4,
      ),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.85,
      ),
      itemCount: certificates.length,
      itemBuilder: (context, index) {
        return _buildCertificateCard(certificates[index], index);
      },
    );
  }

  Widget _buildCertificateCard(_CertificateItem cert, int index) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      duration: Duration(milliseconds: 400 + (index * 100)),
      curve: Curves.easeOutQuad,
      builder: (context, double value, child) {
        return Transform.scale(
          scale: value,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 15,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
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
                          cert.imageUrl,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(color: cert.color.withOpacity(0.1));
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
                                Colors.black.withOpacity(0.8),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        ),
                      ),
                      // Content
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Icon and Type
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: cert.gradient,
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Icon(cert.icon, color: Colors.white, size: 14),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    cert.type,
                                    style: const TextStyle(color: Colors.white, fontSize: 8),
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            // Title and Date
                            Text(
                              cert.title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 2,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              cert.date,
                              style: const TextStyle(color: Colors.white70, fontSize: 9),
                            ),
                            const SizedBox(height: 8),
                            // Footer with ID and Download
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    cert.id,
                                    style: const TextStyle(color: Colors.white60, fontSize: 7),
                                    maxLines: 1,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(Icons.cloud_download, color: Colors.white, size: 10),
                                      const SizedBox(width: 2),
                                      Text(
                                        "${cert.downloads}",
                                        style: const TextStyle(color: Colors.white, fontSize: 8),
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
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  // 📥 Recent Downloads Section
  Widget _buildRecentDownloads() {
    final recentDownloads = [
      _DownloadItem(
        title: "Baptism Certificate",
        date: "Today, 10:30 AM",
        size: "2.4 MB",
        icon: Icons.water_drop,
        color: baseColorOne,
      ),
      _DownloadItem(
        title: "Donation Receipt",
        date: "Yesterday, 3:15 PM",
        size: "1.2 MB",
        icon: Icons.receipt,
        color: Colors.green,
      ),
      _DownloadItem(
        title: "Membership Card",
        date: "Mar 12, 2024",
        size: "0.8 MB",
        icon: Icons.card_membership,
        color: Colors.purple,
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Recent Downloads",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {},
              child: const Text("View All"),
            ),
          ],
        ),
        const SizedBox(height: 12),
        ...recentDownloads.map((item) => _buildDownloadItem(item)),
      ],
    );
  }

  Widget _buildDownloadItem(_DownloadItem item) {
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
              color: item.color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(item.icon, color: item.color, size: 18),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                Text(
                  "${item.date} • ${item.size}",
                  style: TextStyle(fontSize: 11, color: Colors.grey.shade500),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert, color: Colors.grey.shade400, size: 20),
          ),
        ],
      ),
    );
  }

  // 📝 Request Certificate Section
  Widget _buildRequestCertificate() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [baseColorOne.withOpacity(0.1), baseColorTwo.withOpacity(0.1)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Need a Certificate?",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  "Request official church certificates",
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [baseColorOne, baseColorTwo],
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Text(
                    "Request Now",
                    style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.edit_document, color: baseColorOne, size: 40),
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
      icon: const Icon(Icons.cloud_upload, color: Colors.white),
      label: const Text(
        "Upload Certificate",
        style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white, fontSize: 12),
      ),
    );
  }
}

// 🎨 Custom Painter for Certificate Pattern
class CertificatePatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.05)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    final path = Path();

    // Draw certificate-like borders
    for (double i = 20; i < size.width; i += 60) {
      for (double j = 20; j < size.height; j += 60) {
        path.addRect(Rect.fromLTWH(i, j, 40, 30));
      }
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Supporting Classes
class _CertificateItem {
  final String id;
  final String title;
  final String date;
  final String type;
  final String format;
  final String size;
  final IconData icon;
  final Color color;
  final List<Color> gradient;
  final String imageUrl;
  final int downloads;
  final String? amount;

  _CertificateItem({
    required this.id,
    required this.title,
    required this.date,
    required this.type,
    required this.format,
    required this.size,
    required this.icon,
    required this.color,
    required this.gradient,
    required this.imageUrl,
    required this.downloads,
    this.amount,
  });
}

class _DownloadItem {
  final String title;
  final String date;
  final String size;
  final IconData icon;
  final Color color;

  _DownloadItem({
    required this.title,
    required this.date,
    required this.size,
    required this.icon,
    required this.color,
  });
}

