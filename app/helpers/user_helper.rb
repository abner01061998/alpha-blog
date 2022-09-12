module UserHelper
    def gravatar_for user, options={size: 80}
        email_address = user.email
        hash = Digest::MD5.hexdigest(email_address)
        img_src = "https://www.gravatar.com/avatar/#{hash}?s=#{options[:size]}"
        image_tag(img_src, alt: user.username, class:"rounded shadow mx-auto d-block ")
    end

end
