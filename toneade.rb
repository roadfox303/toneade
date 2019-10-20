class Toneade
  attr_accessor :scales, :notes, :chords
  SCALE = {
    major: { id: 1, name:"Major scale" },
    nminer: { id: 2, name:"N miner scale" },
    hminer: { id: 3, name:"H miner scale" },
  }

  NOTE = [
    { degree: "I", function: "T", interval: 0, scale_id: 1, tensions:[] },
    { degree: "II", function: "_SD", interval: 2, scale_id: 1, tensions:[] },
    { degree: "III", function: "_T", interval: 4, scale_id: 1, tensions:[] },
    { degree: "IV", function: "SD", interval: 5, scale_id: 1, tensions:[] },
    { degree: "V", function: "D", interval: 7, scale_id: 1, tensions:[] },
    { degree: "VI", function: "_T", interval: 9, scale_id: 1, tensions:[] },
    { degree: "VII", function: "D", interval: 11, scale_id: 1, tensions:[] },
    { degree: "I", function: "T", interval: 0, scale_id: 2, tensions:[] },
    { degree: "II", function: "_SD", interval: 2, scale_id: 2, tensions:[] }
  ]

  CHORD = [
    { type: "5", notes: ["0","7"], category: "power" },
    { type: "M", notes: ["0","4","7"], category: "triad" },
    { type: "m", notes: ["0","3","7"], category: "triad" },
    { type: "7", notes: ["0","4","7","A"], category: "seven" },
    { type: "△7", notes: ["0","4","7","B"], category: "seven" },
    { type: "m7", notes: ["0","3","7","A"], category: "seven" },
    { type: "m△7", notes: ["0","3","7","B"], category: "seven" },
    { type: "6", notes: ["0","4","7","9"], category: "seven" },
    { type: "m6", notes: ["0","3","7","9"], category: "seven" },
    { type: "sus2", notes: ["0","2","5"], category: "sus" },
    { type: "sus4", notes: ["0","5","7"], category: "sus" },
    { type: "7sus4", notes: ["0","5","7","A"], category: "sus" }
  ]
  def initialize
    @scales = SCALE
    @notes = NOTE
    @chords = CHORD
  end
  def chords(key,value)
    @chords.find_all { |item| item[key.to_sym] == value }
  end
  def notes(key,value)
    @notes.find_all { |item| item[key.to_sym] == value }
  end
  def serach(instance)
    puts instance
    # instance.find_all { |item| item[key.to_sym] == value }
  end

end
# @scale_notes = ade.notes("scale_id",2)
# @scale_notes.find{ |item| item[:degree] == "II" }[:interval]
