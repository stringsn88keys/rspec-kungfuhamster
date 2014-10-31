require 'rspec'
 require 'rspec/core/formatters/base_text_formatter'

rspec_bin = $0.split('/').last

class RspecKungFuHamster < RSpec::Core::Formatters::BaseTextFormatter
  RSpec::Core::Formatters.register self,
#    :start,
#     :example_start
#    :message,
    :example_passed
#    :example_pending,
#    :example_failed,
#    :dump_failures

  def initialize(output)
    @index = 0
    super(output)
  end

  def example_passed(notification)
    output.puts "\e[2J\e[;H" << hamster_and_next.join("\n")
  end
  def example_failed(notification)
    output.puts "\e[2J\e[;H" << hamster_and_next.join("\n")
  end

  def hamster_and_next
    KUNG_FU_HAMSTER[@index % KUNG_FU_HAMSTER.length].tap { @index += 1 }
  end

  KUNG_FU_HAMSTER = [
  [
    "    ()__()     ",
    "    / o o\\  |  ",
    "   |' =Y=';-|  ",
    "   { \\  / }    ",
    "    mmm mmm    "
],[
    "    ()__()     ",
    "    / o o\\   ; ",
    "   |' =Y=';-/  ",
    "   { \\  / }    ",
    "    mmm mmm    "
],[
    "    ()__()     ",
    "    / o o\\     ",
    "   |' =Y=';----",
    "   { \\  / }    ",
    "    mmm mmm    "
],[
    "    ()__()     ",
    "    / o o\\     ",
    "   |' =Y=';-\\  ",
    "   { \\  / }  \\ ",
    "    mmm mmm    "
],[
    "    ()__()     ",
    "    / o o\\     ",
    "   |' =Y=';----",
    "   { \\  / }    ",
    "    mmm mmm    "
],[
    "    ()__()     ",
    "    / o o\\ \\   ",
    "   |' =Y=';-\\  ",
    "   { \\  / }    ",
    "    mmm mmm    "
]]

  DEAD_HAMSTER = [
    "    ()__()     ",
    "    / X X\\  |  ",
    "   |' =Y=';-|  ",
    "   { \\  / }    ",
    "    mmm mmm    "
  ]
end
