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

EndUser.create(
    email: "1@1",
    password: "111111",
    reset_password_token: "",
    reset_password_sent_at: "",
    remember_created_at: "",
    last_name: "岡村",
    first_name: "隆史",
    last_name_kana: "オカムラ",
    first_name_kana: "タカシ",
    telephone: "111-111-1111",
    postal_code: "111-1111",
    address: "東京都千代田区1－1",
    is_unsubscribed: "false"
)

Address.create(
    name: "岡村隆史",
    postal_code: "222-2222",
    address: "東京都港区1－1",
    end_user_id: "1"
)