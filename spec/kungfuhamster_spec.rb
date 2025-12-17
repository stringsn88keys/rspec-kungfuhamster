require_relative '../lib/rspec_kung_fu_hamster.rb'
describe RspecKungFuHamster::Formatter do
  100.times do |i|
    it { expect(i).to eq i }
  end
  it { expect(RspecKungFuHamster::Formatter::KUNG_FU_HAMSTER.length).to eq 6 }
end
