class Nurses::Assigned
  attr_reader :errors

  def initialize
    @errors = []
  end

  def assign(nurse_id, patient_id)
    patient = Patient.find_by(id: patient_id)
    nurse = Nurse.find_by(id: nurse_id)
    if patient.present? && nurse.present?
      NursePatient.find_or_create_by(patient_id: patient_id.id, nurse_id: nurse.id)
    else
      @errors.push("Invalid Request")
    end
  end 
end