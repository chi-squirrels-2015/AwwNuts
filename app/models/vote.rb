class Vote < ActiveRecord::Base

  validates_uniqueness_of :voter, scope: [:votable_id, :votable_type]
  validates_inclusion_of :count, :in => (-1..1)
  validates_presence_of :votable

  belongs_to :votable, polymorphic: true
  belongs_to :voter, class_name: "User"

end
