import 'package:flutter/material.dart';

class BookingMockScreen extends StatelessWidget {
  const BookingMockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final hotels = [
      {
        'name': 'aNhill Boutique',
        'rating': 9.5,
        'reviewCount': 95,
        'location': 'Huế',
        'distance': '0.6km',
        'desc': '1 suite riêng tư · 1 giường',
        'price': 109.0,
        'image': 'assets/images/hotel1.jpg',
        'breakfast': true,
      },
      {
        'name': 'An Nam Hue Boutique',
        'rating': 9.2,
        'reviewCount': 34,
        'location': 'Cư Chinh',
        'distance': '0.9km',
        'desc': '1 phòng khách sạn · 1 giường',
        'price': 20.0,
        'image': 'assets/images/hotel3.jpg',
        'breakfast': true,
      },
      {
        'name': 'Huế Jade Hill Villa',
        'rating': 8.0,
        'reviewCount': 1,
        'location': 'Cư Chinh',
        'distance': '1.3km',
        'desc':
            '1 biệt thự nguyên căn – 1.000 m²:\n4 giường · 3 phòng ngủ · 1 phòng khách · 3 phòng tắm',
        'price': 285.0,
        'image': 'assets/images/hotel2.jpg',
        'breakfast': false,
      },
      {
        'name': 'Pilgrimage Village Boutique Resort',
        'rating': 9.4,
        'reviewCount': 210,
        'location': 'Thủy Xuân',
        'distance': '2.5km',
        'desc': '1 phòng resort cao cấp · 1 giường đôi',
        'price': 180.0,
        'image': 'assets/images/hotel1.jpg',
        'breakfast': true,
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: const Color(0xFF003580),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("13:20", style: TextStyle(color: Colors.white)),
                  Row(
                    children: [
                      Icon(
                        Icons.signal_cellular_alt,
                        color: Colors.white,
                        size: 16,
                      ),
                      SizedBox(width: 4),
                      Icon(Icons.wifi, color: Colors.white, size: 16),
                      SizedBox(width: 4),
                      Icon(Icons.battery_full, color: Colors.white, size: 16),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              color: const Color(0xFF003580),
              padding: const EdgeInsets.all(10),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.orange, width: 2),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.arrow_back),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        "Xung quanh vị trí hiện tại",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                    Text(
                      "23 thg 10 – 24 thg 10",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  _TopButton(icon: Icons.sort, text: "Sắp xếp"),
                  _TopButton(icon: Icons.tune, text: "Lọc"),
                  _TopButton(icon: Icons.map_outlined, text: "Bản đồ"),
                ],
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(left: 12, bottom: 4),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "757 chỗ nghỉ",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
              ),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: hotels.length,
                itemBuilder: (context, index) {
                  final hotel = hotels[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    child: index < 2
                        ? SimpleHotelCard(
                            imageUrl: hotel['image'] as String,
                            title: hotel['name'] as String,
                            rating: hotel['rating'] as double,
                            reviewCount: hotel['reviewCount'] as int,
                            description: hotel['desc'] as String,
                            location: hotel['location'] as String,
                            distance: hotel['distance'] as String,
                            price: hotel['price'] as double,
                          )
                        : HotelCard(
                            imageUrl: hotel['image'] as String,
                            title: hotel['name'] as String,
                            rating: hotel['rating'] as double,
                            reviewCount: hotel['reviewCount'] as int,
                            description: hotel['desc'] as String,
                            location: hotel['location'] as String,
                            distance: hotel['distance'] as String,
                            price: hotel['price'] as double,
                            breakfast: hotel['breakfast'] as bool,
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
}

class _TopButton extends StatelessWidget {
  final IconData icon;
  final String text;

  const _TopButton({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18),
        const SizedBox(width: 4),
        Text(
          text,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}

class SimpleHotelCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final double rating;
  final int reviewCount;
  final String description;
  final String location;
  final String distance;
  final double price;

  const SimpleHotelCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.rating,
    required this.reviewCount,
    required this.description,
    required this.location,
    required this.distance,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return _BaseCard(
      imageUrl: imageUrl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _TitleRow(title),
          _RatingRow(rating, reviewCount),
          _LocationRow(location, distance),
          Text(
            description,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          _Price(price),
        ],
      ),
    );
  }
}


class HotelCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final double rating;
  final int reviewCount;
  final String description;
  final String location;
  final String distance;
  final double price;
  final bool breakfast;

  const HotelCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.rating,
    required this.reviewCount,
    required this.description,
    required this.location,
    required this.distance,
    required this.price,
    required this.breakfast,
  });

  @override
  Widget build(BuildContext context) {
    return _BaseCard(
      imageUrl: imageUrl,
      badge: breakfast ? "Bao bữa sáng" : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _TitleRow(title),
          _RatingRow(rating, reviewCount),
          _LocationRow(location, distance),
          Text(
            description,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          const Text(
            "Chỉ còn 1 căn với giá này trên Booking.com",
            style: TextStyle(fontSize: 11, color: Colors.red),
          ),
          const Text(
            "✔ Không cần thanh toán trước",
            style: TextStyle(fontSize: 11, color: Colors.green),
          ),
          _Price(price),
        ],
      ),
    );
  }
}


class _BaseCard extends StatelessWidget {
  final String imageUrl;
  final Widget child;
  final String? badge;

  const _BaseCard({required this.imageUrl, required this.child, this.badge});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
                child: Image.asset(
                  imageUrl,
                  width: 120,
                  height: 140,
                  fit: BoxFit.cover,
                ),
              ),
              if (badge != null)
                Positioned(
                  top: 6,
                  left: 6,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      badge!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          Expanded(
            child: Padding(padding: const EdgeInsets.all(8), child: child),
          ),
        ],
      ),
    );
  }
}

Widget _TitleRow(String title) => Row(
  children: [
    Expanded(
      child: Text(
        title,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),
    ),
    const Icon(Icons.favorite_border, size: 18),
  ],
);

Widget _RatingRow(double rating, int reviews) => Row(
  children: [
    Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        rating.toStringAsFixed(1),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    const SizedBox(width: 6),
    const Text(
      "Xuất sắc",
      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
    ),
    const SizedBox(width: 4),
    Text(
      "· $reviews đánh giá",
      style: const TextStyle(fontSize: 11, color: Colors.grey),
    ),
  ],
);

Widget _LocationRow(String location, String distance) => Row(
  children: [
    const Icon(Icons.location_on, size: 14, color: Colors.grey),
    const SizedBox(width: 2),
    Text(
      "$location · Cách bạn $distance",
      style: const TextStyle(fontSize: 12, color: Colors.black87),
    ),
  ],
);

Widget _Price(double price) => Padding(
  padding: const EdgeInsets.only(top: 6),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "US\$${price.toInt()}",
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      const Text(
        "Đã bao gồm thuế và phí",
        style: TextStyle(fontSize: 11, color: Colors.grey),
      ),
    ],
  ),
);
