# module Tasks
#   class Builder
#   end
# end
# initialzie is the construction in ruby
# what if meron ako 100 tasks
# sa isang task row, mag pproduce ng 5 sql
# 1 task comment
# 1 user sa nag create ng comment
# 1 task participant
# 1 user ng task particiapnt
# 1 isa sa sarili
# N+1 QUERIES
# EAGER LOADING with rails

class Tasks::Builder

  def initialize
    @tasks = []
    @participant_builder = Participants::Builder.new
    @comment_builder = Comments::Builder.new
  end

  def build_index
    # Task.includes(:task_comments, :task)
    Task.includes(task_comments: :user, task_participants: :user).each do |task|
      @tasks.push(build_task_details(task))
    end
    @tasks
  end

  def build_task_details task
    {
      id: task.id,
      name: task.name,
      comments: @comment_builder.build_comments(task),
      participants: @participant_builder.build_participants(task)
    }
  end

end