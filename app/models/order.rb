# Classify order. Lacks mass assignment protection.
class Order < ActiveRecord::Base
  belongs_to :supplier

  def order(ordered_by)
    self.ordered_at = Date.today
    self.ordered_by = ordered_by
    self.save
  end

  def cancel(remarks)
    self.ordered_at = self.ordered_by = nil
    self.remarks = remarks
    self.save
  end

  def copy
    clone = self.clone
    clone.created_at = nil
    clone.save
  end

  def remark(remarks)
    self.remarks = remarks
    self.save
  end
end
