class Vote < ActiveRecord::Base
  validates :voter, presence: true, uniqueness: { scope: [:votable_id, :votable_type] }
  validates :votable, presence: true
  validates :votable_type, inclusion: { in: ["Question", "Answer"] }
  validates_inclusion_of :count, :in => (-1..1)

  belongs_to :votable, polymorphic: true
  belongs_to :voter, class_name: "User"

  def up
    if count == -1 || count == 0
      self.count += 1
    end
  end

  def down
    if count == 1 || count == 0
      self.count -= 1
    end
  end
end
