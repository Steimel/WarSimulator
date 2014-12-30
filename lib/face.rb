class Face
  attr_reader :name, :value

  FACE_NAME_ACE = 'A'
  FACE_NAME_KING = 'K'
  FACE_NAME_QUEEN = 'Q'
  FACE_NAME_JACK = 'J'

  def initialize(value)
    @value = value
    @name = Face::value_to_name(@value)
  end

  def is_ace?
    @name == FACE_NAME_ACE
  end

  def is_two?
    @value == 2
  end

  def self.value_to_name(value)
    return FACE_NAME_JACK if value == 11
    return FACE_NAME_QUEEN if value == 12
    return FACE_NAME_KING if value == 13
    return FACE_NAME_ACE if value == 14
    return value.to_s
  end
end