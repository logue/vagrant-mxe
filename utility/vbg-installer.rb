module Utility

    # Custom Debian installer for Vbguest
    class DebianCustom < VagrantVbguest::Installers::Debian
    
        # Adds snapshot archive repo to sources
        def install(opts=nil, &block)
            cmd = <<~SCRIPT
                cat <<EOF > /etc/apt/sources.list.d/snapshot_archive.list
                deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/20200402T150804Z/ buster main
                deb [check-valid-until=no] http://snapshot.debian.org/archive/debian-security/20200402T205302Z/ buster/updates main
                EOF
            SCRIPT

            communicate.sudo(cmd, opts, &block)

            super
        end

        def cleanup
            # Uncomment to remove the snapshot archive repo from sources
            # communicate.sudo('rm /etc/apt/sources.list.d/snapshot_archive.list')
            
            super
        end
    end
end