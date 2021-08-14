Admin.create!(
    email: "a@a",
    password: "aaaaaa"
)

Genre.create!(
    [
      {
        name: "ショートケーキ"
      },
      {
        name: "タルト"
      },
      {
        name: "チーズケーキ"
      },
      {
        name: "モンブラン"
      },
      {
        name: "シュークリーム"
      },
    ]
)

Item.create(
    name: "イチゴのショートケーキ",
    description: "長野産イチゴ使ってます",
    no_tax_price: "500",
    genre_id: "1",
    is_sold: "true",
    image: File.open("./app/assets/images/NCimage.png")
)

Item.create(
    name: "イチゴとブルーベリーのタルト",
    description: "おすすめです",
    no_tax_price: "700",
    genre_id: "2",
    is_sold: "true",
    image: File.open("./app/assets/images/NCimage.png")
)
