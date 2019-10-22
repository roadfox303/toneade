class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  SCALE = [
    { id: 1, name:"Major" },
    { id: 2, name:"Natural Minor" },
    { id: 3, name:"Harmonic Minor" },
    { id: 4, name:"Merodic Minor" },
  ]
  KEY = [
    { id: 1, name:"C", octave:[0,12,24,36,48,60,72,84,96,108,120] },
    { id: 2, name:"C#", octave:[1,13,25,37,49,61,73,85,97,109,121] },
    { id: 3, name:"D", octave:[2,14,26,38,50,62,74,86,98,110,122] },
    { id: 4, name:"D#", octave:[3,15,27,39,51,63,75,87,99,111,123] },
    { id: 5, name:"E", octave:[4,16,28,40,52,64,76,88,100,112,124] },
    { id: 6, name:"F", octave:[5,17,29,41,53,65,77,89,101,113,125] },
    { id: 7, name:"F#", octave:[6,18,30,42,54,66,78,90,102,114,126] },
    { id: 8, name:"G", octave:[7,19,31,43,55,67,79,91,103,115,127] },
    { id: 9, name:"G#", octave:[8,20,32,44,56,68,80,92,104,116] },
    { id: 10, name:"A", octave:[9,21,33,45,57,69,81,93,105,117] },
    { id: 11, name:"A#", octave:[10,22,34,46,58,70,82,94,106,118] },
    { id: 12, name:"B", octave:[11,23,35,47,59,71,83,95,107,119] }
  ]
  BEAT = [
    { id: 1, name:"4/4" },
    { id: 2, name:"3/4" }
  ]

  NOTE = [
    { id: 1, degree: "I", function: "T", interval: 0, scale_id: 1, tensions:[] },
    { id: 2, degree: "II", function: "_SD", interval: 2, scale_id: 1, tensions:[] },
    { id: 3, degree: "III", function: "_T", interval: 4, scale_id: 1, tensions:[] },
    { id: 4, degree: "IV", function: "SD", interval: 5, scale_id: 1, tensions:[] },
    { id: 5, degree: "V", function: "D", interval: 7, scale_id: 1, tensions:[] },
    { id: 6, degree: "VI", function: "_T", interval: 9, scale_id: 1, tensions:[] },
    { id: 7, degree: "VII", function: "D", interval: 11, scale_id: 1, tensions:[] },
    { id: 8, degree: "I", function: "T", interval: 0, scale_id: 2, tensions:[] },
    { id: 9, degree: "II", function: "_SD", interval: 2, scale_id: 2, tensions:[] }
  ]

  CHORD = [
    { id: 1, type: "5", notes: ["0","7"], category: "power" },
    { id: 2, type: "M", notes: ["0","4","7"], category: "triad" },
    { id: 3, type: "m", notes: ["0","3","7"], category: "triad" },
    { id: 4, type: "7", notes: ["0","4","7","A"], category: "seven" },
    { id: 5, type: "△7", notes: ["0","4","7","B"], category: "seven" },
    { id: 6, type: "m7", notes: ["0","3","7","A"], category: "seven" },
    { id: 7, type: "m△7", notes: ["0","3","7","B"], category: "seven" },
    { id: 8, type: "6", notes: ["0","4","7","9"], category: "seven" },
    { id: 9, type: "m6", notes: ["0","3","7","9"], category: "seven" },
    { id: 10, type: "sus2", notes: ["0","2","5"], category: "sus" },
    { id: 11, type: "sus4", notes: ["0","5","7"], category: "sus" },
    { id: 12, type: "7sus4", notes: ["0","5","7","A"], category: "sus" }
  ]
end
