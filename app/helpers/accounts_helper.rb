# Helper methods defined here can be accessed in any controller or view in the application

Alchemr.helpers do
  def gravatar_image(email, size)
    hash = Digest::MD5.hexdigest(email.downcase)
    image_tag "http://www.gravatar.com/avatar/#{hash}?s=#{size}&d=identicon"
  end
end
