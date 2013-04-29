class KarmaPoint < ActiveRecord::Base
  attr_accessible :user_id, :label, :value
  belongs_to :user

  validates :user, :presence => true
  validates :value, :numericality => {:only_integer => true, :greater_than_or_equal_to => 0}
  validates :label, :presence => true

  after_save :sum_karma

  def sum_karma
    sum = self.user.karma_points.sum(:value)
    self.user.update_attribute(:karma_sum, sum)
  end
end
