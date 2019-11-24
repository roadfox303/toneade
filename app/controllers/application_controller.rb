class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  def after_sign_in_path_for(resource)
    user_path(id: current_user.id)
  end

  def toneade_const
    @scales = SCALE
    @scales_list = generate_form_select(SCALE,:name)
    gon.scales = SCALE

    @keys = KEY
    @keys_list = generate_form_select(KEY,:name)
    gon.keys = KEY

    @bpm_list = []
    [*20..240].map{ |bpm|
      @bpm_list << ["♩#{bpm}",bpm]
    }

    @beats = BEAT
    gon.beats = BEAT
    @beats_list = generate_form_select(BEAT,:name)

    @notes = NOTE
    gon.notes = NOTE

    @chords = CHORD
    gon.chords = CHORD
    # @test = @scales.find{ |item| item[:name] == "N miner scale" }
    # @test2 = @chords.find_all{ |item| item[:notes].include?("9") }
    @tr_types = TR_TYPE
    @tr_type_list = generate_form_select(TR_TYPE,:name)
    gon.tr_types = @tr_type_list

    # @dv_types = DV_TYPE
    # @dv_type_list = generate_form_select(DV_TYPE,:name)
    # gon.dv_types = @dv_type_list
    @instrument_categorys = CATEGORY
    @inst_category_list = generate_form_select(CATEGORY,:name)
    gon.inst_categorys = @inst_category_list

    @instrument_categorys = CATEGORY
    @inst_category_list = generate_form_select(CATEGORY,:name)
    gon.inst_categorys = @inst_category_list

    @presets = PRESET
    @preset_list = generate_form_select(PRESET,:name)
    gon.presets = @preset_list

  end

  def generate_form_select(hash,key)
    hash.map {|item| [item[key],(item[:id])] }
  end

  SCALE = [
    { id: 1, name:"Major" },
    { id: 2, name:"Natural Minor" },
    { id: 3, name:"Harmonic Minor" },
    { id: 4, name:"Merodic Minor" },
  ]
  KEY = [
    { id: 1, name:"C", octave:[0,12,24,36,48,60,72,84,96,108,120], interval:0 },
    { id: 2, name:"C#", octave:[1,13,25,37,49,61,73,85,97,109,121], interval:1 },
    { id: 3, name:"D", octave:[2,14,26,38,50,62,74,86,98,110,122], interval:2 },
    { id: 4, name:"D#", octave:[3,15,27,39,51,63,75,87,99,111,123], interval:3 },
    { id: 5, name:"E", octave:[4,16,28,40,52,64,76,88,100,112,124], interval:4 },
    { id: 6, name:"F", octave:[5,17,29,41,53,65,77,89,101,113,125], interval:5 },
    { id: 7, name:"F#", octave:[6,18,30,42,54,66,78,90,102,114,126], interval:6 },
    { id: 8, name:"G", octave:[7,19,31,43,55,67,79,91,103,115,127], interval:7 },
    { id: 9, name:"G#", octave:[8,20,32,44,56,68,80,92,104,116], interval:8 },
    { id: 10, name:"A", octave:[9,21,33,45,57,69,81,93,105,117], interval:9 },
    { id: 11, name:"A#", octave:[10,22,34,46,58,70,82,94,106,118], interval:10 },
    { id: 12, name:"B", octave:[11,23,35,47,59,71,83,95,107,119], interval:11 }
  ]

  BEAT = [
    { id: 1, name:"4/4" }
  ]

  NOTE = [
    { id: 1, degree: "I", function: "T", interval: 0, scale_id: 1, triad_id: 2, seventh_id: 7, tensions:[] },
    { id: 2, degree: "II", function: "s", interval: 2, scale_id: 1, triad_id: 3, seventh_id: 8, tensions:[] },
    { id: 3, degree: "III", function: "t", interval: 4, scale_id: 1, triad_id: 3, seventh_id: 8, tensions:[] },
    { id: 4, degree: "IV", function: "S", interval: 5, scale_id: 1, triad_id: 2, seventh_id: 7, tensions:[] },
    { id: 5, degree: "V", function: "D", interval: 7, scale_id: 1, triad_id: 2, seventh_id: 6, tensions:[] },
    { id: 6, degree: "VI", function: "t", interval: 9, scale_id: 1, triad_id: 3, seventh_id: 8, tensions:[] },
    { id: 7, degree: "VII", function: "d", interval: 11, scale_id: 1, triad_id: 4, seventh_id: 10, tensions:[] },
    { id: 8, degree: "I", function: "Tm", interval: 0, scale_id: 2, triad_id: 3, seventh_id: 8, tensions:[] },
    { id: 9, degree: "II", function: "sm", interval: 2, scale_id: 2, triad_id: 4, seventh_id: 10, tensions:[] },
    { id: 10, degree: "III", function: "tm", interval: 3, scale_id: 2, triad_id: 2, seventh_id: 7, tensions:[] },
    { id: 11, degree: "IV", function: "Sm", interval: 5, scale_id: 2, triad_id: 3, seventh_id: 8, tensions:[] },
    { id: 12, degree: "V", function: "Dm", interval: 7, scale_id: 2, triad_id: 3, seventh_id: 8, tensions:[] },
    { id: 13, degree: "VI", function: "sm", interval: 8, scale_id: 2, triad_id: 2, seventh_id: 7, tensions:[] },
    { id: 14, degree: "VII", function: "sm", interval: 10, scale_id: 2, triad_id: 2, seventh_id: 6, tensions:[] },
    { id: 15, degree: "I", function: "Tm", interval: 0, scale_id: 3, triad_id: 3, seventh_id: 9, tensions:[] },
    { id: 16, degree: "II", function: "sm", interval: 2, scale_id: 3, triad_id: 4, seventh_id: 10, tensions:[] },
    { id: 17, degree: "III", function: "tm", interval: 3, scale_id: 3, triad_id: 5, seventh_id: 20, tensions:[] },
    { id: 18, degree: "IV", function: "Sm", interval: 5, scale_id: 3, triad_id: 3, seventh_id: 8, tensions:[] },
    { id: 19, degree: "V", function: "D", interval: 7, scale_id: 3, triad_id: 2, seventh_id: 6, tensions:[] },
    { id: 20, degree: "VI", function: "sm", interval: 8, scale_id: 3, triad_id: 2, seventh_id: 7, tensions:[] },
    { id: 21, degree: "VII", function: "d", interval: 11, scale_id: 3, triad_id: 4, seventh_id: 12, tensions:[] },
    { id: 22, degree: "I", function: "Tm", interval: 0, scale_id: 4, triad_id: 3, seventh_id: 9, tensions:[] },
    { id: 23, degree: "II", function: "s", interval: 2, scale_id: 4, triad_id: 3, seventh_id: 8, tensions:[] },
    { id: 24, degree: "III", function: "tm", interval: 3, scale_id: 4, triad_id: 5, seventh_id: 20, tensions:[] },
    { id: 25, degree: "IV", function: "S", interval: 5, scale_id: 4, triad_id: 2, seventh_id: 6, tensions:[] },
    { id: 26, degree: "V", function: "D", interval: 7, scale_id: 4, triad_id: 2, seventh_id: 6, tensions:[] },
    { id: 27, degree: "VI", function: "tm", interval: 9, scale_id: 4, triad_id: 4, seventh_id: 10, tensions:[] },
    { id: 28, degree: "VII", function: "d", interval: 11, scale_id: 4, triad_id: 4, seventh_id: 10, tensions:[] },

  ]

  CHORD = [
    { id: 1, type: "5", notes: [0,7], category: "power" },
    { id: 2, type: "△", notes: [0,4,7], category: "triad" },
    { id: 3, type: "m", notes: [0,3,7], category: "triad" },
    { id: 4, type: "dim", notes: [0,3,6], category: "dim" },
    { id: 5, type: "aug", notes: [0,4,8], category: "aug" },
    { id: 6, type: "7", notes: [0,4,7,10], category: "seven" },
    { id: 7, type: "△7", notes: [0,4,7,11], category: "seven" },
    { id: 8, type: "m7", notes: [0,3,7,10], category: "seven" },
    { id: 9, type: "m△7", notes: [0,3,7,11], category: "seven" },
    { id: 10, type: "m7(-5)", notes: [0,3,6,10], category: "seven" },
    { id: 11, type: "m7(+5)", notes: [0,3,8,10], category: "seven" },
    { id: 12, type: "dim7", notes: [0,3,6,9], category: "dim" },
    { id: 13, type: "6", notes: [0,4,7,9], category: "seven" },
    { id: 14, type: "m6", notes: [0,3,7,9], category: "seven" },
    { id: 15, type: "sus2", notes: [0,2,5], category: "sus" },
    { id: 16, type: "7sus2", notes: [0,2,7,10], category: "sus" },
    { id: 17, type: "sus4", notes: [0,5,7], category: "sus" },
    { id: 18, type: "7sus4", notes: [0,5,7,10], category: "sus" },
    { id: 19, type: "aug7", notes: [0,4,8,10], category: "aug" },
    { id: 20, type: "aug△7", notes: [0,4,8,11], category: "aug" },
    { id: 21, type: "add9", notes: [0,4,7,14], category: "extention" },
    { id: 22, type: "madd9", notes: [0,3,7,14], category: "extention" },
    { id: 23, type: "9", notes: [0,4,7,10,14], category: "extention" },
    { id: 24, type: "7(+9)", notes: [0,4,7,10,15], category: "extention" },
    { id: 25, type: "7(-9)", notes: [0,4,7,10,13], category: "extention" },
    { id: 26, type: "△9", notes: [0,4,7,11,14], category: "extention" },
    { id: 27, type: "m9", notes: [0,3,7,10,14], category: "extention" },
    { id: 28, type: "m△9", notes: [0,3,7,11,14], category: "extention" },
    { id: 29, type: "9(-5)", notes: [0,4,6,10,14], category: "extention" },
    { id: 30, type: "69", notes: [0,4,7,9,14], category: "extention" },
    { id: 31, type: "9sus4", notes: [0,5,7,10,14], category: "extention" },
    { id: 32, type: "7(11)", notes: [0,4,7,10,17], category: "extention" },
    { id: 33, type: "7(+11)", notes: [0,4,7,10,18], category: "extention" },
    { id: 34, type: "m7(-5,11)", notes: [0,3,6,10,17], category: "seven" },
    { id: 35, type: "11", notes: [0,4,7,10,14,17], category: "extention" },
    { id: 36, type: "m11", notes: [0,3,7,10,14,17], category: "extention" },
    { id: 37, type: "7(13)", notes: [0,4,7,10,14,21], category: "extention" },
    { id: 38, type: "△9(+11)", notes: [0,4,7,10,14,18], category: "extention" },
    { id: 39, type: "9(+11)", notes: [0,4,7,10,14,18], category: "extention" },
    { id: 40, type: "13", notes: [0,4,7,10,14,17,21], category: "extention" },
  ]





  SUBSTITUTE = [
    {id:1, scale:"major", }
  ]

  TR_TYPE = [
    { id: 1, name: "Chord" },
    { id: 2, name: "Melody" },
    { id: 3, name: "Rythm" }
  ]
  DV_TYPE = [
    { id: 1, name:"Synth" },
    { id: 2, name:"Sampler" }
  ]
  CATEGORY = [
    { id: 1, name:"Piano" },
    { id: 2, name:"Keyboard" },
    { id: 3, name:"Bass" },
    { id: 5, name:"Pluck" },
    { id: 6, name:"Lead" },
    { id: 7, name:"Poly" },
    { id: 8, name:"Strings" },
    { id: 9, name:"Pad" },
    { id: 10, name:"Brass" },
    { id: 11, name:"Woodwind" },
    { id: 12, name:"Bell" },
    { id: 13, name:"Poly Synth" },
    { id: 14, name:"SFX" },
    { id: 15, name:"Drum" },
  ]
  PRESET = [
    { id: 1, name:"Sin Wave", device_type: "Synth" ,category:"Poly Synth" , data:{}},
    { id: 2, name:"Piano" ,category:"Piano" , data:{}},
  ]
end
