class Comments::Builder

  def build_comments task
    comments = []
    task.task_comments.each do |comment|
      comments.push(comment_details(comment))
    end
    comments
  end

  def comment_details comment
    comment.attributes.merge({
      full_name: comment.user.full_name
    })
  end

end