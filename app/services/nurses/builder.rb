# frozen_string_literal: true

class Nurses::Builder
  def index
    # @nurses = Nurse.all
    @nurses = []
    # includes prevent N+1
    # rule of thumb. dapat walang ganitong shit sa controller
    # dapat controller simpol lng boi
    Nurse.includes(:patients).order('id DESC').each do |nurse|
      @nurses.push({
                     id: nurse.id,
                     name: nurse.user.name,
                     patients: Patients::Builder.new.format_patients(nurse.patients),
                     head_nurse: nurse.head_nurse
                   })
    end
    @nurses
  end
end
