class Tasks::Updator < Base

  def update obj_params
    raise InvalidRoleError if role.name != 'Creator'
    raise InvalidParameterError unless @task.update(obj_params)
    @task
  rescue InvalidRoleError => e
    @errors.push e
  rescue InvalidParameterError => e
    @errors.push e
  end

end