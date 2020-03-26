class TaskParticipant < ApplicationRecord

  belongs_to :user
  belongs_to :task
  belongs_to :role

end