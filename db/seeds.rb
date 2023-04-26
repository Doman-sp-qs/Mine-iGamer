# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).


Admin.create!(
  email: 'admin@example.com',
  password: 'admin123',
)

customers = Customer.create!(
  [
    {
      email: 'moongirl@girl.com', name: 'るな',
      password: 'runaruna',
      introduction: 'こんにちは、るなです！FPSやアクションゲームが好きで、チームプレイを大切にしてます！新しい友達が作れたら嬉しいです！',
      profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/girl_with-moon.jpg"), filename:"girl_with-moon.jpg")
    },
    {
      email: 'purple@pur.com', name: 'こらむ',
      password: 'koramm',
      introduction: 'こんにちは、こらむと申します。MOBAやRTSなどのストラテジーゲームを得意としています。常にチームメイトのサポートや役割分担を意識し、勝利を目指しています。また、相手を尊重することも大切だと考えています。',
      profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/purple-controller.jpg"), filename:"purple-controller.jpg")
    },
    {
      email: 'jellyfish@jell.com', name: 'クララ',
      password: 'kurara',
      introduction: '主にRPGやアドベンチャーゲームが好き ストーリーやキャラクターに深く感情移入ししがち 休日はゲームの世界に没頭してます',
      profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/クラゲ.jpg"), filename:"クラゲ.jpg")
    }
  ]
)


posts = Post.create!(
  [
    {
      customer_id: customers[0].id, 
      game_name: 'スカイランド・レジェンズ',
      title: '空を駆け巡る冒険が楽しい！',
      body: '美しいグラフィックや楽しいゲームプレイが魅力的な、空を駆け巡る冒険ゲームです！キャラクターの動きや攻撃方法を工夫して、戦闘を有利に進めることができます。多彩なキャラクターやアイテム、クエストなど、やり込み要素も豊富です！'
    },
    {
      customer_id: customers[2].id, 
      game_name: 'ロストキングダム',
      title: '美麗なグラフィックと緻密なストーリー展開',
      body: '美麗なグラフィックや音楽、そして緻密に作り込まれたストーリー展開に魅了されました。プレイヤーは、壮大な冒険に身を投じ、多くの困難に立ち向かう必要がありますが、それは全てが魅力的であるからこそ楽しめる部分でもあります。'
    },
    {
      customer_id: customers[1].id, 
      game_name: 'ミラクルメイズ',
      title: '頭を使いながら疑心暗鬼になる面白さ！',
      body: 'ミラクルメイズは、頭を使いながら疑心暗鬼になる面白さが特徴のゲームです。このゲームでは、プレイヤーは謎めいた迷宮を探索し、様々な仕掛けや隠されたアイテムを見つけ出す必要があります。'
    },
    {
      customer_id: customers[0].id, 
      game_name: 'コンフリクト・ゾーン',
      title: 'ゲームモードが多くて楽しい！',
      body: '兵器やアイテムを駆使しながら、危険なミッションに挑むゲームです！いろんな地域での陣地攻防戦がメインのゲームになってて、戦車や航空機の操縦もできるリアリティの高いゲームです！オンラインでの協力プレイや対戦プレイなどもできるので、皆さん一緒にやりましょう！！'
    },
    {
      customer_id: customers[2].id, 
      game_name: 'スカイランド・レジェンズ',
      title: '圧倒的なアクションと緻密なグラフィック',
      body: 'スカイランド・レジェンズは、圧倒的なアクションと緻密なグラフィックが特徴のゲームです。このゲームでは、プレイヤーは空中に浮かぶ島々を探索しながら、多くの敵と戦う必要がありますが、そのバトルシステムの面白さには目を見張るものがあります。'
    }
  ]
)

Relationship.create!(
  [
    {
      follower_id: customers[0].id,
      followed_id: customers[2].id
    },
    {
      follower_id: customers[1].id,
      followed_id: customers[0].id
    },
    {
      follower_id: customers[2].id,
      followed_id: customers[0].id
    }
  ]
)

Favorite.create!(
  [
    {
      customer_id: customers[2].id,
      post_id: posts[0].id
    },
    {
      customer_id: customers[2].id,
      post_id: posts[2].id
    },
    {
      customer_id: customers[1].id,
      post_id: posts[1].id
    },
    {
      customer_id: customers[1].id,
      post_id: posts[0].id
    },
    {
      customer_id: customers[0].id,
      post_id: posts[4].id
    }
  ]
)

PostComment.create!(
  [
    {
      customer_id: customers[0].id,
      post_id: posts[4].id,
      post_comment: '面白いですよね！フォロー失礼します！'
    },
    {
      customer_id: customers[2].id,
      post_id: posts[3].id,
      post_comment: 'このゲーム始めたばかりなんですけど、動き方がわからなくて勝てないです。。'
    },
    {
      customer_id: customers[1].id,
      post_id: posts[3].id,
      post_comment: '楽しいですよね！！私は役割分担が特に重要だと思ってます！基本的にチームのサポート役をしているんですけど、よければ今度一緒にしませんか？'
    },
    {
      customer_id: customers[2].id,
      post_id: posts[3].id,
      post_comment: '今度一緒にさせてもらえませんか？初心者なのでいろいろ教えてほしいです＞＜'
    }
  ]
)