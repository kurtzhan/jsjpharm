class Picture < ActiveRecord::Base
  belongs_to :product

  has_attached_file :image,
    :path => ":rails_root/public/images/:id/:style_:basename.:extension",
    :url  => "/images/:id/:style_:basename.:extension",

    :styles => {  
      :medium => "400x265#", :thumb => "100x100#"
    }

  do_not_validate_attachment_file_type :image
end
