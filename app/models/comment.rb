class Comment < ActiveRecord::Base
    belongs_to :course
    belongs_to :user
    
    validates :comment_1,:comment_2,:comment_3,:comment_4,:comment_5,:comment_6,:comment_7,:comment_8,:comment_9,:comment_10,
    :comment_11,:comment_12,:comment_13,:comment_14,:comment_15,:comment_16,:comment_17, presence: true
end
