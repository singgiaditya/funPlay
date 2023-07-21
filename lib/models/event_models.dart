class Event_Models {
  final String eventName;
  final String tempat;
  final String bulan;
  final String tanggal;
  final String deskripsi;
  final dynamic harga_diskon;
  final dynamic harga_asli;
  final String image;
  bool favorite;

  Event_Models(
      {required this.eventName,
      required this.tempat,
      required this.bulan,
      required this.tanggal,
      required this.deskripsi,
      required this.harga_diskon,
      required this.harga_asli,
      required this.image,
      required this.favorite
      });

  static List<Event_Models> listEvent = [
    Event_Models(
        eventName: "Arcade Game",
        tempat: "Malang City Mall",
        bulan: "Sep",
        tanggal: "28",
        deskripsi:
            "Arcade games are an exciting and enduring form of interactive entertainment that has captivated players of all ages for decades. Originating in the late 1970s, these games were initially housed in dedicated venues called arcades, where players would insert coins to enjoy a diverse array of captivating video games. Today, while arcades may not be as prominent as they once were, arcade games remain an integral part of gaming culture, with their influence extending to home gaming consoles, mobile devices, and online platforms",
        harga_diskon: 100000,
        harga_asli: 150000,
        image: "assets/Rectangle 1.png", favorite: false),
        Event_Models(
        eventName: "Billiard",
        tempat: "Malang City Mall",
        bulan: "Sep",
        tanggal: "28",
        deskripsi:
            "Billiards, also known as pool or pocket billiards, is an immensely popular cue sport enjoyed by players of all ages and skill levels around the world. It is a game that combines precision, strategy, and finesse, making it a favorite pastime in bars, clubs, and dedicated billiard halls. The objective of billiards is to use a cue stick to strike balls on a rectangular table, aiming to pot them into designated pockets and score points. Let's delve into the basic elements of this intriguing sport.",
        harga_diskon: 100000,
        harga_asli: 150000,
        image: "assets/gambar1.png", favorite: false),
        Event_Models(
        eventName: "Karaoke",
        tempat: "Malang City Mall",
        bulan: "Sep",
        tanggal: "28",
        deskripsi:
            "Karaoke is a popular form of interactive entertainment that brings together music and social engagement. Originating in Japan during the 1970s, karaoke has since become a worldwide phenomenon, captivating people of all ages and backgrounds. The word 'karaoke' is derived from the Japanese words 'kara' (empty) and 'oke' (orchestra), indicating that participants sing along to instrumental tracks without vocal accompaniment. Whether enjoyed in private gatherings, bars, or dedicated karaoke venues, this musical activity offers a unique and enjoyable way for individuals to express themselves through song.",
        harga_diskon: 100000,
        harga_asli: 150000,
        image: "assets/gambar.png", favorite: false)
  ];

  static List<int> listFavorite =[]; 
}
