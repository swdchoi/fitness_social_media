class Movement < ApplicationRecord
  belongs_to :session
  belongs_to :exercise, optional: true
end
