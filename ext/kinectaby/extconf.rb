require 'mkmf'

dir_config("kinectaby")

have_library('freenect')
have_library('freenect_sync')

find_header('libfreenect.h', '/usr/include', '/usr/local/include', '/usr/include/libfreenect', '/usr/local/include/libfreenect')
find_header('libfreenect_sync.h', '/usr/include', '/usr/local/include', '/usr/include/libfreenect', '/usr/local/include/libfreenect')

create_makefile("kinectaby/kinectaby")

