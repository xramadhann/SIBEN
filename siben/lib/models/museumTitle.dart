class Museum {
  final String title;
  final String subtitle;
  final String subtitle2;
  final String subtitle3;
  final String assetImagePath;
  const Museum({
    required this.title,
    required this.subtitle,
    required this.subtitle2,
    required this.subtitle3,
    required this.assetImagePath,
  });
}

const allMuseums = [
  Museum(
    title: "1",
    subtitle:
        "Kamir, terkadang ditulis Khamir, adalah makanan khas Pemalang asal negara Arab. Kue ini terbuat dari adonan terigu, mentega, dan telur, terkadang dicampur dengan bahan seperti pisang ambon atau tape. Kamir ada dua jenis, yaitu kamir beras dan kamir terigu.",
    subtitle2:
        "Kamir, sometimes written as Khamir, is a typical Pemalang food from Arab countries. This cake is made from a mixture of flour, butter and eggs, sometimes mixed with ingredients such as ambon banana or tape. There are two types of kamir, namely rice kamir and wheat kamir.",
    subtitle3:
        " 卡米尔（Kamir），有时也写作卡米尔（Khamir），是来自阿拉伯国家的典型Pemalang食品。 这种蛋糕由面粉、黄油和鸡蛋的混合物制成，有时还与安汶香蕉或胶带等成分混合。 卡米尔有两种类型，即大米卡米尔和小麦卡米尔。",
    assetImagePath: "assets/ramadhan pride.png",
  ),
  Museum(
    title: "2",
    subtitle: "kue samir",
    subtitle2: "kue samir",
    subtitle3: "kue samir",
    assetImagePath: "assets/ramadhan pride.png",
  ),
  Museum(
    title: "3",
    subtitle: "kue samir",
    subtitle2: "kue samir",
    subtitle3: "kue samir",
    assetImagePath: "assets/ramadhan pride.png",
  ),
  Museum(
    title: "Crash Marquez",
    subtitle: "'Menuju tak terbatas ... dan melampauinya!'",
    subtitle2: "'To Infinity and Beyond'",
    subtitle3: "'cang cing cung cang cing cung'",
    assetImagePath: "assets/marc-marquez-terbang.jpeg",
  ),
];
