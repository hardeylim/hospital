class TaskComment < ApplicationRecord

  belongs_to :task
  belongs_to :user


  validate :check_user_participant

  def check_user_participant
    if user.task_participants.where(task_id: self.task_id).blank?
      errors.add(:base, "User does not belong to this task")
    end
  end


end