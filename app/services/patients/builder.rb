# frozen_string_literal: true

class Patients::Builder
  def format_patients(patients)
    res = []
    patients.each do |patient|
      res.push({
                 name: patient.user.name,
                 id: patient.id
               })
    end
    res
  end
end
