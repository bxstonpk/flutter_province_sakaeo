// ignore_for_file: file_names, prefer_const_constructors, unused_field, must_call_super, prefer_const_literals_to_create_immutables, non_constant_identifier_names, unused_element, prefer_interpolation_to_compose_strings, sort_child_properties_last, unnecessary_import

import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  void initState() {
    _tabController = TabController(
      length: 9,
      vsync: this,
      initialIndex: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Color.fromARGB(255, 10, 30, 255),
        title: Text(
          'Sa Kaeo Province',
          style: GoogleFonts.kanit(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              exit(0);
            },
            icon: Icon(
              Icons.exit_to_app_outlined,
            ),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabAlignment: TabAlignment.start,
          labelColor: Colors.white,
          unselectedLabelColor: Color.fromARGB(113, 224, 224, 224),
          indicatorColor: Colors.yellow,
          indicatorWeight: 5.0,
          tabs: [
            TabBarTitle('อำเภอเมืองสระแก้ว'),
            TabBarTitle('อำเภอคลองหาด'),
            TabBarTitle('อำเภอตาพระยา'),
            TabBarTitle('อำเภอวังน้ำเย็น'),
            TabBarTitle('อำเภอวัฒนานคร'),
            TabBarTitle('อำเภออรัญประเทศ'),
            TabBarTitle('อำเภอเขาฉกรรจ์'),
            TabBarTitle('อำเภอโคกสูง'),
            TabBarTitle('อำเภอวังสมบูรณ์'),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                'จังหวัดสระแก้ว',
                style: GoogleFonts.kanit(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              accountEmail: Text(
                'Sa Kaeo Province',
                style: GoogleFonts.kanit(),
              ),
              decoration: BoxDecoration(
                color: Colors.cyan,
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/provinceIcon.jpg'),
              ),
              otherAccountsPictures: [
                CircleAvatarBoy(
                  'assets/images/lalu.jpg',
                ),
                CircleAvatarBoy(
                  'assets/images/pangsida.jpg',
                ),
                CircleAvatarBoy('assets/images/sadockoktom.jpeg'),
              ],
            ),
            ListTileViewsDrawer(0, 'อำเภอเมืองสระแก้ว'),
            Divider(),
            ListTileViewsDrawer(1, 'อำเภอคลองหาด'),
            Divider(),
            ListTileViewsDrawer(2, 'อำเภอตาพระยา'),
            Divider(),
            ListTileViewsDrawer(3, 'อำเภอวังน้ำเย็น'),
            Divider(),
            ListTileViewsDrawer(4, 'อำเภอวัฒนานคร'),
            Divider(),
            ListTileViewsDrawer(5, 'อำเภออรัญประเทศ'),
            Divider(),
            ListTileViewsDrawer(6, 'อำเภอเขาฉกรรจ์'),
            Divider(),
            ListTileViewsDrawer(7, 'อำเภอเขาฉกรรจ์'),
            Divider(),
            ListTileViewsDrawer(8, 'อำเภอวังสมบูรณ์'),
            Divider(),
            ListTile(
              onTap: () {
                exit(0);
              },
              leading: Icon(
                Icons.exit_to_app_outlined,
              ),
              title: Text(
                'ออกจากการใช้งาน',
                style: GoogleFonts.kanit(),
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ShowTabBarViews(
            'd11.jpeg',
            'Sky Walk',
            'Khao Singto Temple',
            'd12.jpeg',
            'City Pillar Shrine',
            'Mueang Sakaeo',
            'อำเภอเมืองสระแก้ว',
            '       ชื่ออำเภอว่า "สระแก้ว" นั้นมีที่มาจากในท้องที่อำเภอมีสระน้ำโบราณอยู่ 2 สระ ได้แก่ "สระแก้ว" และ "สระขวัญ" ซึ่งตามประวัติของจังหวัดสระแก้ว สระน้ำทั้งสองนี้ถือว่ามีความสำคัญมาตั้งแต่ในอดีต เนื่องจากได้นำน้ำจากสระไปใช้ในพิธีถือน้ำพระพิพัฒน์สัตยา โดยถือว่าเป็นน้ำบริสุทธิ์และศักดิ์สิทธิ์ สระน้ำทั้งสองสระนี้เรียกกันติดปากว่า สระแก้ว-สระขวัญ',
            'd13.jpeg',
            'd14.jpeg',
            'ที่ว่าการอำเภอเมืองสระแก้ว ถนนสุวรรณศร ตำบลสระแก้ว อำเภอเมืองสระแก้ว \nจังหวัดสระแก้ว 27000',
            '037 241 785',
            'f11.jpeg',
            'ร้านยายเต็ม (Yai Tem)',
            'https://maps.app.goo.gl/F8jUTzFpZux43K3E7',
            'f12.webp',
            'Coffee Hills Grand',
            'https://maps.app.goo.gl/8jL3mGfrhBuhZY1d8',
            'h11.webp',
            'Hop Inn Sa Kaeo',
            'https://maps.app.goo.gl/S8es4iN9Cq7pNZKC7'
          ),
          ShowTabBarViews(
            'd21.webp',
            'ทะเลคลองหาด',
            'คลองหาด',
            'd22.jpeg',
            'ชุมชนทับทิมสยาม05',
            'คลองหาด',
            'อำเภอคลองหาด',
            '       อำเภอคลองหาดตั้งอยู่ทางทิศใต้ของจังหวัด มีอาณาเขตติดต่อกับเขตการปกครองข้างเคียงดังต่อไปนี้\n\tทิศเหนือ ติดต่อกับอำเภอเขาฉกรรจ์และอำเภอวัฒนานคร\n\tทิศตะวันออก ติดต่อกับอำเภออรัญประเทศ และจังหวัดพระตะบอง (ประเทศกัมพูชา)\n\tทิศใต้ ติดต่อกับอำเภอสอยดาว (จังหวัดจันทบุรี)\n\tทิศตะวันตก ติดต่อกับอำเภอวังสมบูรณ์และอำเภอวังน้ำเย็น',
            'd23.jpeg',
            'd24.jpeg',
            'ที่ว่าการอำเภอคลองหาด ถนนวัฒนานคร-ทุ่งขนาน ตำบลคลองหาด อำเภอคลองหาด จังหวัดสระแก้ว 27260',
            '037 512 241',
            'f21.jpeg',
            'กาแฟบ้านย่า',
            'https://maps.app.goo.gl/E2sjihXXgtPieViv5',
            'f22.jpeg',
            'Thepamelo',
            'https://maps.app.goo.gl/N7KmnpqKuJ7gJVJA6',
            'h21.jpeg',
            'คลองหาดรีสอร์ท',
            'https://maps.app.goo.gl/jNQfWwscQs9DWKV26',
          ),
          ShowTabBarViews(
            'd31.jpeg',
            'Ta Phraya National Park',
            'Ta Phraya',
            'd32.jpeg',
            'ปราสาทเขาโล้น',
            'Ta Phraya',
            'อำเภอตาพระยา',
            '       ตั้งชื่อจากประวัติการพักทัพของเจ้าพระยาบดินทรเดชา (สิงห์ สิงหเสนี) ขณะเดินทัพไปรบกับเขมร เดิมตาพระยาขึ้นกับอำเภออรัญประเทศ ต่อมาเมื่อปี พ.ศ. 2502 มีประชากรเพิ่มขึ้น จึงได้แยกเป็นกิ่งอำเภอ โดยมีร้อยโทมนตรี มณีเลิศ เป็นปลัดอำเภอผู้เป็นหัวหน้าประจำกิ่งอำเภอตาพระยา เป็นคนแรก (16 มีนาคม 2502 - 29 ธันวาคม 2503) ยกฐานะเป็นอำเภอตาพระยาเมื่อ พ.ศ. 2506',
            'd33.jpeg',
            'd34.jpg',
            'ที่ว่าการอำเภอตาพระยา ถนนธนะวิถี ตำบลตาพระยา อำเภอตาพระยา จังหวัดสระแก้ว 27180',
            '037 269 070',
            'f31.jpeg',
            'The Steak air boat',
            'https://maps.app.goo.gl/bcnQSF4ju5QrCdvB7',
            'f32.jpeg',
            'ถ้วยโปรด กาแฟสด&อาหาร',
            'https://maps.app.goo.gl/nUzQ72J5odLHogP99',
            'h31.webp',
            'Somboon Homestay',
            'https://maps.app.goo.gl/vXtaZCJM6eLiRhh28',
          ),
          ShowTabBarViews(
            'd41.jpeg',
            'ล่องแก่งสะเดา',
            'วังน้ำเย็น',
            'd42.jpeg',
            'น้ำตกเขาตะกรุบ',
            'วังน้ำเย็น',
            'อำเภอวังน้ำเย็น',
            '       ท้องที่อำเภอวังน้ำเย็น เดิมเป็นส่วนหนึ่งของตำบลเขาฉกรรจ์ อำเภอสระแก้ว ทางราชการได้แบ่งพื้นที่การปกครองของตำบลเขาฉกรรจ์ออกมาตั้งเป็นตำบลทั้งหมด 3 ตำบล ได้แก่ ตำบลวังน้ำเย็น ตำบลวังสมบูรณ์ และตำบลตาหลังใน ตามประกาศกระทรวงมหาดไทยลงวันที่ 28 กันยายน พ.ศ. 2519 โดยมีผลบังคับตั้งแต่วันที่ 26 ตุลาคม ปีเดียวกัน',
            'd43.jpeg',
            'd44.jpeg',
            'ที่ว่าการอำเภอวังน้ำเย็น หมู่ที่ 2 ตำบลวังน้ำเย็น อำเภอวังน้ำเย็น จังหวัดสระแก้ว 27210',
            '037 251 400',
            'f41.jpeg',
            'ครัวต้นไม้',
            'https://maps.app.goo.gl/PAsoQ7TSY8cuVzPE9',
            'f42.jpeg',
            'Trailer Coffee Bar',
            'https://maps.app.goo.gl/Kxz2oyvHLt5Lv5Qx6',
            'h41.jpeg',
            'วังน้ำเย็น การ์เด้น',
            'https://maps.app.goo.gl/krpftJBj8kpF1QUaA'
          ),
          ShowTabBarViews(
            'd51.jpeg',
            'น้ำตกปางสีดา',
            'วัฒนานคร',
            'd52.jpeg',
            'อ่างเก็บน้ำท่ากระบาก',
            'วัฒนานคร',
            'อำเภอวัฒนานคร',
            '       วัฒนานคร เคยมีฐานะเป็นเมืองเมืองหนึ่งมีเจ้าเมืองปลัดเมือง ยกกระบัตรเมือง รับผิดชอบดูแลมาแต่ก่อนจนกระทั่งปี พ.ศ. 2435 (ร.ศ. 111) พระบาทสมเด็จพระจุลจอมเกล้าเจ้าอยู่หัว ทรงโปรดเกล้าให้ทำการปฏิรูปการปกครองแผ่นดินครั้งใหญ่ ในขณะนั้นเป็นเมืองขนาดเล็กที่มีผู้คนอาศัยอยู่ไม่มากนัก จึงโปรดเกล้าให้ยุบเมืองวัฒนานครเป็นอำเภอวัฒนานครใน พ.ศ. 2437',
            'd53.jpeg',
            'd54.jpeg',
            'ที่ว่าการอำเภอวัฒนานคร ถนนสุวรรณศร ตำบลวัฒนานคร อำเภอวัฒนานคร \nจังหวัดสระแก้ว 27160',
            '037 251 400',
            'f51.jpeg',
            'โกดัง 9 คาเฟ่',
            'https://maps.app.goo.gl/EtvqEmW2J1H7wRdt8',
            'f52.jpeg',
            'Black Cat Bar',
            'https://maps.app.goo.gl/X6FP73myjV5Xq1uK8',
            'h51.jpeg',
            'Picha Ville Resort',
            'https://maps.app.goo.gl/8Ye7xTLNfaFz2V3x7',
          ),
          ShowTabBarViews(
            'd61.jpeg',
            'ตลาดโรงเกลือ',
            'อรัญประเทศ',
            'd62.jpeg',
            'ปราสาทเขาน้อยสีชมพู',
            'อรัญประเทศ',
            'อำเภออรัญประเทศ',
            '       อำเภออรัญประเทศ เดิมชื่อ บ้านหินแร่ ได้รับการยกฐานะขึ้นเป็น เมืองอรัญประเทศ ในรัชสมัยพระบาทสมเด็จพระนั่งเกล้าเจ้าอยู่หัว (รัชกาลที่ 3) เมื่อ พ.ศ. 2393 ได้รับเปลี่ยนแปลงฐานะเป็นอำเภอในรัชสมัยพระบาทสมเด็จพระปกเกล้าเจ้าอยู่หัว (รัชกาลที่ 7) ตามพระราชบัญญัติว่าด้วยระเบียบบริหารราชอาณาจักรไทย พ.ศ. 2476',
            'd63.jpeg',
            'd64.jpeg',
            'ที่ว่าการอำเภออรัญประเทศ หมู่ที่ 2 ถนนธนะวิถี ตำบลบ้านใหม่หนองไทร อำเภออรัญประเทศ \nจังหวัดสระแก้ว 27120',
            '037 231 016',
            'f61.jpeg',
            'แอมซัน อาหารเวียดนาม',
            'https://maps.app.goo.gl/6pJMfferQz5pKB1U7',
            'f62.jpeg',
            'LA VILLA CAFE',
            'https://maps.app.goo.gl/Bcs85KUd5WnkHnUg6',
            'h61.webp',
            "The VELO'S hotel and BMX pump track",
            'https://maps.app.goo.gl/Y6K14E5BcZ1N3RLL7'
          ),
          ShowTabBarViews(
            'd71.jpeg',
            'ทุ่งดอกไม้ Wood House',
            'เขาฉกรรจ์',
            'd72.jpeg',
            'วัดถ้ำเขาฉกรรจ์',
            'เขาฉกรรจ์',
            'อำเภอเขาฉกรรจ์',
            '       เขาฉกรรจ์ เป็นอำเภอหนึ่งของจังหวัดสระแก้ว เป็นที่ตั้งของเขาฉกรรจ์ เป็นจุดที่สมเด็จพระเจ้าตากสินมหาราช สมัยที่ทรงเป็นพระยาวชิรปราการ ได้ทรงรวบรวมคนไทยจากชุมนุมต่างๆ เพื่อกอบกู้เอกราชตอนเสียกรุงศรีอยุธยาครั้งที่ 2 ได้ทรงกระทำพิธี ฉอ-กัณฑ์ และกอบกู้เอกราชสำเร็จ',
            'd73.jpeg',
            'd74.jpeg',
            'ที่ว่าการอำเภอเขาฉกรรจ์ หมู่ที่ 6 ถนนเขาฉกรรจ์-หนองใหญ่ ตำบลเขาฉกรรจ์ อำเภอเขาฉกรรจ์ \nจังหวัดสระแก้ว 27000',
            '037 247 170',
            'f71.jpeg',
            'Morgen Garden',
            'https://maps.app.goo.gl/H1PuQbNRxiU3dz758',
            'f72.jpeg',
            'Wood house เขาฉกรรจ์',
            'https://maps.app.goo.gl/5ekGtreBXKqBqf9n9',
            'h71.webp',
            'บ้านชมดาว Sonne resort',
            'https://maps.app.goo.gl/8BgNeozvBvG5snB29',
          ),
          ShowTabBarViews(
            'd81.jpeg',
            'ปราสาทสด๊กก๊อกธม',
            'โคกสูง',
            'd82.jpeg',
            'วัดละลมติม',
            'โคกสูง',
            'อำเภอโคกสูง',
            '       ท้องที่อำเภอโคกสูงเดิมเป็นส่วนหนึ่งของอำเภอตาพระยา ทางราชการได้แบ่งพื้นที่การปกครองออกมาตั้งเป็น กิ่งอำเภอโคกสูง ตามประกาศกระทรวงมหาดไทยลงวันที่ 26 มิถุนายน พ.ศ. 2539 โดยมีผลบังคับตั้งแต่วันที่ 15 กรกฎาคม ปีเดียวกัน และต่อมาได้มีพระราชกฤษฎีกาเมื่อวันที่ 24 สิงหาคม พ.ศ. 2550 ยกฐานะขึ้นเป็น อำเภอโคกสูง โดยมีผลบังคับตั้งแต่วันที่ 8 กันยายน ปีเดียวกัน',
            'd83.jpeg',
            'd84.jpeg',
            'ที่ว่าการอำเภอโคกสูง หมู่ที่ 8 ตำบลโคกสูง อำเภอโคกสูง \nจังหวัดสระแก้ว 27120',
            '037 441 278',
            'f81.jpeg',
            'Kong Kaeo café',
            'https://maps.app.goo.gl/W7ToLaVLAEdqfhVD6',
            'f82.jpeg',
            'Tung may cafe',
            'https://maps.app.goo.gl/AHxAVRtLv66Q99T16',
            'h81.jpeg',
            'ไก่ทองนำโชครีสอร์ท',
            'https://maps.app.goo.gl/1xAeoUXfgoTiCYFE7',
          ),
          ShowTabBarViews(
            'd91.jpeg',
            'น้ำตกธารสมบูรณ์',
            'วังสมบูรณ์',
            'd92.jpeg',
            'วัดเขาแหลม',
            'หลวงปู่กาหลงเขี้ยวแก้ว',
            'อำเภอวังสมบูรณ์',
            '       วังสมบูรณ์ เป็น 1 ใน 9 อำเภอของจังหวัดสระแก้ว เดิมเป็นหมู่บ้านที่ 12, 18–19 ในตำบลเขาฉกรรจ์ อำเภอสระแก้ว จังหวัดปราจีนบุรี ทั้งหมด ต่อมาแยกพื้นที่ตำบลเขาฉกรรจ์ตั้งเป็นตำบลวังสมบูรณ์ในปี พ.ศ. 2519 และย้ายมาขึ้นกับกิ่งอำเภอวังน้ำเย็นในปีเดียวกัน ก่อนที่จะแยกออกมาตั้งเป็นกิ่งอำเภอในปี พ.ศ. 2540 และยกฐานะเป็นอำเภอเป็นทางการใน พ.ศ. 2550',
            'd93.jpeg',
            'd94.jpeg',
            'ที่ว่าการอำเภอวังสมบูรณ์ ถนนสระแก้ว-จันทบุรี ตำบลวังสมบูรณ์ อำเภอวังสมบูรณ์ \nจังหวัดสระแก้ว 27250',
            '037 449 129',
            'f91.jpeg',
            'บ้านสวนเจริญสุข',
            'https://maps.app.goo.gl/4gQMnvWGmnQ63pZHA',
            'f92.jpeg',
            'ก๋วยเตี๋ยววินเทจ',
            'https://maps.app.goo.gl/tjk84Cus64a4SBm58',
            'h91.jpeg',
            'พักเพลินรีสอร์ต Pakplernresort',
            'https://maps.app.goo.gl/HQRgsEwTrbUdfMEa6',
          ),
        ],
      ),
    );
  }

  Widget ShowTabBarViews(String Pt1, String Dpt11, String Dpt12, String Pt2, String Dpt21, String Dpt22,
  String DistriceName, String AboutDis, String Pt3, String Pt4, String Address, String Tell,
  String Fd1, String Fd1Name, String Fd1Lo, String Fd2, String Fd2Name, String Fd2Lo, String ht, String htName,
  String htLo) {
  return Padding(
    padding: EdgeInsets.only(
      top: MediaQuery.of(context).size.height * 0.01,
      left: MediaQuery.of(context).size.width * 0.030,
      right: MediaQuery.of(context).size.width * 0.030,
    ),
    child: SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        PathImage + Pt1,
                        width: MediaQuery.of(context).size.height * 0.10,
                        height: MediaQuery.of(context).size.height * 0.08,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.01,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.37,
                        child: Text(
                          Dpt11 + '\n' + Dpt12,
                          style: GoogleFonts.kanit(),
                        ),
                      ),
                      CustomPaint(
                        size: Size(
                          10,
                          MediaQuery.of(context).size.height * 0.05,
                        ),
                        painter: VerticalLinePainter(),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        PathImage + Pt2,
                        width: MediaQuery.of(context).size.height * 0.10,
                        height: MediaQuery.of(context).size.height * 0.08,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.010,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.37,
                        child: Text(
                          Dpt21 + '\n' + Dpt22,
                          style: GoogleFonts.kanit(),
                        ),
                      ),
                      CustomPaint(
                        size: Size(
                          10,
                          MediaQuery.of(context).size.height * 0.05,
                        ),
                        painter: VerticalLinePainter(),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.05,
              ),
              Image.asset(
                PathImage + 'provinceIcon.jpg',
                height: MediaQuery.of(context).size.height * 0.11,
              ),
            ],
          ),
          Divider(
            color: Colors.blue,
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Text(
            DistriceName,
            style: GoogleFonts.kanit(
              fontWeight: FontWeight.bold,
              fontSize: MediaQuery.of(context).size.height * 0.025,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.50,
                child: Text(
                  AboutDis,
                  textAlign: TextAlign.start,
                  softWrap: true,
                  overflow: TextOverflow.visible,
                  maxLines: null,
                  style: GoogleFonts.kanit(),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.06,
              ),
              Column(
                children: [
                  Image.asset(
                    PathImage + Pt3,
                    width: MediaQuery.of(context).size.width * 0.35,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Image.asset(
                    PathImage + Pt4,
                    width: MediaQuery.of(context).size.width * 0.35,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Row(
            children: [
              Text(
                'การติดต่อที่ว่าการ'+DistriceName,
                style: GoogleFonts.kanit(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.height * 0.02,
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Row(
            children: [
              Text(
                'ที่ตั้งที่ว่าการ',
                style: GoogleFonts.kanit(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.04,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.60,
                child: Text(
                  Address,
                  overflow: TextOverflow.visible,
                  maxLines: 5,
                  textAlign: TextAlign.start,
                  softWrap: true,
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.25,
                right: MediaQuery.of(context).size.width * 0.25),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
              child: ElevatedButton(
                onPressed: () {
                  _makePhoneCall(Tell.replaceAll(' ', ''));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.phone,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.03,
                    ),
                    Text(
                      Tell,
                      style: GoogleFonts.kanit(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.height * 0.015,
                      ),
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  backgroundColor: Color.fromARGB(255, 10, 30, 255),
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Text(
            'ร้านอาหารแนะนำ',
            style: GoogleFonts.kanit(
              fontWeight: FontWeight.bold,
              fontSize: MediaQuery.of(context).size.height * 0.02,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  PathImage + Fd1,
                  width: MediaQuery.of(context).size.width * 0.45,
                  height: MediaQuery.of(context).size.height * 0.13,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.45,
                child: Column(
                  children: [
                    Text(
                      Fd1Name,
                      style: GoogleFonts.kanit(
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.33,
                      child: ElevatedButton(
                        onPressed: () {
                          _launchInBrowser(
                            Uri.parse(Fd1Lo),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.map,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.03,
                            ),
                            Text(
                              'ไปร้านกัน',
                              style: GoogleFonts.kanit(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.015,
                              ),
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          backgroundColor: Color.fromARGB(255, 10, 30, 255),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.45,
                child: Column(
                  children: [
                    Text(
                      Fd2Name,
                      style: GoogleFonts.kanit(
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.33,
                      child: ElevatedButton(
                        onPressed: () {
                          _launchInBrowser(
                            Uri.parse(Fd2Lo),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.map,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.03,
                            ),
                            Text(
                              'ไปร้านกัน',
                              style: GoogleFonts.kanit(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.015,
                              ),
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          backgroundColor: Color.fromARGB(255, 10, 30, 255),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.015,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  PathImage + Fd2,
                  width: MediaQuery.of(context).size.width * 0.45,
                  height: MediaQuery.of(context).size.height * 0.13,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Text(
            'ที่พักแนะนำ',
            style: GoogleFonts.kanit(
              fontWeight: FontWeight.bold,
              fontSize: MediaQuery.of(context).size.height * 0.02,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(
              PathImage + ht,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Text(
            htName,
            style: GoogleFonts.kanit(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.40,
            child: ElevatedButton(
              onPressed: () {
                _launchInBrowser(
                  Uri.parse(htLo),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.map,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.03,
                  ),
                  Text(
                    'ไปที่พักกัน',
                    style: GoogleFonts.kanit(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.height * 0.015,
                    ),
                  ),
                ],
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                backgroundColor: Color.fromARGB(255, 10, 30, 255),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
        ],
      ),
    ),
  );
}

Widget ListTileViewsDrawer(int PageNo, String NameDistrice) {
  return ListTile(
    onTap: () {
      Navigator.pop(context);

      setState(() {
        _tabController!.index = PageNo;
      });
    },
    leading: Icon(
      FontAwesomeIcons.mapLocationDot,
    ),
    title: Text(
      NameDistrice,
      style: GoogleFonts.kanit(),
    ),
  );
}

Widget TabBarTitle(String NameDistrict) {
  return Tab(
    icon: Icon(
      FontAwesomeIcons.staylinked,
    ),
    text: NameDistrict,
  );
}

Widget CircleAvatarBoy(String assetsImage) {
  return CircleAvatar(
    backgroundImage: AssetImage(
      assetsImage,
    ),
  );
}

}

class VerticalLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(
      Offset(size.width / 2, 0), // จุดเริ่มต้น
      Offset(size.width / 2, size.height), // จุดสิ้นสุด
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

String PathImage = "assets/images/";