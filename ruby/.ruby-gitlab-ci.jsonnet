local exercism_projects = std.map(function(x) std.strReplace(x, '/', ''), std.split(std.extVar('exercism_projects'), '\n'));
local lang = std.extVar('lang');

local RubyTestJob(name) = {
  ['.' + lang + '-' + name + '-gitlab-ci.yml']: {
    default: {
      image: 'ruby:latest',
    },
    ['test-' + lang + '-' + name + '-exercism']: {
      script: [
        'cd ' + name,
        'gem install minitest',
        'ruby *_test.rb',
      ],
    },
  },
};


std.foldl(function(x, y) x + y, std.map(RubyTestJob, exercism_projects), {})
