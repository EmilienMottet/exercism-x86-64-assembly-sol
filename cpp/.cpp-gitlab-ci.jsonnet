local exercism_projects = std.map(function(x) std.strReplace(x, '/', ''), std.split(std.extVar('exercism_projects'), '\n'));
local lang = std.extVar('lang');

local CppTestJob(name) = {
  ['.' + lang + '-' + name + '-gitlab-ci.yml']: {
    default: {
      image: 'rikorose/gcc-cmake:latest',
    },
    ['test-' + lang + '-' + name + '-exercism']: {
      script: [
        'cd ' + name,
        'mkdir build',
        'cd build',
        'cmake -G "Unix Makefiles" ..',
        'make'
      ],
    },
  },
};


std.foldl(function(x, y) x + y, std.map(CppTestJob, exercism_projects), {})
