class Post < ApplicationRecord
    include PublicActivity::Model
    tracked 
    # except: :update, owner: ->(controller, model) {controller && controller.current_user}
    
    belongs_to :user
    has_many :comments
    has_many :likes

    def activity_actor
        self.user
    end
    
end
