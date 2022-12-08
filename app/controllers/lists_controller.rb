class ListsController < ApplicationController
  def new
    #Viewへ渡す為のインスタンス変数に空のmodelオブジェクトを生成する。
    @list = List.new
  end

  def create
    # 1.$2.データを受け取り新規登録する為のインスタンス作成
    list = List.new(list_params)
    # 3. データをデータベースに保存する為のsaveメソッド実行
    list.save
    # 4. 詳細画面へリダイレクトさせる。
    redirect_to list_path(list.id)
  end

  # インスタンス変数は自由に名前を決めることができ、今回は複数のListレコードが取得できるので、複数形で@listsという変数名にしている。
  # indexアクションは一覧画面用のアクションとして定義
  def index
    # allメソッドはidに関係なく、存在するレコードを全て取得するメソッド。
    @lists = List.all
  end

  # URLが/lists/1の場合、params[:id] と記述すると、id=1を取り出せる。
  def show
    # 今回はレコードを1件だけ取得するので、インスタンス変数名は単数形の「@list」にします。
    # findメソッドは引数を受け取り、idカラムを引数と比べてレコードを取得してくるメソッド。
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  # updateアクションでは、データの更新後に更新結果を詳細画面に表示するためにshowアクションにリダイレクトさせます。
  # showアクションにリダイレクトするために、引数には必ずidが必要になる。idを付けることで、どのデータを詳細画面で表示させるのかを決定しています。
  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)
  end

  private
  # ストロングパラメータ(マスアサインメント脆弱性)
  # params:formから送られてくるデータはparamsの中に入っている。
  def list_params
    # require:送られてきたデータの中からモデル名（ここでは:list)を指定し、データを絞り込む。
    # permit:requireで絞り込んだデータの中から、保存を許可するカラムを指定する。
    params.require(:list).permit(:title, :body, :image)
  end
end


