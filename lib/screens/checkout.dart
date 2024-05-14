// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, prefer_typing_uninitialized_variables, use_build_context_synchronously, curly_braces_in_flow_control_structures, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:sangkar/components/payment/virtual_account.dart';
// import 'package:sangkar/components/payment/virtual_account_syariah.dart';
import 'package:sangkar/provider/payment_provider.dart';
import 'package:sangkar/utils/function.dart';
import 'package:sangkar/utils/request_payment.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  late PaymentProvider payment_provider;

  Map<String, dynamic> data = {
    "id": 1,
    "name": "Kambing Peternakan Berstandar: Jaminan Kualitas",
    "description": "Lorem ipsum, atau ringkasnya lipsum, adalah teks standar yang ditempatkan untuk mendemostrasikan elemen grafis atau presentasi visual seperti font, tipografi, dan tata letak.",
    "image": "https://media.philstar.com/photos/2023/01/29/web-year-goat-pixabay-fitmum_2023-01-29_14-13-27.jpg",
    "price": 3500000
  };

  bool agreement = false;
  bool loading = false;

  Future _payment() async {
    if (payment_provider.selected_bank == "") return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Pilih metode pembayaran terlebih dahulu",
          style: TextStyle(
            fontFamily: "Roboto",
            fontWeight: FontWeight.w700,
            color: HexColor("#292929"),
            fontSize: 12
          )
        ),
        backgroundColor: Colors.yellow,
      )
    );

    if (agreement) {
      setState(() => loading = true);

      final checkout = await request_virtual_account(
        payment_provider.selected_bank,
        {
          "email": "noreply@example.com",
          "first_name": "budi",
          "last_name": "utomo",
          "phone": "+6281 1234 1234"
        },
        [
          {
            "id": data["id"],
            "price": data["price"],
            "quantity": 1,
            "name": data["name"]
          }
        ]
      );

      if (checkout["status"]) {
        setState(() => loading = false);

        Map<String, dynamic> _response = {
          "transaction_id": checkout["data"]["transaction_id"],
          "order_id": checkout["data"]["order_id"],
          "merchant_id": checkout["data"]["merchant_id"],
          "gross_amount": checkout["data"]["gross_amount"],
          "payment_type": checkout["data"]["payment_type"],
          "transaction_time": checkout["data"]["transaction_time"],
          "transaction_status": checkout["data"]["transaction_status"],
          "expiry_time": checkout["data"]["expiry_time"]
        };

        if (payment_provider.selected_bank == "permata") {
          _response["va_number"] = checkout["data"]["permata_va_number"];
          _response["bank"] = "permata";
        } else if (payment_provider.selected_bank == "mandiri") {
          _response["va_number"] = checkout["data"]["biller_code"] +  checkout["data"]["bill_key"];
          _response["bank"] = "mandiri";
        } else {
          _response["va_number"] = checkout["data"]["va_numbers"][0]["va_number"];
          _response["bank"] = checkout["data"]["va_numbers"][0]["bank"];
        }

        payment_provider.set_payment = _response;
        return context.pushNamed("Payment");
      } else {
        debugPrint(checkout["data"].toString());
        return context;
      }
    }

    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Belum menyetujui syarat & ketentuan",
          style: TextStyle(
            fontFamily: "Roboto",
            fontWeight: FontWeight.w700,
            color: HexColor("#292929"),
            fontSize: 12
          )
        ),
        backgroundColor: Colors.yellow,
      )
    );
  }

  void _bindAgreement() {
    showDialog(context: context, builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(6))
        ),
        insetPadding: EdgeInsets.all(18),
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height - 20,
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Syarat & Ketentuan",
                style: TextStyle(
                  fontFamily: "Roboto",
                  color: HexColor("#292929"),
                  fontWeight: FontWeight.w700
                ),
              ),
              const SizedBox(height: 12),
              Expanded(child: SingleChildScrollView(
                child: Text(
                  "Dalam sejarah, biografi merupakan pengembangan dari penulisan otobiografi masa prasejarah. Otobiografi masa prasejarah melalui pembuatan lukisan di dinding-ding gua. Gambar yang ditampilkan hanya pertarungan mamut dengan manusia yang dapat menyebabkan kematian. Objek penyampaian otobiografi kemudian membahas  tentang kisah-kisah kepahlawanan dengan melukiskannya di vas atau pasu. Kemudian otobiografi ini berkembang pada masa Romawi Kuno melalui perkembangan teknologi pengecoran logam. Otobiografi disampaikan dalam bentuk koin logam. Isinya tentang pergantian kekuasaan, peperangan, proyek pembangunan dan skandal seks yang dilakukan oleh  para raja. Biografi yang paling kuno mulai ditulis pada masa Romawi Kuno dalam gulungan perkamen yang terbuat dari kulit binatang. Isinya berkaitan dengan kegiatan pemerintahan dan penginjilan oleh para pemuka agama. Penulisan biografi tokoh yang pertama baru dilakukan pada tahun 1795. Tokoh yang dituliskan biografinya adalah Samuel Johnson dan penulisnya adalah James Boswell. Secara sederhana, biografi merupakan catatan mengenai kehidupan dari seorang tokoh dalam sejarah. Keberadaan biografi pada dasarnya merupakan pembentuk penulisan sejarah. Pemahaman akan sejarah akan mudah tercapai melalui biografi dari para pelaku sejarah. Konsep biografi dibedakan dengan dengan otobiografi dan prosopografi. Biografi pada dasarnya adalah penulisan riwayat hidup seorang tokoh yang ditulis oleh orang lain. Sementara otobiografi merupakan penulisan riwayat hidup diri sendiri dan prosopografi adalah penulisan riwayat hidup dari banyak tokoh. Penulisan biografi dapat dalam bentuk buku maupun artikel di majalah atau berita di surat kabar. Pada biografi yang ditulis dalam media massa eperti koran dan majalah, isi biografinya lebih ringkas dibandingkan dengan buku biografi. Penulisannya pun dapat dilakukan dengan tipe jurnalisme warga. Sosok yang dikisahkan kehidupannya dapat berupa tokoh-tokoh yang dianggap penting atau menarik di masyarakat lokal. Teks biografi disusun oleh orang lain, bukan oleh diri sendiri. Pola pengembangan teks biografi biasanya bersifat kronologis. Fakta yang diangkat harus berdasarkan pengalaman pribadi tokoh yang diceritakan dalam biografi. Isi dan bentuk dari tiap biografi dapat berbeda-beda satu sama lain. Ada biografi yang ditulis hanya untuk menyampaikan watak yang dimiliki oleh tokoh yang riwayat hidupnya diceritakan. Ada pula biografi yang hanya menceritakan karier kehidupan dari tokoh yang diceritakan. Sementara itu, terdapat penulisan biografi yang bertujuan untuk menghibur pembacanya atau mengejek tokoh yang dituliskan ceritanya. Model penulisan biografi yang mengejek tokoh atau menghibur pembaca salah satunya oleh Giles Lytton Strachey. Bentuk biografi yang baik secara teoretis dibedakan menjadi 3 macam. Bentuk pertama adalah biografi interpretatif yang sifatnya menyeimbangkan antara watak, tindakan dan kondisi zaman dari tokoh yang diceritakan. Biografi interpretatif dibuat dengan acuan teori-teori interpretasi dari ilmu sejarah, sosiologi maupun psikologi. Tingkat penafsiran secara akademik menjadi nilai utama dalam biografi interpretatif. Bentuk yang kedua adalah biografi populer. Gaya penulisannya mengutamakan retorika karena pembuatannya hanya mengutamakan kelarisan penjualannya di pasaran. Biografi populer tidak mengutamakan kebenaran ilmiah sehingga dapat ada dialog antar tokoh yang sifatnya fiksi belaka. Isi dialog dari biografi populer dapat merupakan fakta tetapi dialog itu sendiri tidak pernah dilakukan oleh para tokoh yang diceritakan. Salah satu contoh karya biografi populer adalah Napoleon yang ditulis oleh Emil Ludwig. Sedangkan bentuk biografi yang ketiga adalah biografi sumber. Dalam riwayat penulisan biografi, biografi sumber umumnya adalah biografi yang pertama kali ditulis tentang seorang tokoh. Penulisnya dengan demikian tidak berkewajiban mengadakan studi perbandingan dengan karya biografi lain dengan tokoh yang sama. Isi biografinya mengutamakan penulisan fakta sebanyak mungkin dengan cara yang dapat dipahami dengan mudah oleh orang lain yang membacanya. Pada biografi sumber tidak ada kewajiban untuk menganalisa atau memberikan deskripsi yang bersifat penafsiran atas kehidupan seorang tokoh. Namun, penulisan kerangka tulisan, pemahaman bahan penulisan dan penyusunan plot menjadi kewajiban dalam pembuatan biografi sumber.",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 12
                  ),
                )
              )),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: () {
                  setState(() {
                    agreement = true;
                  });
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: double.infinity,
                  height: 38,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                    color: HexColor("#00AA13")
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Saya menyetujuinya",
                    style: TextStyle(
                      fontFamily: "Roboto",
                      color: Colors.white,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    payment_provider.reset();
  }

  @override
  Widget build(BuildContext context) {
    payment_provider = Provider.of<PaymentProvider>(context);

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
                    onTap: () {
                      return Navigator.pop(context);
                    },
                    child: Image.asset("assets/arrow_back.png", width: 28, height: 28)
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "Beli",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: "Roboto",
                        color: HexColor("#FFFFFF"),
                        fontWeight: FontWeight.w700,
                        fontSize: 15
                      )
                    )
                  )
                ]
              )
            ),
            Container(
              color: Colors.white,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hewan yang dibeli",
                    style: TextStyle(
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                      color: HexColor("#292929")
                    )
                  ),
                  const SizedBox(height: 12),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        clipBehavior: Clip.hardEdge,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8))
                        ),
                        child: Image.network(data["image"], width: double.infinity, height: double.infinity, fit: BoxFit.cover)
                      ),
                      const SizedBox(width: 12),
                      Expanded(child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data["name"],
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: "Roboto",
                              color: HexColor("#292929"),
                              fontSize: 14
                            )
                          ),
                          const SizedBox(height: 12),
                          Text(
                            transformPrice(data["price"]),
                            style: TextStyle(
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: HexColor("#292929")
                            )
                          )
                        ]
                      ))
                    ]
                  )
                ]
              )
            ),
            Container(
              height: 6,
              margin: const EdgeInsets.only(top: 8),
              color: HexColor("#F0F3F7"),
            ),
            Expanded(child: SingleChildScrollView(
              child: Container(
                color: Colors.white,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    VirtualAccount(),
                    // const SizedBox(height: 16),
                    // VirtualAccountSyariah()
                  ]
                ),
              )
            )),
            Container(
              padding: const EdgeInsets.only(left: 12, right: 12, bottom: 6, top: 12),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(width: 1, color: HexColor("#EDEDED"))
                )
              ),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (!agreement) {
                        _bindAgreement();
                      }
                    },
                    child: Row(
                      children: [
                        SizedBox(
                          width: 20,
                          height: 20,
                          child: Checkbox(
                            value: agreement,
                            onChanged: null,
                            activeColor: HexColor("#00AA13"),
                            fillColor: MaterialStateColor.resolveWith((states) => !agreement ? HexColor("#FFFFFF") : HexColor("#00AA13")),
                            side: BorderSide(
                              width: 1,
                              color: HexColor("#00AA13")
                            )
                          )
                        ),
                        const SizedBox(width: 6),
                        Text(
                          "Saya telah menyetujui syarat & ketentuan yang berlaku",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 12,
                            color: HexColor("#292929")
                          ),
                        )
                      ]
                    )
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Total Bayar",
                              style: TextStyle(
                                fontFamily: "Roboto",
                                color: HexColor("#292929"),
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              )
                            ),
                            Text(
                              transformPrice(data["price"]),
                              style: TextStyle(
                                fontFamily: "Roboto",
                                color: HexColor("#00AA13"),
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                              )
                            ),
                          ]
                        )
                      )),
                      GestureDetector(
                        onTap: () {
                          if (!loading) {
                            _payment();
                          }
                        },
                        child: Container(
                          height: 38,
                          width: 128,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(8)),
                            color: HexColor("#00AA13")
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (!loading) Image.asset("assets/shield.png", width: 20, height: 20),
                              if (!loading) const SizedBox(width: 6),
                              if (!loading) const Text(
                                "Bayar",
                                style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                  fontSize: 16
                                )
                              ),
                              if (loading) LoadingAnimationWidget.horizontalRotatingDots(color: Colors.white, size: 40)
                            ]
                          )
                        )
                      )
                    ]
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