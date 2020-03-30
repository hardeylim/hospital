class Role < ApplicationRecord

  has_many :task_participants

  def self.by_user_task user_id, task_id
    from("roles, task_participants").
    where("roles.id = task_participants.role_id").
    where("task_participants.user_id = ?", user_id).
    where("task_participants.task_id = ?", task_id).first
  end

end