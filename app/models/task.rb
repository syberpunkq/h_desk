class Task < ActiveRecord::Base
  belongs_to :user
  accepts_nested_attributes_for :user
  #attr_accessible :title, :text

  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: { minimum: 5 }

end
