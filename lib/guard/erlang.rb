require 'guard/guard'

module Guard
  class Erlang < Guard
    def run_all
    end

    def run_on_change(paths)
      paths.each do |x|
        puts "Compile erlang file #{x}"
        output = `erlc -o ebin #{x}`
        puts "================ \e[31mERROR\e[0m ================" unless $?.success?
        puts output unless $?.success?
      end
    end
  end
end
