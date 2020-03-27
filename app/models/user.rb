class User < ApplicationRecord
    has_many :posts
    has_many :comments
    has_many :likes
    
    has_many :followed_users, foreign_key: :follower_id, class_name: "Follow"
    has_many :followees, through: :followed_users
    
    has_many :following_users, foreign_key: :followee_id, class_name: "Follow"
    has_many :followers, through: :following_users

    validates :username, :email, :password, presence: true
    validates :username, :email, uniqueness: true

    has_secure_password
    
    def discover_users
    @current_user = self
    if @current_user.followers
        @undiscovered_users = User.all.excluding(@current_user, @current_user.followers)
    else 
        @undiscovered_users = User.all.excluding(@current_user)            
        end
    end
end
