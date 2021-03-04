class Group < ApplicationRecord
  has_many :group_users
  has_many :users, through: :group_users
  has_many :messeges

  validates :name, presence: true, uniqueness: true

  def show_last_messege
    if (last_messege = messeges.last).present?
      if last_messege.content?
        last_messege.content
      else
        '画像が投稿されています'
      end
    else
      'まだメッセージはありません。'
    end
  end
  
end
