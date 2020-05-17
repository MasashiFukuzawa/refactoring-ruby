# Before
def found_miscreant(people)
  people.each do |person|
    if person == 'Don'
      send_alert
      return 'Don'
    end
    if person == 'John'
      send_alert
      return 'John'
    end
  end
  ''
end

def check_security(people)
  found = found_miscreant(people)
  some_later_code(found)
end

# After
def found_person(people)
  people.each do |person|
    return 'Don' if person == 'Don'
    return 'John' if person == 'John'
  end
  nil
end

def send_alert_if_miscreant_in(people)
  send_alert unless found_person(people).nil?
end

def check_security(people)
  send_alert_if_miscreant_in(people)
  found = found_person(people)
  some_later_code(found)
end
