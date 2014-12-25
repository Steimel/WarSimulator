class Face
  attr_reader :name, :value

  FACE_NAME_ACE = 'A'
  FACE_NAME_KING = 'K'
  FACE_NAME_QUEEN = 'Q'
  FACE_NAME_JACK = 'J'

  def initialize(name, value)
    @name = name
    @value = value
  end

  def is_ace?
    @name == FACE_NAME_ACE
  end

  def is_two?
    @value == 2
  end
end