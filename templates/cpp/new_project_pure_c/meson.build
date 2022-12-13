project('MY_PROJECT', 'c',
  default_options: ['warning_level=3', 'c_std=c99'])

EXECUTABLE_NAME='MY_EXECUTABLE'

src_arr = [
  'main.cpp'
]

deps_arr = [

  ]

src = []
foreach file : src_arr
  src += 'src/' + file
endforeach

deps = []
foreach dep : deps_arr
  deps += dependency(dep)
endforeach

executable(EXECUTABLE_NAME, sources: src, dependencies: deps)
