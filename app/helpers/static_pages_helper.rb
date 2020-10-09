# frozen_string_literal: true

module StaticPagesHelper
    def user_avatar user
        if user.image.present?
          image_tag user.image_url :thumbnail
        else
          # Assuming you have a default.jpg in your assets folder
          image_tag 'picture.png'
        end
      end
end
