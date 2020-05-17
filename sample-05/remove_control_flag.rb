# Before
def check_security(people)
  found = false
  people.each do |person|
    unless found
      if person == 'Don'
        send_alert
        found = true
      end
      if person == 'John'
        send_alert
        found = true
      end
    end
  end
end

# After
def check_security(people)
  people.each do |person|
    unless found
      if person == 'Don' || person == 'John'
        send_alert
        break
      end
    end
  end
end
