class Challenge < ApplicationRecord
  has_many :challenge_members

  # validates :email, uniqueness: true
  has_one_attached :main_challenge_picture, dependent: :destroy
  has_one_attached :challenge_3d_model, dependent: :destroy

  enum status: { upcoming: 0, current: 1, finished: 2, archived: 4 }
  enum val: { free: 0, paid: 1 }
  enum type_of_print: { fdm: 0, sla: 1, sls: 2 }

  validates :status, :val, :type_of_print, :title, :money_prize, :members_count, presence: true
  validates :main_challenge_picture, content_type: [:png, :jpg, :jpeg]
end