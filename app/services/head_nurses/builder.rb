# frozen_string_literal: true

class HeadNurses::Builder
  def index
    # @nurses = Nurse.all
    @head_nurses = []
    # includes prevent N+1
    # rule of thumb. dapat walang ganitong shit sa controller
    # dapat controller simpol lng boi
    #
    HeadNurse.order('id DESC').each do |head_nurse|
      @head_nurses.push({
                          id: head_nurse.id,
                          name: head_nurse.nurse.user.name
                        })
    end
    # Nurse.includes(:patients).order('id DESC').each do |nurse|
    #   @nurses.push({
    #                  id: nurse.id,
    #                  name: nurse.user.name,
    #                  patients: Patients::Builder.new.format_patients(nurse.patients),
    #                  head_nurse: nurse.head_nurse
    #                })
    # end
    @head_nurses
  end
end
