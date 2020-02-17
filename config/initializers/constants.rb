# frozen_string_literal: true

module Constants
  ## Constants::NUMでアクセスできる
  SCALE = {
    major: { id: 1, name: 'Major scale' },
    nminer: { id: 2, name: 'N miner scale' },
    hminer: { id: 3, name: 'H miner scale' }
  }.freeze

  NOTE = [
    { degree: 'I', function: 'T', interval: 0, scale_id: 1, tensions: [] },
    { degree: 'II', function: '_SD', interval: 2, scale_id: 1, tensions: [] },
    { degree: 'III', function: '_T', interval: 4, scale_id: 1, tensions: [] },
    { degree: 'IV', function: 'SD', interval: 5, scale_id: 1, tensions: [] },
    { degree: 'V', function: 'D', interval: 7, scale_id: 1, tensions: [] },
    { degree: 'VI', function: '_T', interval: 9, scale_id: 1, tensions: [] },
    { degree: 'VII', function: 'D', interval: 11, scale_id: 1, tensions: [] },
    { degree: 'I', function: 'T', interval: 0, scale_id: 2, tensions: [] },
    { degree: 'II', function: '_SD', interval: 2, scale_id: 2, tensions: [] }
  ].freeze

  CHORD = [
    { type: '5', notes: %w[0 7], category: 'power' },
    { type: 'M', notes: %w[0 4 7], category: 'triad' },
    { type: 'm', notes: %w[0 3 7], category: 'triad' },
    { type: '7', notes: %w[0 4 7 A], category: 'seven' },
    { type: '△7', notes: %w[0 4 7 B], category: 'seven' },
    { type: 'm7', notes: %w[0 3 7 A], category: 'seven' },
    { type: 'm△7', notes: %w[0 3 7 B], category: 'seven' },
    { type: '6', notes: %w[0 4 7 9], category: 'seven' },
    { type: 'm6', notes: %w[0 3 7 9], category: 'seven' },
    { type: 'sus2', notes: %w[0 2 5], category: 'sus' },
    { type: 'sus4', notes: %w[0 5 7], category: 'sus' },
    { type: '7sus4', notes: %w[0 5 7 A], category: 'sus' }
  ].freeze
end
