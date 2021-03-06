class Card
  attr_reader :face

  def initialize(face)
    @face = face
  end

  def compare(other_card, two_beats_ace=true)
    other_face = other_card.face
    return 0 if @face.value == other_face.value
    if two_beats_ace
      return -1 if @face.is_ace? && other_face.is_two?
      return 1 if @face.is_two? && other_face.is_ace?
    end
    return @face.value <=> other_face.value
  end

  def to_s
    face.name
  end
end