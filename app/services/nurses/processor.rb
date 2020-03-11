class Nurses::Processor

  attr_reader :errors

  def initialize
    @errors = []
  end

  def create nurse_params
    User.transaction do 
      @user = User.create(nurse_params)
      Nurse.create(user_id: @user.id)
    end
  rescue ActiveRecord::RecordInvalid => e
    @errors.push e
  end

end