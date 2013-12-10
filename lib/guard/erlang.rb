require 'guard/guard'

module Guard
  class Erlang < Guard
    def run_all
      puts `erl -pa ebin -make`
    end

    def run_on_change(paths)
      paths.each do |x|
        ::Guard::Notifier.notify("summary", title: "title", image: :pending)
        puts "Compile erlang file #{x}"
        output = `erlc -DTEST -pa ebin -o ebin -I include #{x}`
        if $?.success?
          ::Guard::Notifier.notify("summary", title: "title", image: :success)
        else
          puts "================ \e[31mERROR\e[0m ================"
          ::Guard::Notifier.notify("summary", title: "title", image: :failed)
        end
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
          output = `#{eunit x}`

          if $?.success?
            puts "OK"
            ::Guard::Notifier.notify("summary", title: "eunit", image: :success)
          else
            puts "ERROR"
            ::Guard::Notifier.notify("summary", title: "eunit", image: :failed)
          end

          puts output
        end

        puts "================ MOD \e[31m#{x}\e[0m NOT TEST CASE ================" unless functions.include?("test/0")
      end
    end

    private
    def erlang_fun
      "#{Gem.loaded_specs['guard-erlang'].full_gem_path}/bin/erlang_fun"
    end

    def eunit(m)
      "./rebar eunit suites=#{m}"
    end
  end
end
