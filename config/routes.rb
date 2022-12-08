Rails.application.routes.draw do
  get 'lists/new'
  get '/top' => 'homes#top'

  # コントローラーにフォームのデータを送信するときは、HTTPメソッドであるGETとPOSTのうち「POST」を使用します。
  post 'lists' => 'lists#create'
  get 'lists' => 'lists#index'

  # .../lists/1や.../lists/3に該当する。
  # as:オプションを追加することで設定ができ、ここでは「'lists#show'の設定を、listとして利用できる」の意味asは、英語で「～として」の意味）。
  get 'lists/:id' => 'lists#show', as: 'list'

  # lists/:id/editのように、ルーティングのURLに:idを用いて記述すると、lists/◯◯/editのすべてのURLが対象になります
  get 'lists/:id/edit' => 'lists#edit', as: 'edit_list'
  
  # フォームとアクションを紐つけていく作業をしていきます。更新の場合はPATCHで指定します。
  patch 'lists/:id' => 'lists#update', as: 'update_list'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
