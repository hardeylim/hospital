class Task < ApplicationRecord

  has_many :task_participants
  has_many :task_comments

  has_many :users, through: :task_participants

  validates :name, presence: true

  def self.tasks_by_user user_id
    from("task_participants, tasks, users").
    where("task_participants.user_id = users.id").
    where("task_participants.task_id = tasks.id").
    where("users.id = ?", user_id)
  end

  def self.active
    where(deleted_at: nil)
  end

  def self.deleted
    where("deleted at is not NULL")
  end

end