PROJECT_NAME='MY_PROJECT'
EXECUTABLE_NAME='MY_EXECUTABLE'
project(PROJECT_NAME, 'cpp',
  default_options: ['warning_level=3', 'cpp_std=c++20'])

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
