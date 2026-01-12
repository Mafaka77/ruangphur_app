import 'package:flutter/material.dart';
import 'package:ruang_phur/constant/my_appbar.dart';
import 'package:ruang_phur/constant/sized_box.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                'About Us',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                  'Ruangphur is a dedicated bereavement support initiative managed by the Directorate of Social Welfare & Tribal Affairs, Government of Mizoram. It is designed to ease the burden on grieving families by providing organized, dignified, and affordable transportation services for deceased individuals—from the place of death to the place of burial or residence. A key feature of the Ruangphur service is the refund of motor hire charges, offering financial relief to families during times of loss. The transportation costs incurred while hiring a vehicle to transport the deceased can be reimbursed, ensuring families are not left with additional expenses during an already difficult time. This support is available for transportation covering distances of 20 kilometers or more, whether the journey begins at a hospital, home, airport, or any other location. The application process is simple and accessible. Families or their representatives can apply directly through this portal, eliminating the need for in-person visits to government offices. The refund amount is calculated based on rates set by the State Transport Authority, Mizoram, ensuring fairness, consistency, and transparency. Through Ruangphur, the Government of Mizoram demonstrates its strong commitment to the welfare of its citizens, extending support and compassion when it is most needed. This initiative reflects the government’s vision of building Mizoram into a true Welfare State, where care, dignity, and empathy are integral to governance. For more details and to submit an application, please visit: https://socialwelfare.mizoram.gov.in'),
              sizedBoxHeight(30),
            ],
          ),
        ),
      ),
    );
  }
}
