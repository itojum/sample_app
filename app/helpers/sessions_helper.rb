module SessionsHelper
  # 渡されたユーザーでログインする
  def log_in(user)
    session[:user_id] = user.id
  end

  # 現在ログイン中のユーザーを返す(いる場合)
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  # 現在のユーザーがログインしているかどうかを返す
  def logged_in?
    !current_user.nil?
  end

  # ユーザーのログイン情報を破棄する
  def log_out
    reset_session
    @current_user = nil
  end
end
