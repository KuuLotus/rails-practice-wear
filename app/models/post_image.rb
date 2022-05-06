class PostImage < ApplicationRecord
    has_one_attached :image

    belongs_to :user
    has_many :post_comments, dependent: :destroy
    has_many :favorites, dependent: :destroy
    
    validates :title,presence: true
    validates :image,presence: true
    
    def favorited_by?(user)
       favorites.exists?(user_id: user.id)
    end
    
 # 検索方法分岐
   def self.looks(search, word)
    if search == "perfect_match"
     @post_image = PostImage.where("title LIKE?", "#{word}")
    elsif search == "forward_match"
     @post_image = PostImage.where("title LIKE?", "#{word}%")
    elsif search == "backword_match"
     @post_image = PostImage.where("title LIKE?", "%#{word}")
    elsif search == "partial_match"
     @post_image = PostImage.where("title LIKE?", "%#{word}%")
    else
     @post_image = PostImage.all
    end
   end

end
