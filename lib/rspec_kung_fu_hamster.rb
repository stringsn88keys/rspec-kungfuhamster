require 'rspec'
require 'rspec/core/formatters/base_text_formatter'

rspec_bin = $0.split('/').last

class RspecKungFuHamster < RSpec::Core::Formatters::BaseTextFormatter
  RSpec::Core::Formatters.register self,
#    :start,
#     :example_start
#    :message,
    :example_passed,
    :example_pending,
    :example_failed
#    :dump_failures

  def initialize(output)
    @index = 0
    @example_passed = 0
    @example_pending = 0
    @example_failed = 0
    super(output)
  end

  def color_positions(length)
    total = @example_passed + @example_pending + @example_failed
    passed_percent = @example_passed * length / total
    pending_percent = @example_pending * length / total

    [passed_percent, passed_percent + pending_percent, length]
  end

  GREEN = "\e[32m"
  YELLOW = "\e[33m"
  RED = "\e[31m"
  RESET = "\e[0m"

  def colorize(string)
    green, yellow, red = color_positions(string.length)
    GREEN + string[0...green] + YELLOW + string[green...yellow] + RED + string[yellow...red] + RESET
  end

  def display(strings)
    colorize(strings.join("\n"))
  end

  def output_hamster
    output.puts "\e[2J\e[;H" + display(hamster_and_next)
  end
  def example_passed(notification)
    @example_passed += 1
    output_hamster
  end
  def example_pending(notification)
    @example_pending += 1
    output_hamster
  end
  def example_failed(notification)
    @example_failed += 1
    output_hamster
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
