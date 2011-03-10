class Order < ActiveRecord::Base
  belongs_to :supplier

  def order(ordered_by)
    self.ordered_at = Date.today
    self.ordered_by = ordered_by
    self.save
  end

  def cancel(remarks)
    self.ordered_at, order.ordered_by = nil
    self.remarks = remarks
    self.save
  end
end
