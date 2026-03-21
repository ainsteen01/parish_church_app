import 'package:flutter/material.dart';
import 'package:parish_app/utils/colors.dart';

import '../../../utils/util.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  bool _isAnimationInitialized = false;

  final List<Map<String, dynamic>> events = [
    {
      'id': 1,
      'title': 'Annual Church Feast',
      'type': 'Feast',
      'date': '2024-12-25',
      'time': '8:00 AM - 12:00 PM',
      'location': 'St. Mary\'s Church, Main Hall',
      'description': 'Join us for the annual feast celebration with Holy Mass and cultural programs.',
      'image': 'assets/images/feast.png',
      'organizer': 'Parish Council',
      'attendees': 156,
      'isRegistered': false,
      'color': Colors.orange,
    },
    {
      'id': 2,
      'title': 'Parish Retreat',
      'type': 'Retreat',
      'date': '2024-11-15',
      'time': '9:00 AM - 4:00 PM',
      'location': 'Retreat Center, Hilltop',
      'description': 'A day of spiritual renewal and reflection with guided meditations.',
      'image': 'assets/images/retreat.png',
      'organizer': 'Spiritual Committee',
      'attendees': 89,
      'isRegistered': true,
      'color': Colors.green,
    },
    {
      'id': 3,
      'title': 'Youth Meeting',
      'type': 'Youth meeting',
      'date': '2024-10-20',
      'time': '5:30 PM - 7:30 PM',
      'location': 'Youth Center, Room 101',
      'description': 'Weekly youth gathering with discussions and activities.',
      'image': 'assets/images/youth.png',
      'organizer': 'Youth Ministry',
      'attendees': 45,
      'isRegistered': false,
      'color': Colors.blue,
    },
    {
      'id': 4,
      'title': 'Bible Study Session',
      'type': 'Study',
      'date': '2024-10-18',
      'time': '6:00 PM - 7:30 PM',
      'location': 'Library Hall',
      'description': 'Deep dive into the Gospel of Mark.',
      'image': 'assets/images/bible.png',
      'organizer': 'Bible Study Group',
      'attendees': 34,
      'isRegistered': true,
      'color': Colors.purple,
    },
    {
      'id': 5,
      'title': 'Charity Fundraiser',
      'type': 'Fundraiser',
      'date': '2024-11-05',
      'time': '10:00 AM - 2:00 PM',
      'location': 'Community Center',
      'description': 'Bake sale and crafts fair to support local families.',
      'image': 'assets/images/charity.png',
      'organizer': 'Charity Committee',
      'attendees': 67,
      'isRegistered': false,
      'color': Colors.red,
    },
  ];

  String _searchQuery = '';
  String _selectedFilter = 'All';
  final List<String> _filters = ['All', 'Feast', 'Retreat', 'Youth', 'Study', 'Fundraiser'];

  List<Map<String, dynamic>> get filteredEvents {
    return events.where((event) {
      final matchesSearch = event['title'].toLowerCase().contains(_searchQuery.toLowerCase()) ||
          event['type'].toLowerCase().contains(_searchQuery.toLowerCase()) ||
          event['location'].toLowerCase().contains(_searchQuery.toLowerCase());

      final matchesFilter = _selectedFilter == 'All' ||
          event['type'].toLowerCase().contains(_selectedFilter.toLowerCase());

      return matchesSearch && matchesFilter;
    }).toList();
  }

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
      backgroundColor: const Color(0xFFF8FAFC),
      body: _isAnimationInitialized
          ? FadeTransition(
        opacity: _fadeAnimation,
        child: _buildBody(),
      )
          : _buildBody(),
    );
  }

  Widget _buildBody() {
    return CustomScrollView(
      slivers: [
        // App Bar
        const SliverAppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          floating: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "Events",
            style: TextStyle(
              color: Colors.black87,
              fontSize: 28,
              fontWeight: FontWeight.w700,
            ),
          ),
          actions: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Color(0xFFE8F0FE),
              child: Icon(
                Icons.calendar_month,
                color: Color(0xFF1E88E5),
              ),
            ),
            SizedBox(width: 16),
          ],
        ),

        // Search and Filter Bar
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
          sliver: SliverToBoxAdapter(
            child: Column(
              children: [
                // Search Bar
                Container(
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
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        _searchQuery = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: "Search events...",
                      hintStyle: TextStyle(color: Colors.grey.shade400),
                      prefixIcon: Icon(Icons.search, color: Colors.grey.shade400),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Filter Chips
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _filters.length,
                    itemBuilder: (context, index) {
                      final filter = _filters[index];
                      final isSelected = _selectedFilter == filter;

                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: FilterChip(
                          selected: isSelected,
                          label: Text(filter),
                          onSelected: (selected) {
                            setState(() {
                              _selectedFilter = filter;
                            });
                          },
                          backgroundColor: Colors.white,
                          selectedColor: baseColorTwo.withOpacity(0.2),
                          checkmarkColor: baseColorTwo,
                          labelStyle: TextStyle(
                            color: isSelected ? baseColorTwo : Colors.grey.shade700,
                            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(
                              color: isSelected ? baseColorTwo : Colors.grey.shade200,
                              width: 1,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),

        // Events Count
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverToBoxAdapter(
            child: Text(
              "${filteredEvents.length} events found",
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),

        const SliverPadding(padding: EdgeInsets.only(top: 8)),

        // Events List
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                final event = filteredEvents[index];
                return _buildEventCard(event);
              },
              childCount: filteredEvents.length,
            ),
          ),
        ),

        const SliverPadding(padding: EdgeInsets.only(bottom: 20)),
      ],
    );
  }
  Widget _buildEventCard(Map<String, dynamic> event) {
    final color = event['color'] as Color;
    final eventDate = DateTime.parse(event['date']);

    final day = eventDate.day.toString().padLeft(2, '0');
    final month = _getMonthAbbreviation(eventDate.month);

    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        elevation: 2,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            _showRegistrationDialog(event);
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 🔹 Minimal Date Chip
                    Container(
                      width: 60,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: color.withOpacity(0.08),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Column(
                        children: [
                          Text(
                            day,
                            style: TextStyle(
                              color: color,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            month,
                            style: TextStyle(
                              color: color,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 14),

                    // 🔹 Content
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Type + Title
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 3),
                                decoration: BoxDecoration(
                                  color: color.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  event['type'],
                                  style: TextStyle(
                                    color: color,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 6),

                          Text(
                            event['title'],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),

                          const SizedBox(height: 8),

                          // Time + Location
                          Row(
                            children: [
                              Icon(Icons.access_time_rounded,
                                  size: 14, color: Colors.grey.shade500),
                              const SizedBox(width: 4),
                              Text(
                                event['time'],
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey.shade600),
                              ),
                            ],
                          ),

                          const SizedBox(height: 4),

                          Row(
                            children: [
                              Icon(Icons.location_on_outlined,
                                  size: 14, color: Colors.grey.shade500),
                              const SizedBox(width: 4),
                              Expanded(
                                child: Text(
                                  event['location'],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey.shade600,
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

                const SizedBox(height: 16),

                // 🔹 Bottom Row (Cleaner)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Organizer
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 10,
                          backgroundColor: Colors.grey.shade200,
                          child: Icon(Icons.person,
                              size: 12, color: Colors.grey.shade600),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          event['organizer'],
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        // Attendees
                        Row(
                          children: [
                            Icon(Icons.people_outline,
                                size: 14, color: Colors.grey.shade600),
                            const SizedBox(width: 4),
                            Text(
                              "${event['attendees']}",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(width: 12),

                        // Button
                        event['isRegistered']
                            ? Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: const [
                              Icon(Icons.check, size: 14),
                              SizedBox(width: 4),
                              Text(
                                "Registered",
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        )
                            : FilledButton(
                          onPressed: () =>
                              _showRegistrationDialog(event),
                          style: FilledButton.styleFrom(
                            backgroundColor: color,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            "Register",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  // Widget _buildEventCard(Map<String, dynamic> event) {
  //   final eventDate = DateTime.parse(event['date']);
  //   final day = eventDate.day.toString().padLeft(2, '0');
  //   final month = _getMonthAbbreviation(eventDate.month);
  //   final year = eventDate.year;
  //
  //   return Container(
  //     margin: const EdgeInsets.only(bottom: 16),
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.circular(20),
  //       boxShadow: [
  //         BoxShadow(
  //           color: Colors.grey.withOpacity(0.1),
  //           blurRadius: 10,
  //           offset: const Offset(0, 4),
  //         ),
  //       ],
  //     ),
  //     child: Column(
  //       children: [
  //         // Main Card Content
  //         Padding(
  //           padding: const EdgeInsets.all(16),
  //           child: Row(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               // Date Box
  //               Container(
  //                 width: 70,
  //                 height: 80,
  //                 decoration: BoxDecoration(
  //                   gradient: LinearGradient(
  //                     begin: Alignment.topLeft,
  //                     end: Alignment.bottomRight,
  //                     colors: [
  //                       (event['color'] as Color).withOpacity(0.1),
  //                       (event['color'] as Color).withOpacity(0.2),
  //                     ],
  //                   ),
  //                   borderRadius: BorderRadius.circular(16),
  //                   border: Border.all(
  //                     color: (event['color'] as Color).withOpacity(0.2),
  //                     width: 1,
  //                   ),
  //                 ),
  //                 child: Column(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: [
  //                     Text(
  //                       day,
  //                       style: TextStyle(
  //                         color: event['color'],
  //                         fontSize: 28,
  //                         fontWeight: FontWeight.w700,
  //                       ),
  //                     ),
  //                     Text(
  //                       month,
  //                       style: TextStyle(
  //                         color: event['color'],
  //                         fontSize: 14,
  //                         fontWeight: FontWeight.w600,
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //
  //               const SizedBox(width: 16),
  //
  //               // Event Details
  //               Expanded(
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     // Event Type Badge
  //                     Container(
  //                       padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
  //                       decoration: BoxDecoration(
  //                         color: (event['color'] as Color).withOpacity(0.1),
  //                         borderRadius: BorderRadius.circular(12),
  //                       ),
  //                       child: Text(
  //                         event['type'],
  //                         style: TextStyle(
  //                           color: event['color'],
  //                           fontSize: 11,
  //                           fontWeight: FontWeight.w600,
  //                         ),
  //                       ),
  //                     ),
  //
  //                     const SizedBox(height: 8),
  //
  //                     // Title
  //                     Text(
  //                       event['title'],
  //                       style: const TextStyle(
  //                         color: Colors.black87,
  //                         fontSize: 16,
  //                         fontWeight: FontWeight.w700,
  //                       ),
  //                       maxLines: 2,
  //                       overflow: TextOverflow.ellipsis,
  //                     ),
  //
  //                     const SizedBox(height: 8),
  //
  //                     // Time
  //                     Row(
  //                       children: [
  //                         Icon(
  //                           Icons.access_time,
  //                           size: 14,
  //                           color: Colors.grey.shade500,
  //                         ),
  //                         const SizedBox(width: 4),
  //                         Text(
  //                           event['time'],
  //                           style: TextStyle(
  //                             color: Colors.grey.shade600,
  //                             fontSize: 12,
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //
  //                     const SizedBox(height: 4),
  //
  //                     // Location
  //                     Row(
  //                       children: [
  //                         Icon(
  //                           Icons.location_on_outlined,
  //                           size: 14,
  //                           color: Colors.grey.shade500,
  //                         ),
  //                         const SizedBox(width: 4),
  //                         Expanded(
  //                           child: Text(
  //                             event['location'],
  //                             style: TextStyle(
  //                               color: Colors.grey.shade600,
  //                               fontSize: 12,
  //                             ),
  //                             maxLines: 1,
  //                             overflow: TextOverflow.ellipsis,
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //
  //         // Divider
  //         Divider(
  //           height: 1,
  //           indent: 16,
  //           endIndent: 16,
  //           color: Colors.grey.shade200,
  //         ),
  //
  //         // Footer with Organizer and Register Button
  //         Padding(
  //           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               // Organizer
  //               Row(
  //                 children: [
  //                   Container(
  //                     padding: const EdgeInsets.all(4),
  //                     decoration: BoxDecoration(
  //                       color: Colors.grey.shade100,
  //                       shape: BoxShape.circle,
  //                     ),
  //                     child: Icon(
  //                       Icons.person_outline,
  //                       size: 14,
  //                       color: Colors.grey.shade600,
  //                     ),
  //                   ),
  //                   const SizedBox(width: 6),
  //
  //                   Text(overflow: TextOverflow.ellipsis,
  //                     event['organizer'],
  //                     style: TextStyle(
  //                       color: Colors.grey.shade700,
  //                       fontSize: 10,
  //                       fontWeight: FontWeight.w500,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //
  //               // Attendees Count and Register Button
  //               Row(
  //                 children: [
  //                   // Attendees
  //                   Container(
  //                     padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
  //                     decoration: BoxDecoration(
  //                       color: Colors.grey.shade100,
  //                       borderRadius: BorderRadius.circular(12),
  //                     ),
  //                     child: Row(
  //                       children: [
  //                         Icon(
  //                           Icons.people_outline,
  //                           size: 12,
  //                           color: Colors.grey.shade600,
  //                         ),
  //                         const SizedBox(width: 4),
  //                         Text(
  //                           "${event['attendees']}",
  //                           style: TextStyle(
  //                             color: Colors.grey.shade700,
  //                             fontSize: 11,
  //                             fontWeight: FontWeight.w600,
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //
  //                   const SizedBox(width: 12),
  //
  //                   // Register Button
  //                   if (event['isRegistered'])
  //                     Container(
  //                       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
  //                       decoration: BoxDecoration(
  //                         color: Colors.green.shade50,
  //                         borderRadius: BorderRadius.circular(20),
  //                         border: Border.all(color: Colors.green.shade200),
  //                       ),
  //                       child: Row(
  //                         mainAxisSize: MainAxisSize.min,
  //                         children: [
  //                           Icon(
  //                             Icons.check_circle,
  //                             size: 14,
  //                             color: Colors.green.shade600,
  //                           ),
  //                           const SizedBox(width: 4),
  //                           Text(
  //                             "Registered",
  //                             style: TextStyle(
  //                               color: Colors.green.shade700,
  //                               fontSize: 12,
  //                               fontWeight: FontWeight.w600,
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     )
  //                   else
  //                     ElevatedButton(
  //                       onPressed: () {
  //                         _showRegistrationDialog(event);
  //                       },
  //                       style: ElevatedButton.styleFrom(
  //                         backgroundColor: (event['color'] as Color),
  //                         foregroundColor: Colors.white,
  //                         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  //                         shape: RoundedRectangleBorder(
  //                           borderRadius: BorderRadius.circular(20),
  //                         ),
  //                         elevation: 0,
  //                         minimumSize: const Size(80, 32),
  //                       ),
  //                       child: const Text(
  //                         "Register",
  //                         style: TextStyle(
  //                           fontSize: 12,
  //                           fontWeight: FontWeight.w600,
  //                         ),
  //                       ),
  //                     ),
  //                 ],
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  String _getMonthAbbreviation(int month) {
    const months = ['JAN', 'FEB', 'MAR', 'APR', 'MAY', 'JUN', 'JUL', 'AUG', 'SEP', 'OCT', 'NOV', 'DEC'];
    return months[month - 1];
  }

  void _showRegistrationDialog(Map<String, dynamic> event) {
    final Color color = event['color'] as Color;
    final String title = event['title'];
    final String date = event['date'];
    final String time = event['time'];
    final String location = event['location'];

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Dialog(
          elevation: 0,
          insetPadding: const EdgeInsets.symmetric(horizontal: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // 🔹 Icon Header
                Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.12),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.event_available_rounded,
                    color: color,
                    size: 36,
                  ),
                ),

                const SizedBox(height: 20),

                // 🔹 Title
                Text(
                  "Register for Event",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: color,
                  ),
                ),

                const SizedBox(height: 6),

                // 🔹 Event Name
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 20),

                // 🔹 Info Card
                Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Column(
                    children: [
                      _modernInfoRow(Icons.calendar_today_rounded, date),
                      const SizedBox(height: 10),
                      _modernInfoRow(Icons.access_time_rounded, time),
                      const SizedBox(height: 10),
                      _modernInfoRow(Icons.location_on_rounded, location),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // 🔹 Buttons
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () => Navigator.pop(context),
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: const Text("Cancel"),
                      ),
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: FilledButton(
                        onPressed: () {
                          Navigator.pop(context);

                          setState(() {
                            event['isRegistered'] = true;
                            event['attendees'] =
                                (event['attendees'] as int) + 1;
                          });

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Registered for $title 🎉"),
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          );
                        },
                        style: FilledButton.styleFrom(
                          backgroundColor: color,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: const Text("Confirm"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  /// 🔹 Modern info row
  Widget _modernInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.grey.shade700),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade800,
            ),
          ),
        ),
      ],
    );
  }
  // void _showRegistrationDialog(Map<String, dynamic> event) {
  //   showDialog(
  //     context: context,
  //     builder: (context) => Dialog(
  //       backgroundColor: Colors.transparent,
  //       child: Container(
  //         padding: const EdgeInsets.all(24),
  //         decoration: BoxDecoration(
  //           color: Colors.white,
  //           borderRadius: BorderRadius.circular(24),
  //         ),
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             Container(
  //               padding: const EdgeInsets.all(16),
  //               decoration: BoxDecoration(
  //                 color: (event['color'] as Color).withOpacity(0.1),
  //                 shape: BoxShape.circle,
  //               ),
  //               child: Icon(
  //                 Icons.event_available,
  //                 color: event['color'],
  //                 size: 40,
  //               ),
  //             ),
  //             const SizedBox(height: 16),
  //             Text(
  //               "Register for Event",
  //               style: TextStyle(
  //                 fontSize: 20,
  //                 fontWeight: FontWeight.w700,
  //                 color: event['color'],
  //               ),
  //             ),
  //             const SizedBox(height: 8),
  //             Text(
  //               event['title'],
  //               style: const TextStyle(
  //                 fontSize: 16,
  //                 fontWeight: FontWeight.w600,
  //               ),
  //             ),
  //             const SizedBox(height: 16),
  //             Container(
  //               padding: const EdgeInsets.all(16),
  //               decoration: BoxDecoration(
  //                 color: Colors.grey.shade50,
  //                 borderRadius: BorderRadius.circular(16),
  //               ),
  //               child: Column(
  //                 children: [
  //                   _buildInfoRow(Icons.calendar_today, "Date: ${event['date']}"),
  //                   const SizedBox(height: 8),
  //                   _buildInfoRow(Icons.access_time, "Time: ${event['time']}"),
  //                   const SizedBox(height: 8),
  //                   _buildInfoRow(Icons.location_on, "Location: ${event['location']}"),
  //                 ],
  //               ),
  //             ),
  //             const SizedBox(height: 20),
  //             Row(
  //               children: [
  //                 Expanded(
  //                   child: OutlinedButton(
  //                     onPressed: () => Navigator.pop(context),
  //                     style: OutlinedButton.styleFrom(
  //                       padding: const EdgeInsets.symmetric(vertical: 14),
  //                       shape: RoundedRectangleBorder(
  //                         borderRadius: BorderRadius.circular(12),
  //                       ),
  //                     ),
  //                     child: const Text("Cancel"),
  //                   ),
  //                 ),
  //                 const SizedBox(width: 12),
  //                 Expanded(
  //                   child: ElevatedButton(
  //                     onPressed: () {
  //                       Navigator.pop(context);
  //                       setState(() {
  //                         event['isRegistered'] = true;
  //                         event['attendees'] = (event['attendees'] as int) + 1;
  //                       });
  //                       ScaffoldMessenger.of(context).showSnackBar(
  //                         SnackBar(
  //                           content: Text("Successfully registered for ${event['title']}"),
  //                           backgroundColor: Colors.green,
  //                           behavior: SnackBarBehavior.floating,
  //                           shape: RoundedRectangleBorder(
  //                             borderRadius: BorderRadius.circular(10),
  //                           ),
  //                         ),
  //                       );
  //                     },
  //                     style: ElevatedButton.styleFrom(
  //                       backgroundColor: event['color'],
  //                       foregroundColor: Colors.white,
  //                       padding: const EdgeInsets.symmetric(vertical: 14),
  //                       shape: RoundedRectangleBorder(
  //                         borderRadius: BorderRadius.circular(12),
  //                       ),
  //                     ),
  //                     child: const Text("Confirm"),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
  //
  // Widget _buildInfoRow(IconData icon, String text) {
  //   return Row(
  //     children: [
  //       Icon(icon, size: 16, color: Colors.grey.shade600),
  //       const SizedBox(width: 8),
  //       Expanded(
  //         child: Text(
  //           text,
  //           style: TextStyle(
  //             color: Colors.grey.shade700,
  //             fontSize: 13,
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }
}