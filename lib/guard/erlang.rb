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

  class Eunit < Guard
    def run_all
    end

    def run_on_change(paths)
      paths.each do |x|
        functions = `cd ebin && #{erlang_fun} #{x}`.split
        puts `#{eunit x}` if functions.include?("test/0")
        puts "NOT FOUND test/0" unless functions.include?("test/0")
      end
    end

    private
    def erlang_fun
      "#{Gem.loaded_specs['guard-erlang'].full_gem_path}/bin/erlang_fun"
    end

    def eunit(m)
      "erl -pa #{Dir.pwd}/ebin -eval '#{m}:test()' -s init stop -noshell"
    end
  end
end
