class User < ApplicationRecord

  has_many :task_participants
  has_many :tasks, through: :task_participants
  has_many :task_comments

  has_many :sessions
  
  validates :first_name, presence: true
  validates :email, presence: true, uniqueness: true, format: /\w+@\w+\.{1}[a-zA-Z]{2,}/

  # def self.tasks user_id
  #   Task.tasks_by_user(user_id)
  # end

  def full_name
    "#{first_name} #{last_name}"
  end

end