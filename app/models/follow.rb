class Follow < ApplicationRecord
    belongs_to :follower, class_name: "User"
    belongs_to :followee, class_name: "User"

    include PublicActivity::Model
    tracked

    def follow(user)
        followee = User.find(user.id)
        Follow.new(follower_id: current_user.id, followee_id: user.id)
    end

end
