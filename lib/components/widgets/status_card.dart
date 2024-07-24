import 'package:flutter/material.dart';
import 'package:hydrophonic/utils/color_palette.dart';

class StatusCard extends StatelessWidget {
  final String title;
  final List<Map<String, String>> statusData;

  const StatusCard({
    Key? key,
    required this.title,
    required this.statusData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: ColorPalette.secondaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: statusData.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3,
              ),
              itemBuilder: (context, index) {
                final data = statusData[index];
                return Column(
                  children: [
                    Text(
                      data['value']!,
                      style: const TextStyle(
                        color: ColorPalette.primaryColor,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      data['label']!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: ColorPalette.secondaryColor,
                        fontSize: 14,
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
