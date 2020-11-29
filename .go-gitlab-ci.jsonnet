local exercism_projects = std.map(function(x) std.strReplace(x, '/', ''), std.split(std.extVar('exercism_projects'), '\n'));
local lang = std.extVar('lang');

local GoTestJob(name) = {
  ['.' + lang + '-' + name + '-gitlab-ci.yml']: {
    default: {
      image: 'golang:latest',
    },
    ['test-' + lang + '-' + name + '-exercism']: {
      script: [
        'cd ' + name,
        'go test',
      ],
    },
  },
};


std.foldl(function(x, y) x + y, std.map(GoTestJob, exercism_projects), {})
