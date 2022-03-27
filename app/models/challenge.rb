class Challenge < ApplicationRecord
  has_many :challenge_members

  enum status: { upcoming: 0, current: 1, finished: 2, arhived: 4 }
  enum val: { free: 0, paid: 1 }
  enum type_of_print: { fdm: 0, sla: 1, sls: 2 }

  validates :status, :val, :type_of_print, :title, :money_prize, :members_count, presence: true
end