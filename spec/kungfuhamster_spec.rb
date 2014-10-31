require_relative '../lib/rspec_kung_fu_hamster.rb'
describe RspecKungFuHamster do
  100.times do |i|
    it { expect(i).to eq i }
  end
  it { expect(RspecKungFuHamster::KUNG_FU_HAMSTER.length).to eq 6 }
end
