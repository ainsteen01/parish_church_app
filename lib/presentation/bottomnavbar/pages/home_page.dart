import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import '../../../utils/routes.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  bool _isAnimationInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
  }

  void _initializeAnimations() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );

    _isAnimationInitialized = true;
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: SafeArea(
        child: _isAnimationInitialized
            ? FadeTransition(
          opacity: _fadeAnimation,
          child: _buildBody(),
        )
            : _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return CustomScrollView(
      slivers: [
        // App Bar
        SliverAppBar(
          floating: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Good Morning! 👋",
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 2),
                  const Text(
                    "Welcome to Test App",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            // Notification with badge
            Stack(
              children: [
                IconButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: const Text("No Notifications available")));
                  },
                  icon: Icon(
                    Icons.notifications_outlined,
                    color: Colors.grey.shade700,
                    size: 28,
                  ),
                ),
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 8),
            // Profile Avatar
            Container(
              margin: const EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [baseColorOne, baseColorTwo],
                ),
              ),
              child: InkWell(
                onTap: (){
                  Navigator.pushNamed(context, profilePageRoute);
                },
                child: const CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.transparent,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 22,
                  ),
                ),
              ),
            ),
          ],
        ),

        // Main Content
        SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              // Today's Timings Card
              _buildTimingsCard(),

              const SizedBox(height: 24),

              // Today's Events Section
              _buildEventsSection(),

              const SizedBox(height: 24),

              // Latest Announcements Section
              _buildAnnouncementsSection(),

              const SizedBox(height: 20),
            ]),
          ),
        ),
      ],
    );
  }
  Widget _buildTimingsCard() {
    final  times = ["6:00 AM", "7:00 AM", "8:00 AM", "9:00 AM", "10:00 AM", "11:00 AM"];
    final periods = ["Dawn", "Morning", "Morning", "Late Morning", "Mid Day", "Late Morning"];
    final icons = [
      Icons.wb_twilight,
      Icons.wb_sunny,
      Icons.wb_sunny,
      Icons.wb_sunny,
      Icons.sunny,
      Icons.wb_sunny,
    ];

    return Container(
      height: 250,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF4A3AFF),
            Color(0xFF6A5AE0),
            Color(0xFFB1AFFF),
          ],
          stops: [0.1, 0.5, 1],
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF6A5AE0).withOpacity(0.35),
            blurRadius: 25,
            offset: const Offset(0, 12),
          ),
        ],
      ),

      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 🔹 Header
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.18),
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    splashImagePath,
                    color: Colors.white,
                    width: 22,
                    height: 22,
                  ),
                ),
                const SizedBox(width: 12),
                const Text(
                  "Today's Timings",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.3,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 18),

            /// 🔹 Time Slots
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: times.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 105,
                    margin: const EdgeInsets.only(right: 14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      color: Colors.white.withOpacity(0.12),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.25),
                        width: 1,
                      ),
                    ),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        /// Icon
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withOpacity(0.2),
                          ),
                          child: Icon(
                            icons[index],
                            color: Colors.white,
                            size: 24,
                          ),
                        ),

                        const SizedBox(height: 10),

                        /// Time
                        Text(
                          times[index],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),

                        const SizedBox(height: 4),

                        /// Label
                        Text(
                          periods[index],
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.75),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  // Widget _buildTimingsCard() {
  //   return Container(
  //     height: 240,
  //     width: double.infinity,
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(24),
  //       gradient: LinearGradient(
  //         begin: Alignment.centerLeft,
  //         end: Alignment.bottomRight,
  //         colors: [baseColorOne, baseColorTwo],
  //       ),
  //       boxShadow: [
  //         BoxShadow(
  //           color: baseColorTwo.withOpacity(0.3),
  //           blurRadius: 20,
  //           offset: const Offset(0, 8),
  //         ),
  //       ],
  //     ),
  //     child: Padding(
  //       padding: const EdgeInsets.all(16),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           // Header
  //           Row(
  //             children: [
  //               Container(
  //                 padding: const EdgeInsets.all(10),
  //                 decoration: BoxDecoration(
  //                   color: Colors.white.withOpacity(0.2),
  //                   shape: BoxShape.circle,
  //                 ),
  //                 child: Image.asset(
  //                   splashImagePath,
  //                   color: Colors.white,
  //                   width: 24,
  //                   height: 24,
  //                 ),
  //               ),
  //               const SizedBox(width: 12),
  //               const Text(
  //                 "Today's Timings",
  //                 style: TextStyle(
  //                   color: Colors.white,
  //                   fontSize: 18,
  //                   fontWeight: FontWeight.w600,
  //                 ),
  //               ),
  //             ],
  //           ),
  //
  //           const SizedBox(height: 16),
  //
  //           // Time Slots
  //           Expanded(
  //             child: ListView.builder(
  //               scrollDirection: Axis.horizontal,
  //               itemCount: 6,
  //               itemBuilder: (context, index) {
  //                 final times = ["6:00 AM", "7:00 AM", "8:00 AM", "9:00 AM", "10:00 AM", "11:00 AM"];
  //                 final periods = ["Dawn", "Morning", "Morning", "Late Morning", "Mid Day", "Late Morning"];
  //                 final icons = [Icons.wb_twighlight, Icons.wb_sunny, Icons.wb_sunny, Icons.wb_sunny, Icons.sunny, Icons.wb_sunny];
  //
  //                 return Container(
  //                   width: 100,
  //                   margin: const EdgeInsets.only(right: 12),
  //                   decoration: BoxDecoration(
  //                     color: Colors.white.withOpacity(0.15),
  //                     borderRadius: BorderRadius.circular(20),
  //                     border: Border.all(
  //                       color: Colors.white.withOpacity(0.1),
  //                       width: 1,
  //                     ),
  //                   ),
  //                   child: Column(
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     children: [
  //                       Icon(
  //                         icons[index],
  //                         color: Colors.white,
  //                         size: 28,
  //                       ),
  //                       const SizedBox(height: 8),
  //                       Text(
  //                         times[index],
  //                         style: const TextStyle(
  //                           color: Colors.white,
  //                           fontSize: 16,
  //                           fontWeight: FontWeight.w700,
  //                         ),
  //                       ),
  //                       const SizedBox(height: 4),
  //                       Text(
  //                         periods[index],
  //                         style: TextStyle(
  //                           color: Colors.white.withOpacity(0.8),
  //                           fontSize: 12,
  //                           fontWeight: FontWeight.w400,
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 );
  //               },
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
  Widget _buildEventsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Today's Events",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: baseColorOne.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Text(
                      "See More",
                      style: TextStyle(
                        color: baseColorTwo,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                      color: baseColorTwo,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),

        // Events List
        SizedBox(
          height: 140,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              final events = [
                {"title": "Prayer Meeting", "time": "7:00 AM", "color": Colors.blue},
                {"title": "Bible Study", "time": "9:00 AM", "color": Colors.green},
                {"title": "Choir Practice", "time": "4:00 PM", "color": Colors.orange},
                {"title": "Youth Group", "time": "6:00 PM", "color": Colors.purple},
                {"title": "Evening Service", "time": "7:30 PM", "color": Colors.red},
              ];

              return Container(
                width: 160,
                margin: const EdgeInsets.only(right: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: (events[index]["color"] as Color).withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.event_available,
                          color: events[index]["color"] as Color,
                          size: 20,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        events[index]["title"].toString(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        events[index]["time"].toString(),
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildAnnouncementsSection() {
    final announcements = [
      {
        "title": "Sunday Service Schedule",
        "description": "Join us for Sunday service at 9:00 AM",
        "time": "2 hours ago",
        "icon": Icons.church,
        "color": const Color(0xFF6A5AE0),
      },
      {
        "title": "Community Outreach Program",
        "description": "Volunteers needed for this weekend",
        "time": "5 hours ago",
        "icon": Icons.volunteer_activism,
        "color": const Color(0xFFFF7A18),
      },
      {
        "title": "Bible Study Group",
        "description": "New session starts this Wednesday",
        "time": "Yesterday",
        "icon": Icons.menu_book,
        "color": const Color(0xFF00C9A7),
      },
      {
        "title": "Church Maintenance",
        "description": "Building will be closed on Monday",
        "time": "Yesterday",
        "icon": Icons.build,
        "color": const Color(0xFFFF4D6D),
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Latest Announcements",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),

        const SizedBox(height: 16),

        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: announcements.length,
          itemBuilder: (context, index) {
            final item = announcements[index];
            final Color color = item["color"] as Color;

            return Container(
              margin: const EdgeInsets.only(bottom: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: color.withOpacity(0.15),
                    blurRadius: 16,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),

              child: Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  border: Border(
                    left: BorderSide(
                      color: color.withAlpha(50),
                      width: 4,
                    ),
                  ),
                ),

                child: Row(
                  children: [
                    /// 🔹 Icon with gradient feel
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            color.withOpacity(0.8),
                            color.withOpacity(0.5),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Icon(
                        item["icon"] as IconData,
                        color: Colors.white,
                        size: 22,
                      ),
                    ),

                    const SizedBox(width: 14),

                    /// 🔹 Text Content
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// Title + Time
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  item["title"].toString(),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),

                              const SizedBox(width: 8),

                              Text(
                                item["time"].toString(),
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.grey.shade500,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 6),

                          /// Description
                          Text(
                            item["description"].toString(),
                            style: TextStyle(
                              fontSize: 13.5,
                              color: Colors.grey.shade600,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
  // Widget _buildAnnouncementsSection() {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       const Text(
  //         "Latest Announcements",
  //         style: TextStyle(
  //           color: Colors.black,
  //           fontSize: 20,
  //           fontWeight: FontWeight.w700,
  //         ),
  //       ),
  //
  //       const SizedBox(height: 16),
  //
  //       // Announcements List
  //       ListView.builder(
  //         shrinkWrap: true,
  //         physics: const NeverScrollableScrollPhysics(),
  //         itemCount: 4,
  //         itemBuilder: (context, index) {
  //           final announcements = [
  //             {
  //               "title": "Sunday Service Schedule",
  //               "description": "Join us for Sunday service at 9:00 AM",
  //               "time": "2 hours ago",
  //               "icon": Icons.church,
  //               "color": baseColorOne,
  //             },
  //             {
  //               "title": "Community Outreach Program",
  //               "description": "Volunteers needed for this weekend",
  //               "time": "5 hours ago",
  //               "icon": Icons.volunteer_activism,
  //               "color": baseColorTwo,
  //             },
  //             {
  //               "title": "Bible Study Group",
  //               "description": "New session starts this Wednesday",
  //               "time": "Yesterday",
  //               "icon": Icons.menu_book,
  //               "color": Colors.green,
  //             },
  //             {
  //               "title": "Church Maintenance",
  //               "description": "Building will be closed on Monday",
  //               "time": "Yesterday",
  //               "icon": Icons.build,
  //               "color": Colors.orange,
  //             },
  //           ];
  //
  //           return Container(
  //             margin: const EdgeInsets.only(bottom: 12),
  //             padding: const EdgeInsets.all(12),
  //             decoration: BoxDecoration(
  //               color: Colors.white,
  //               borderRadius: BorderRadius.circular(16),
  //               boxShadow: [
  //                 BoxShadow(
  //                   color: Colors.grey.withOpacity(0.1),
  //                   blurRadius: 8,
  //                   offset: const Offset(0, 2),
  //                 ),
  //               ],
  //             ),
  //             child: Row(
  //               children: [
  //                 Container(
  //                   padding: const EdgeInsets.all(12),
  //                   decoration: BoxDecoration(
  //                     color: (announcements[index]["color"] as Color).withOpacity(0.1),
  //                     borderRadius: BorderRadius.circular(12),
  //                   ),
  //                   child: Icon(
  //                     announcements[index]["icon"] as IconData,
  //                     color: announcements[index]["color"] as Color,
  //                     size: 24,
  //                   ),
  //                 ),
  //                 const SizedBox(width: 16),
  //                 Expanded(
  //                   child: Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                         children: [
  //                           Expanded(
  //                             child: Text(
  //                               announcements[index]["title"].toString(),
  //                               style: const TextStyle(
  //                                 color: Colors.black,
  //                                 fontSize: 16,
  //                                 fontWeight: FontWeight.w600,
  //                               ),
  //                               maxLines: 1,
  //                               overflow: TextOverflow.ellipsis,
  //                             ),
  //                           ),
  //                           Container(
  //                             padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
  //                             decoration: BoxDecoration(
  //                               color: Colors.grey.shade100,
  //                               borderRadius: BorderRadius.circular(12),
  //                             ),
  //                             child: Text(
  //                               announcements[index]["time"]!.toString(),
  //                               style: TextStyle(
  //                                 color: Colors.grey.shade600,
  //                                 fontSize: 10,
  //                                 fontWeight: FontWeight.w500,
  //                               ),
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                       const SizedBox(height: 4),
  //                       Text(
  //                         announcements[index]["description"]!.toString(),
  //                         style: TextStyle(
  //                           color: Colors.grey.shade600,
  //                           fontSize: 14,
  //                         ),
  //                         maxLines: 2,
  //                         overflow: TextOverflow.ellipsis,
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           );
  //         },
  //       ),
  //     ],
  //   );
  // }
}