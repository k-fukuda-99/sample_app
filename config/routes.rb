Rails.application.routes.draw do

  get '/top' => 'homes#top'
  # コントローラーにフォームのデータを送信するときは、HTTPメソッドであるGETとPOSTのうち「POST」を使用します。
  # .../lists/1や.../lists/3に該当する。
  # as:オプションを追加することで設定ができ、ここでは「'lists#show'の設定を、listとして利用できる」の意味asは、英語で「～として」の意味）。
  # lists/:id/editのように、ルーティングのURLに:idを用いて記述すると、lists/◯◯/editのすべてのURLが対象になります
  # フォームとアクションを紐つけていく作業をしていきます。更新の場合はPATCHで指定します。
  #コントローラに実装するdestroyアクション用に、ルーティングを追加
  resources :lists
  #lists コントローラの同じ名前のアクションに紐づく形で、以下のルーティングを自動生成してくれる。
  #(括弧の中身は、主に使われることの多い機能です。)
  #new(投稿を作成する画面)
  #show(投稿の詳細画面)
  #index(投稿の一覧画面)
  #edit(投稿の編集画面)
  #create(投稿作成)
  #destroy(投稿削除)
  #update(投稿更新)

  #destroyアクションのルーティングのパスが変更されている
  #updateアクションのルーティングのパスも変更されている
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
