import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
        color: Colors.white,
        child: Column(
          children: [
            Container(
              color: HexColor("#00AA13"),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Image.asset("assets/user.png", width: 60, height: 60, fit: BoxFit.fill)
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Devano Yudhistira",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: "Roboto",
                            color: HexColor("#FFFFFF"),
                            fontWeight: FontWeight.w700,
                            fontSize: 16
                          )
                        ),
                        Container(
                          width: 120,
                          height: 22,
                          padding: const EdgeInsets.only(right: 3),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(99))
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/verified_green.png", width: 16, height: 16),
                              const SizedBox(width: 4),
                              SizedBox(height: 15, child: Text(
                                "Akun Terverifikasi",
                                style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w700,
                                  color: HexColor("#00AA13"),
                                  fontSize: 10
                                )
                              ))
                            ]
                          )
                        )
                      ]
                    )
                  )
                ]
              )
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset("assets/transaction_flat.png", width: 20, height: 20),
                                const SizedBox(width: 4),
                                Text(
                                  "Transaksi Saya",
                                  style: TextStyle(
                                    fontFamily: "Roboto",
                                    color: HexColor("#292929"),
                                    fontSize: 12
                                  )
                                )
                              ]
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                "Lihat Riwayat Transaksi",
                                style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w700,
                                  color: HexColor("#00AA13"),
                                  fontSize: 10
                                )
                              )
                            )
                          ]
                        )
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(width: 1, color: HexColor("#EDEDED"))
                          )
                        ),
                        margin: const EdgeInsets.symmetric(vertical: 12)
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Column(
                                children: [
                                  Image.asset("assets/waiting_payment.png", width: 22, height: 22),
                                  const SizedBox(height: 8),
                                  Text(
                                    "Menunggu Pembayaran",
                                    style: TextStyle(
                                      fontFamily: "Roboto",
                                      color: HexColor("#292929"),
                                      fontSize: 10
                                    )
                                  )
                                ]
                              )
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Column(
                                children: [
                                  Image.asset("assets/waiting_approval.png", width: 22, height: 22),
                                  const SizedBox(height: 8),
                                  Text(
                                    "Menunggu Disetujui",
                                    style: TextStyle(
                                      fontFamily: "Roboto",
                                      color: HexColor("#292929"),
                                      fontSize: 10
                                    )
                                  )
                                ]
                              )
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Column(
                                children: [
                                  Image.asset("assets/receipt_approved.png", width: 22, height: 22),
                                  const SizedBox(height: 8),
                                  Text(
                                    "Pembelian Berhasil",
                                    style: TextStyle(
                                      fontFamily: "Roboto",
                                      color: HexColor("#292929"),
                                      fontSize: 10
                                    )
                                  )
                                ]
                              )
                            )
                          ]
                        )
                      )
                    ]
                  ),
                  Container(
                    color: HexColor("#F0F3F7"),
                    height: 6,
                    margin: const EdgeInsets.symmetric(vertical: 12)
                  ),
                  Container(
                    color: Colors.white,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Informasi Tambahan",
                          style: TextStyle(
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w700,
                            color: HexColor("#292929")
                          )
                        ),
                        const SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(width: 1, color: HexColor("#EDEDED"))
                              )
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Biodata",
                                  style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                    color: HexColor("#292929")
                                  )
                                ),
                                Expanded(child: Container()),
                                Image.asset("assets/arrow_right_black.png", width: 20, height: 20)
                              ]
                            )
                          )
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(width: 1, color: HexColor("#EDEDED"))
                              )
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Syarat & Kebijakan",
                                  style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                    color: HexColor("#292929")
                                  )
                                ),
                                Expanded(child: Container()),
                                Image.asset("assets/arrow_right_black.png", width: 20, height: 20)
                              ]
                            )
                          )
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(width: 1, color: HexColor("#EDEDED"))
                              )
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Hubungi Kami",
                                  style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                    color: HexColor("#292929")
                                  )
                                ),
                                Expanded(child: Container()),
                                Image.asset("assets/arrow_right_black.png", width: 20, height: 20)
                              ]
                            )
                          )
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            // decoration: BoxDecoration(
                            //   border: Border(
                            //     bottom: BorderSide(width: 1, color: HexColor("#EDEDED"))
                            //   )
                            // ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Tentang Kami",
                                  style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                    color: HexColor("#292929")
                                  )
                                ),
                                Expanded(child: Container()),
                                Image.asset("assets/arrow_right_black.png", width: 20, height: 20)
                              ]
                            )
                          )
                        )
                      ]
                    )
                  ),
                  const SizedBox(height: 24),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: double.infinity,
                        height: 35,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(99)),
                          color: HexColor("#00AA13")
                        ),
                        child: const Text(
                          "Keluar",
                          style: TextStyle(
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w700,
                            color: Colors.white
                          )
                        )
                      )
                    )
                  )
                ]
              )
            )
          ]
        )
      )
    );
  }
}