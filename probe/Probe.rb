require 'open3'
class Probe

    def run_silent(*args)
        _, _, _, t = Open3.popen3 *args
        t.value.success?

    end

    def ping(addr)
        run_silent "ping", "-c", "1", addr
    end

    def host(name, server="")
        if server.empty?
            run_silent "host-woods", name
        else
            run_silent "host-woods", name, server
        end
    end

end
