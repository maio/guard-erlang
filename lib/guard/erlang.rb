require 'guard/guard'

module Guard
  class Erlang < Guard
    def run_all
    end

    def run_on_change(paths)
      paths.each do |x|
        puts "erlc #{x} -o ebin"
      end
    end
  end
end
