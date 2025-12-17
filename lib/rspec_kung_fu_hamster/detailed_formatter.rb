require 'rspec_kung_fu_hamster/formatter'

module RspecKungFuHamster
  class DetailedFormatter < Formatter
    RSpec::Core::Formatters.register self,
      :example_passed,
      :example_pending,
      :example_failed,
      :example_group_started

    def initialize(output)
      @last_spec_file = nil
      super(output)
    end

    def example_group_started(notification)
      # Track the file path of the current example group
      if notification.group.metadata[:file_path]
        @last_spec_file = notification.group.metadata[:file_path]
      end
    end

    def output_hamster
      output.puts "\e[2J\e[;H" + display(hamster_and_next) + "\n" + stats_display
    end

    def stats_display
      total = @example_passed + @example_pending + @example_failed
      return "" if total == 0

      lines = []
      lines << ""  # Blank line for spacing

      # Color-coded statistics
      stats_parts = []
      stats_parts << "#{GREEN}#{@example_passed} passed#{RESET}" if @example_passed > 0
      stats_parts << "#{YELLOW}#{@example_pending} pending#{RESET}" if @example_pending > 0
      stats_parts << "#{RED}#{@example_failed} failed#{RESET}" if @example_failed > 0

      lines << "#{stats_parts.join(', ')} out of #{total} examples"

      # Display last spec file
      if @last_spec_file
        # Clean up the file path to show relative path
        display_path = @last_spec_file.sub(Dir.pwd + '/', '')
        lines << "Last file: #{display_path}"
      end

      lines.join("\n")
    end
  end
end
