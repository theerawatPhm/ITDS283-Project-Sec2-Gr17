import 'package:flutter/material.dart';
// อย่าลืม import หน้า find_store_page มาเพื่อลิงก์ไปหานะครับ
import 'find_store_page.dart'; 

class MarketplacePage extends StatefulWidget {
  const MarketplacePage({super.key});

  @override
  State<MarketplacePage> createState() => _MarketplacePageState();
}

class _MarketplacePageState extends State<MarketplacePage> {
  final Color primaryDark = const Color(0xFF4A3B52);
  final Color primaryOrange = const Color.fromARGB(232, 202, 86, 44);
  final Color bgColor = const Color(0xFFF8F8F8);

  // mock data
  final List<Map<String, dynamic>> mockModels = [
    {
      'title': 'Clock',
      'material': 'PLA',
      'time': '1 Day',
      'price': 350,
      'image': 'assets/img/clock.jpg',
    },
    {
      'title': 'Mac Mock Up',
      'material': 'PLA',
      'time': '1 Day',
      'price': 800,
      'image': 'assets/img/mac.jpg',
    },
    {
      'title': 'Car',
      'material': 'Resin',
      'time': '2 Days',
      'price': 500,
      'image': 'assets/img/car.jpg',
    },
    {
      'title': 'Truck',
      'material': 'PLA',
      'time': '1 Day',
      'price': 650,
      'image': 'assets/img/truck.jpg',
    },
    {
      'title': 'Telescope',
      'material': 'PLA',
      'time': '1 Day',
      'price': 450,
      'image': 'assets/img/telescope.jpg',
    },
    {
      'title': 'Rocking Horse',
      'material': 'PLA',
      'time': '1 Day',
      'price': 1200,
      'image': 'assets/img/horse.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: primaryDark, size: 28),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Find Model',
          style: TextStyle(color: primaryDark, fontWeight: FontWeight.bold, fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // ปุ่ม Toggle
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(color: primaryOrange),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: primaryOrange,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Text('Model', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text('Select', style: TextStyle(color: primaryOrange, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),

          //grid show product list
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.75,
              ),
              itemCount: mockModels.length,
              itemBuilder: (context, index) {
                final model = mockModels[index];
                return GestureDetector(
                  onTap: () {
                    //preview
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ModelPreviewPage(modelData: model),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // รูปภาพโมเดล
                        Expanded(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                            child: Container(
                              width: double.infinity,
                              color: Colors.grey.shade100,
                              child: Image.asset(
                                model['image'],
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) => 
                                  const Icon(Icons.image, size: 50, color: Colors.grey),
                              ),
                            ),
                          ),
                        ),
                        // รายละเอียดด้านล่าง
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                model['title'],
                                style: TextStyle(color: primaryDark, fontWeight: FontWeight.bold, fontSize: 14),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Text('Material: ${model['material']}', style: const TextStyle(fontSize: 10, color: Colors.grey)),
                              Text('Time: ${model['time']}', style: const TextStyle(fontSize: 10, color: Colors.grey)),
                              const SizedBox(height: 4),
                              Text(
                                'Price ฿${model['price']}',
                                style: TextStyle(color: primaryOrange, fontWeight: FontWeight.bold, fontSize: 12),
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
          ),
          
          // ตัวเลขบอกจำนวน Items (จำลอง)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              '6/16 Items Viewed',
              style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
            ),
          )
        ],
      ),
    );
  }
}

// =========================================================================
// หน้า Preview Model (productToPurches) จะเด้งขึ้นมาเมื่อกดเลือกโมเดลใน Grid
// =========================================================================

class ModelPreviewPage extends StatelessWidget {
  final Map<String, dynamic> modelData;

  const ModelPreviewPage({super.key, required this.modelData});

  @override
  Widget build(BuildContext context) {
    final Color primaryDark = const Color(0xFF4A3B52);
    final Color primaryOrange = const Color.fromARGB(232, 202, 86, 44);
    final Color bgColor = const Color(0xFFF8F8F8);

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: primaryDark, size: 28),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Preview Model',
          style: TextStyle(color: primaryDark, fontWeight: FontWeight.bold, fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //preview pic
                  Container(
                    width: double.infinity,
                    height: 250,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        modelData['image'],
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) => 
                            const Icon(Icons.inventory_2_outlined, size: 80, color: Colors.grey),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  
                  // หัวข้อ Model Order Details
                  Text('Model Order Details', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: primaryDark)),
                  const SizedBox(height: 16),
                  
                  // ข้อมูล (ดึงค่า Material มาจากที่เลือก ส่วนอื่นจำลองไว้ก่อน)
                  _buildDetailRow('Material:', modelData['material'], primaryDark),
                  _buildDetailRow('Quality:', 'Mid', primaryDark),
                  _buildDetailRow('Scrub:', 'No', primaryDark),
                  _buildDetailRow('Color:', 'Filament Color', primaryDark),
                  _buildDetailRow('File:', 'No', primaryDark),
                  _buildDetailRow('Other:', 'No', primaryDark),
                  
                  const SizedBox(height: 24),
                  
                  // ราคา
                  Text('Price', style: TextStyle(fontSize: 14, color: Colors.grey.shade600)),
                  Text(
                    '฿${modelData['price']}',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: primaryDark),
                  ),
                ],
              ),
            ),
          ),
          
          
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            decoration: BoxDecoration(color: bgColor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.info_outline, color: primaryDark, size: 28),
                    const SizedBox(height: 4),
                    Text('Information', style: TextStyle(color: primaryDark, fontSize: 12)),
                  ],
                ),
                SizedBox(
                  width: 180,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      // go to FindStorePage
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const FindStorePage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryOrange,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Find Store',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  //detail
  Widget _buildDetailRow(String label, String value, Color primaryDark) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(label, style: TextStyle(color: Colors.grey.shade600, fontSize: 14)),
          ),
          Expanded(
            child: Text(value, style: TextStyle(color: primaryDark, fontSize: 14, fontWeight: FontWeight.w500)),
          ),
        ],
      ),
    );
  }
}