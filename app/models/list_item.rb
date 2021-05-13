class ListItem < ApplicationRecord
  validates_length_of :description, minimum: 3, maximum: 120
  validates_uniqueness_of :description

  scope :incomplete, -> { where(complete: false) }
  scope :recently_completed, -> { where(complete: true).where('updated_at > ?', 1.week.ago) }

  def mark_as_complete
    update_attribute(:complete, true)
  end

end
