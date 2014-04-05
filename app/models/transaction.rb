class Transaction < ActiveRecord::Base
  belongs_to :debitor,    foreign_key: 'from_id',   class_name: 'User'
  belongs_to :credited,   foreign_key: 'to_id',     class_name: 'User'
end
