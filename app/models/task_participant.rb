class TaskParticipant < ApplicationRecord

  belongs_to :user
  belongs_to :task
  belongs_to :role

  validate :check_role_user_uniqueness

  def check_role_user_uniqueness
    if TaskParticipant.where(user_id: self.user_id, task_id: self.task_id).present?
      errors.add(:base, "You are already a participant of this task")
    end
  end
end