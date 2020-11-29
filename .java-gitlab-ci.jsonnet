local exercism_projects = std.map(function(x) std.strReplace(x, '/', ''), std.split(std.extVar('exercism_projects'), '\n'));
local lang = std.extVar('lang');

local JavaTestJob(name) = {
  ['.' + lang + '-' + name + '-gitlab-ci.yml']: {
    default: {
      image: 'gradle:jdk11',
    },
    ['test-' + lang + '-' + name + '-exercism']: {
      script: [
        'cd ' + name,
        'gradle test',
      ],
    },
  },
};


std.foldl(function(x, y) x + y, std.map(JavaTestJob, exercism_projects), {})
