class Participants::Builder

  def build_participants task
    participants = []
    task.task_participants.each do |participant|
      participants.push build_participant_details(participant)
    end
    participants
  end

  def build_participant_details participant
    {
      user_id: participant.user.id,
      role: "WERWERWER",
      full_name: participant.user.full_name 
    }
  end

end