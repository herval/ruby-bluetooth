# Loads mkmf which is used to make makefiles for Ruby extensions
require 'mkmf'

p "extconf!"


# Give it a name
extension_name = 'ruby_bluetooth'

# dir_config(extension_name)

case RUBY_PLATFORM
  when /linux/
    if have_library('bluetooth')
      create_makefile(extension_name, 'lib/bluetooth_linux')
    end
  when /darwin/
      p "darwin!"
      create_makefile(extension_name, 'lib/bluetooth_macosx')
  when /(win32|mingw32)/
    if find_header('Ws2bth.h', 'c:\archiv~1\micros~2\include')
      create_makefile(extension_name, 'lib/bluetooth_win32')
    end
end
