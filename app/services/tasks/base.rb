class Tasks::Base
  include Tasks::Exceptions

  # attr_accessor =  GETTER/SETTER
  # attrr_eader = getter
  # attr_setter = setter

  attr_reader :errors

  def initialize task,user
    @task = task
    @user = user
    @errors = []
  end

  def role
    @role ||= Role.joins(:task_participants)
      .where("task_participants.user_id = ?", @user.id)
      .where("task_participants.task_id = ?", @task.id).first
  end

end