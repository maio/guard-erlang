require 'guard/guard'

module Guard
  class Erlang < Guard
    def run_all
      puts `erl -pa ebin -make`
    end

    def run_on_change(paths)
      paths.each do |x|
        puts "Compile erlang file #{x}"
        output = `erlc -pa ebin -o ebin -I include #{x}`
        puts "================ \e[31mERROR\e[0m ================" unless $?.success?
        puts output
      end
    end
  end

  class Eunit < Guard
    def run_all
    end

    def run_on_change(paths)
      paths.each do |x|
        functions = `cd ebin && #{erlang_fun} #{x}`.split

        if functions.include?("test/0")
          puts "================ MOD \e[31m#{x}\e[0m TEST RESULT ================" 
          puts `#{eunit x}` 
        end

        puts "================ MOD \e[31m#{x}\e[0m NOT TEST CASE ================" unless functions.include?("test/0")
      end
    end

    private
    def erlang_fun
      "#{Gem.loaded_specs['guard-erlang'].full_gem_path}/bin/erlang_fun"
    end

    def eunit(m)
      "erl -sname test -pa #{Dir.pwd}/ebin -eval '#{m}:test()' -s init stop -noshell"
    end
  end
end
