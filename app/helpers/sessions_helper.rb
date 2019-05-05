module SessionsHelper
  
  # 引数に渡されたユーザーでログインする
  def log_in(user)
    session[:user_id] = user.id
  end
  
  # 現在ログイン中のユーザーを返す(ただし、いる場合のみ)
  def current_user #訳：現在のユーザー
    if session[:user_id] #セッションに(ブラウザに保存された!?)ユーザーIDが存在するかどうか？(ログイン中のユーザー) →trueなら下へ、nilならﾒｿｯﾄﾞは終了しnilを返す
      @current_user ||= User.find_by(id: session[:user_id])
                      #  ↓            ↓            ↓
                      #usersﾃｰﾌﾞﾙの  idｶﾗﾑから  ﾛｸﾞｲﾝ中のﾕｰｻﾞｰidと等しいidを取得する
    end
  end
  
  # ユーザーがログインしていればtrue、その他ならfalseを返す
  def logged_in?
    !current_user.nil?
    #否定演算子!を使ってる(trueならfalseに、falseならtrueになる)
    #訳)ﾛｸﾞｲﾝ中のﾕｰｻﾞｰは存在しませんか?
    #存在しない=trueがfalseに、存在する=falseがtrueに
  end
end