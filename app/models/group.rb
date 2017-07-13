class Group < ApplicationRecord
  has_many :members
  has_many :messages
  has_many :users, through: :members
  validates :name, presence: true

  def message_present
    if messages.present?
       return self.messages.last.body
    else
       return 'メッセージがありません'
    end
  end
end
