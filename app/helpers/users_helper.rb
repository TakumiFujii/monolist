module UsersHelper
  def gravatar_url(user, options = { size: 80 })
    #userとoptionになんか値を求めてる オプションのデフォルトが80
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    #ここでオプションってのはsizeのことやでーって言ってr
    "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}&d=mm"
  end
end
