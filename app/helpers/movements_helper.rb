module MovementsHelper
  def status_updated_at(element)
    audit = element.audits.select do |k| 
      k[:audited_changes][:status].present? && 
      k[:audited_changes][:status].second == element.status 
    end
    audit.first.present? ? audit.first.audited_changes[:updated_at].second : nil 
  end

  def alert(updated_at, element)
    time = STATUS_CHANGE_DURATION[element.aasm.events.first.to_sym] * (24*60*60) 
    if(Time.now - updated_at) > time
      UserMailer.alert_report().deliver
      return true
    else
      return false
    end

  end

end
