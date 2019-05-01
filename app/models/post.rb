class Post < ActiveRecord::Base

    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }

    validate :if_clickbait, if: :title

    def if_clickbait
        if !self.title.include?  "Won't Believe" || "Top[number" || "Guess"
            errors.add(:title, "Not valid")
        end 
    end 
end 


