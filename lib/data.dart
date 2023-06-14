import 'package:gourmentcofe/models/item_model.dart';

import 'models/catigory_Modle.dart';

List<CatigoryModel> catigory = [
  CatigoryModel(
    id: 1,
    title: "Tee sorten",
    image: "assets/image/1.jpg",
    items: [
      ItemModel(id: 1, name: "Englische Mischung", price: 2.90),
      ItemModel(id: 2, name: "Grüntee", price: 2.90),
      ItemModel(id: 3, name: "Lemon Fresh", price: 2.90),
      ItemModel(id: 4, name: "Pfefferminze", price: 2.90),
      ItemModel(id: 5, name: "Kamille", price: 2.90),
      ItemModel(id: 6, name: "Frische Ingwer-Zitronen Tee", price: 3.90),
      ItemModel(id: 7, name: "Frische Pfefferminzetee", price: 3.60),
      ItemModel(id: 8, name: "Heisse-Zitrone", price: 2.80),
    ],
  ),
  CatigoryModel(
    id: 2,
    title: "Kaffee und co",
    image: "assets/image/2.jpg",
    items: [
      ItemModel(id: 1, name: "Becher", price: 2.40),
      ItemModel(id: 2, name: "Tasse", price: 2.10),
      ItemModel(id: 3, name: "Cafe Creme", price: 2.80),
      ItemModel(id: 4, name: "Cappuccino", price: 3.20),
      ItemModel(id: 5, name: "MilchKaffee", price: 3.80),
      ItemModel(id: 6, name: "Latte Macchiato", price: 3.80),
      ItemModel(id: 7, name: "Espresso", price: 2.30),
      ItemModel(id: 8, name: "Espresso Macchiato", price: 2.60),
      ItemModel(id: 9, name: "Espresso Doppel", price: 3.40),
      ItemModel(id: 10, name: "Heisse schokolade", price: 3.40),
      ItemModel(id: 11, name: "Heisse Milch", price: 3.10),
    ],
  ),
  CatigoryModel(
    id: 3,
    title: "Kalte Getränke",
    image: "assets/image/6.jpg",
    items: [
      ItemModel(id: 1, name: "Wasser 0,25L", price: 2.60),
      ItemModel(id: 2, name: "Wasser 0,75L", price: 4.90),
      ItemModel(id: 3, name: "Apfelschorle 0,3L", price: 2.40),
      ItemModel(id: 4, name: "Rhabaersaftschorle 0,3L", price: 3.70),
      ItemModel(id: 5, name: "Maracujasaftschorle 0,3L", price: 3.70),
      ItemModel(id: 6, name: "Fritz alle Sorten 0,33L", price: 3.80),
      ItemModel(id: 7, name: "Coca-Cola 0,33L", price: 2.70),
      ItemModel(id: 8, name: "Fanta 0,33L", price: 2.70),
      ItemModel(id: 9, name: "Ginger Ale", price: 2.70),
      ItemModel(id: 10, name: "Apfelsaft 0,33L", price: 3.40),
      ItemModel(id: 11, name: "Orangensaft 0,33L", price: 3.80),
      ItemModel(id: 12, name: "Ananassaft 0,33L", price: 3.90),
      ItemModel(id: 13, name: "Red Bull  0,25L", price: 3.90),
      ItemModel(id: 14, name: "Red Bull Zucker-frei 0,25L", price: 3.90),
    ],
  ),
  CatigoryModel(
    id: 4,
    title: "Limonade und EisTee",
    image: "assets/image/5.jpg",
    items: [
      ItemModel(id: 1, name: "Hausgemachte Limonade 0,3L", price: 3.80),
      ItemModel(id: 2, name: "Mange-Passionsfrucht-Eistee", price: 3.90),
      ItemModel(id: 3, name: "Himbeer-Granatapfel-Eistee", price: 3.90),
      ItemModel(id: 4, name: "Pfirsich-Grüner-Eistee", price: 3.90),
      ItemModel(id: 5, name: "Arizona", price: 4.30),
    ],
  ),
  CatigoryModel(
    id: 5,
    title: "Salat",
    image: "assets/image/6.jpg",
    items: [
      ItemModel(id: 1, name: "Kleiner Gemischte Salat", price: 4.80),
      ItemModel(
          id: 2,
          name: "Thon-Ficsh Salat",
          price: 9.90,
          subTitle:
              "Gemischte Salat ,zwiebeln ,Tomaten ,Oliven ,mit Ton fisch und Dressing nach Auswahl"),
      ItemModel(
          id: 3,
          name: "Cesar Salat",
          price: 11.90,
          subTitle: "Römersalat mit Hänschen Brust fillet  zisam und krouten"),
      ItemModel(
          id: 4,
          name: "Lachs Salat",
          price: 12.40,
          subTitle:
              "Gemischte Salat, Paprika, Zwiebeln , Mais, Tomaten, mit gerauchte  Lachs mit Hönig-zenf-sauce"),
      ItemModel(
          id: 5,
          name: "Feta Salat",
          price: 11.90,
          subTitle:
              "Gemischte Salat , Tomaten ,Zwiebeln , Oliven ,Mais und Feta"),
      ItemModel(
          id: 6,
          name: "Tomaten Salat",
          price: 7.90,
          subTitle: "Roccula ,Tomaten , Rot-Zwiebel, Balsamico-sauce"),
      ItemModel(
          id: 7,
          name: "Falafel Salat",
          price: 10.90,
          subTitle: "Gemischte Salat ,zwiebeln ,Tomaten ,Oliven und Falafel"),
    ],
  ),
  CatigoryModel(
    id: 6,
    title: "Frühstück",
    image: "assets/image/7.jpg",
    items: [
      ItemModel(
          id: 1,
          name: "Frühstück in Paris",
          price: 4.80,
          subTitle: "Kaffe .Croissant , Konfitüre ,Butter"),
      ItemModel(
          id: 2,
          name: "Good Morning",
          price: 5.90,
          subTitle: "Kaffe. Brötchen , Butter ,putensalame "),
      ItemModel(
          id: 3,
          name: "Gougmet Frühstück",
          price: 9.90,
          subTitle:
              "Croissant ,Honig, Butter , Konfitüre , Brötchen , Frischkäse, Putensalami, gekochte EiGurcke und Tomate"),
      ItemModel(
          id: 4,
          name: "Frühstück für 2 Personen",
          price: 17.90,
          subTitle:
              "2 Croissant ,Honig, Butter , Konfitüre ,2 Brötchen, Frischkäse,  Putensalami , Käse, 2 Eier Gurcke und Tomate"),
      ItemModel(
          id: 5,
          name: "Kinder Portion",
          price: 3.90,
          subTitle: "Croissant , Butter , Konfiture "),
    ],
  ),
  CatigoryModel(
    id: 7,
    title: "Belegte Brotschen",
    image: "assets/image/8.jpg",
    items: [
      ItemModel(id: 1, name: "Belegte Brotschen mit mozzarelle", price: 3.20),
      ItemModel(
          id: 2, name: "Belegte Brotschen mit lachs -streifen", price: 4.10),
      ItemModel(
          id: 3, name: "Belegte Brotschen mit puten-streifen", price: 3.80),
      ItemModel(
          id: 4, name: "Belegte Brotschen mit salami sheiben", price: 3.90),
      ItemModel(id: 5, name: "Belegte Brotschen mit eier", price: 3.10),
      ItemModel(id: 6, name: "Belegte Brotschen mit käse", price: 3.90),
    ],
  )
];
