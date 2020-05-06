# Before
class Person
  attr_reader :name
  attr_accessor :office_area_code, :office_number

  def telephone_number
    "(#{@office_area_code})#{office_number}"
  end
end

# After
class Person
  attr_reader :name, :office_telephone

  def initialize
    @office_telephone = TelephoneNumber.new
  end

  def telephone_number
    office_telephone.telephone_number
  end

  def office_area_code
    office_telephone.area_code
  end

  def office_area_code=(arg)
    office_telephone.area_code = arg
  end

  def office_number
    office_telephone.number
  end

  def office_number=(arg)
    office_telephone.number = arg
  end
end

class TelephoneNumber
  attr_accessor :area_code, :number

  def telephone_number
    "(#{area_code})#{number}"
  end
end
