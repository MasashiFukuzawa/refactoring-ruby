# Before
class Person
  attr_reader :name, :office_telephone

  def initialize
    @office_telephone = TelephoneNumber.new
  end

  def telephone_number
    @office_telephone.telephone_number
  end
end

class TelephoneNumber
  attr_accessor :area_code, :number

  def telephone_number
    "(#{area_code})#{number}"
  end
end

martin = Person.new
martin.office_telephone.area_code = '781'

# After
class Person
  attr_reader :name, :office_telephone

  def telephone_number
    "(#{area_code})#{number}"
  end

  def area_code
    @office_telephone.area_code
  end

  def area_code=(arg)
    @office_telephone.area_code = arg
  end

  def number
    @office_telephone.number
  end

  def number=(arg)
    @office_telephone.number = arg
  end
end

martin = Person.new
martin.area_code = '781'
