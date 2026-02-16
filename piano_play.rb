use_bpm 96


# Play melody from [note, duration] pairs
define :melody do |notes, amp: 0.5|
  use_synth :piano
  notes.each do |n, d|
    if n == :r
      sleep d
    else
      play n, amp: amp, release: [d * 1.4, 0.25].max, sustain: d * 0.45
      sleep d
    end
  end
end

# Left hand: quarter-note arpeggio (4 beats)
define :lh_quarter do |notes, amp: 0.4|
  use_synth :piano
  play notes[0], amp: amp, release: 3.5
  sleep 1
  play notes[1], amp: amp * 0.85, release: 2.5
  sleep 1
  play notes[2], amp: amp * 0.85, release: 2
  sleep 1
  play notes[1], amp: amp * 0.7, release: 1.5
  sleep 1
end

# Left hand: eighth-note flowing arpeggio (4 beats)
define :lh_eighth do |notes, amp: 0.35|
  use_synth :piano
  pat = [0, 1, 2, 3, 2, 3, 2, 1]
  pat.each_with_index do |idx, i|
    a = i == 0 ? amp + 0.05 : amp
    play notes[idx % notes.length], amp: a, release: 1.0
    sleep 0.5
  end
end

# Play full 4-chord progression with given LH pattern
define :lh_prog do |chords, style, amp: 0.4|
  chords.each do |ch|
    if style == :quarter
      lh_quarter ch, amp: amp
    else
      lh_eighth ch, amp: amp
    end
  end
end

f_ch  = [:f2, :c3, :a3, :c4]
dm_ch = [:d2, :a2, :f3, :a3]
bb_ch = [:bb1, :f2, :d3, :f3]
c_ch  = [:c2, :g2, :e3, :g3]

prog = [f_ch, dm_ch, bb_ch, c_ch]


in_thread(name: :intro_lh) do
  2.times { lh_prog prog, :quarter, amp: 0.3 }
end

in_thread(name: :intro_rh) do
  intro_mel = [
    [:r, 2], [:c5, 1.5], [:a4, 0.5],
    [:f4, 1], [:g4, 1], [:a4, 2],
    [:bb4, 1.5], [:a4, 1], [:g4, 1.5],
    [:g4, 1], [:a4, 1.5], [:c5, 1.5],
    [:c5, 1], [:d5, 0.5], [:c5, 1.5], [:a4, 1],
    [:f4, 1], [:g4, 0.5], [:a4, 1.5], [:c5, 1],
    [:bb4, 1.5], [:a4, 0.5], [:g4, 1], [:f4, 1],
    [:g4, 1], [:a4, 1], [:c5, 2]
  ]
  melody intro_mel, amp: 0.4
end

sleep 32

in_thread(name: :v1_lh) do
  2.times { lh_prog prog, :quarter, amp: 0.38 }
end

in_thread(name: :v1_rh) do
  verse_mel = [
    [:c5, 0.5], [:c5, 0.5], [:a4, 0.5], [:c5, 0.5],
    [:d5, 0.5], [:c5, 1], [:r, 0.5],
    [:c5, 0.5], [:c5, 0.5], [:a4, 0.5], [:a4, 0.5],
    [:g4, 0.5], [:a4, 1], [:r, 0.5],
    [:a4, 0.5], [:a4, 0.5], [:g4, 0.5], [:a4, 0.5],
    [:bb4, 0.5], [:a4, 0.5], [:g4, 0.5], [:r, 0.5],
    [:g4, 0.5], [:a4, 0.5], [:c5, 1], [:r, 2],
    [:c5, 0.5], [:c5, 0.5], [:a4, 0.5], [:c5, 0.5],
    [:d5, 0.5], [:c5, 1], [:r, 0.5],
    [:c5, 0.5], [:a4, 0.5], [:a4, 0.5], [:g4, 0.5],
    [:a4, 1], [:r, 1],
    [:a4, 0.5], [:a4, 0.5], [:g4, 0.5], [:a4, 0.5],
    [:bb4, 0.5], [:a4, 0.5], [:g4, 0.5], [:r, 0.5],
    [:g4, 0.5], [:a4, 0.5], [:c5, 1.5], [:r, 1.5]
  ]
  melody verse_mel, amp: 0.5
end

sleep 32

in_thread(name: :pc_lh) do
  lh_prog prog, :eighth, amp: 0.38
end

in_thread(name: :pc_rh) do
  prechorus_mel = [
    [:f5, 1], [:e5, 0.5], [:d5, 0.5], [:c5, 1], [:r, 1],
    [:d5, 0.5], [:c5, 0.5], [:a4, 1], [:g4, 1], [:r, 1],
    [:bb4, 1], [:a4, 0.5], [:g4, 0.5], [:a4, 1], [:r, 1],
    [:c5, 0.5], [:d5, 0.5], [:e5, 0.5], [:f5, 1], [:r, 1.5]
  ]
  melody prechorus_mel, amp: 0.55
end

sleep 16

in_thread(name: :ch_lh) do
  2.times { lh_prog prog, :eighth, amp: 0.42 }
end

in_thread(name: :ch_rh) do
  chorus_mel = [
    [:c5, 0.5], [:c5, 0.5], [:a4, 0.5], [:c5, 0.5],
    [:d5, 0.5], [:c5, 1], [:r, 0.5],
    [:a4, 0.5], [:a4, 0.5], [:g4, 0.5], [:a4, 0.5],
    [:c5, 1], [:r, 1],
    [:a4, 0.5], [:bb4, 0.5], [:a4, 0.5], [:g4, 0.5],
    [:a4, 0.5], [:bb4, 0.5], [:a4, 0.5], [:r, 0.5],
    [:g4, 0.5], [:a4, 0.5], [:c5, 1.5], [:r, 1.5],
    [:f5, 0.5], [:e5, 0.5], [:d5, 0.5], [:c5, 0.5],
    [:d5, 1], [:r, 1],
    [:d5, 0.5], [:c5, 0.5], [:a4, 0.5], [:c5, 0.5],
    [:a4, 1], [:r, 1],
    [:bb4, 0.5], [:a4, 0.5], [:g4, 0.5], [:a4, 0.5],
    [:bb4, 1], [:r, 1],
    [:c5, 0.5], [:d5, 0.5], [:f5, 1], [:d5, 0.5],
    [:c5, 1], [:r, 0.5]
  ]
  melody chorus_mel, amp: 0.6
end

sleep 32

in_thread(name: :hook_lh) do
  2.times { lh_prog prog, :eighth, amp: 0.45 }
end

in_thread(name: :hook_rh) do
  hook_mel = [
    [:f5, 1], [:e5, 0.5], [:d5, 0.5], [:c5, 2],
    [:d5, 1], [:c5, 0.5], [:a4, 0.5], [:g4, 2],
    [:f5, 1], [:e5, 0.5], [:d5, 0.5], [:c5, 1], [:d5, 1],
    [:e5, 1], [:f5, 1], [:e5, 0.5], [:d5, 0.5], [:c5, 1],
    [:f5, 1], [:e5, 0.5], [:d5, 0.5], [:c5, 1.5], [:a4, 0.5],
    [:d5, 1], [:c5, 0.5], [:a4, 0.5], [:g4, 1], [:a4, 1],
    [:bb4, 1], [:a4, 0.5], [:g4, 0.5], [:a4, 1], [:c5, 1],
    [:d5, 0.5], [:c5, 0.5], [:a4, 1], [:c5, 2]
  ]
  melody hook_mel, amp: 0.6
end

sleep 32

in_thread(name: :outro_lh) do
  lh_prog prog, :quarter, amp: 0.3
end

in_thread(name: :outro_rh) do
  outro_mel = [
    [:f5, 1.5], [:e5, 0.5], [:d5, 0.5], [:c5, 1.5],
    [:a4, 1], [:g4, 0.5], [:a4, 1], [:c5, 1.5],
    [:bb4, 1], [:a4, 1], [:g4, 1], [:f4, 1],
    [:a4, 1.5], [:c5, 1], [:f4, 1.5]
  ]
  melody outro_mel, amp: 0.35
end

sleep 16
