class Post < ApplicationRecord
    validates :title, presence: true

    validates :content, length: {minimum: 250}

    validates :summary, length: {maximum: 250}

    validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }

    validate :clickbait

#     POSSIBLE_TITLES = [
#     /Won't Believe/i,
#     /Secret/i,
#     /Top \d/i,
#     /Guess/i
# ]
    
    POSSIBLE_TITLES = ["Won't Believe", "Secret", "Top 10", "Guess"]

    def clickbait
        # unless POSSIBLE_TITLES.any? {|element| element.match(title)}
        unless POSSIBLE_TITLES.any? {|element| title && title.include?(element)}
            errors.add(:title, "Not sufficiently clickbait-y")
        end
    end
end
