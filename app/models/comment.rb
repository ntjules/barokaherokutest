class Comment < ApplicationRecord
  default_scope { order("created_at DESC") }
  belongs_to :startup
  belongs_to :user
end
