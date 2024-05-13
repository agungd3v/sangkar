// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sangkar/components/home_main_product_card.dart';
import 'package:sangkar/components/home_searchbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> items = [
    {
      "label": "Kambing Pilihan Segar Langsung dari Peternakan",
      "image": "https://cdn.britannica.com/29/529-050-6B31311A/Angora-goat.jpg",
      "price": 3500000
    },
    {
      "label": "Kambing Organik Asli, Sumber Protein Berkualitas",
      "image": "https://nationalzoo.si.edu/sites/default/files/paragraphs/single_image/20180628-634sb.jpg",
      "price": 3400000
    },
    {
      "label": "Kambing Premium: Rasakan Kenikmatan Rasa Alaminya",
      "image": "https://upload.wikimedia.org/wikipedia/commons/d/d4/Bagot_goat_Staunton_Park_2023.JPG",
      "price": 3500000
    },
    {
      "label": "Kambing Super Sehat: Gizi Tinggi, Lemak Rendah",
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7xgVMxufQM0ldZQuGdEsj8GwxceDx0F85H8zl46ymeg&s",
      "price": 3200000
    },
    {
      "label": "Kambing Jantan Unggul: Kualitas Terbaik Dijamin",
      "image": "https://harmonylanefarms.com/wp-content/uploads/2021/01/A4B6EE30-68AE-467C-91A0-3A654E32A700.jpg",
      "price": 3300000
    },
    {
      "label": "Kambing Betina Berkualitas: Cocok untuk Pemuliaan",
      "image": "https://th-thumbnailer.cdn-si-edu.com/4eeie4RdnY90TdLh28nhYo1dy04=/800x600/https://tf-cmsv2-smithsonianmag-media.s3.amazonaws.com/filer/b9/d2/b9d271f3-7f66-4132-b5af-7d33844505b7/goat.jpg",
      "price": 3300000
    },
    {
      "label": "Kambing Peternakan Berstandar: Jaminan Kualitas",
      "image": "https://media.philstar.com/photos/2023/01/29/web-year-goat-pixabay-fitmum_2023-01-29_14-13-27.jpg",
      "price": 3600000
    },
    {
      "label": "Kambing Segar dari Ladang: Penuh Nutrisi Alami",
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVI9tV9tOiRqdNPAoWA44Ad49ppIyFmNrH0CvC3vAapg&s",
      "price": 3100000
    },
    {
      "label": "Kambing Liar Asli: Daging Beraroma Murni",
      "image": "https://i.ytimg.com/vi/8Kkybu9Xsoc/maxresdefault.jpg",
      "price": 3500000
    },
    {
      "label": "Kambing Pedaging Terbaik: Hidangan Lezat dan Sehat",
      "image": "https://www.icimod.org/wp-content/uploads/2019/12/Animal_Husbandry-1.jpg",
      "price": 3000000
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          backgroundColor: HexColor("#00AA13"),
          automaticallyImplyLeading: false
        )
      ),
      body: Container(
        height: MediaQuery.of(context).size.height - 78,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeSearchBar(),
            Expanded(
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 2 + 70),
                padding: const EdgeInsets.only(top: 6, bottom: 20, left: 6, right: 6),
                children: [
                  for(var index = 0; index < items.length; index++) HomeMainProductCard(item: items[index]),
                ]
              )
            )
          ]
        )
      )
    );
  }
}