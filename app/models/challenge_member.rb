class ChallengeMember < ApplicationRecord
  belongs_to :challenge
  belongs_to :user

  enum approve: { no: 0, yes: 1 }

  validates :approve, presence: true

  scope :active_members, -> { where(approve: :yes) }
  scope :not_active_members, -> { where(approve: :no) }
  scope :active_members_for_challenge, ->(challenge) { where(challenge: challenge, approve: yes) }
end
