use ExtUtils::MakeMaker;

WriteMakefile(
  NAME          => 'Data::JavaScript',
  AUTHOR        => 'Michael Stemle, Jr. <mstemle@cpan.org>',
  VERSION_FROM  => 'JavaScript.pm',
  ABSTRACT_FROM => 'JavaScript.pm',
  LICENSE       => 'perl_5',
  PREREQ_PM     => {
    'Modern::Perl' => '0',
  },
  TEST_REQUIRES => {
    'Test::More' => '0',
  },
  META_MERGE => {
    "meta-spec" => { version => 2 },
    "x_contributors" =>
      [ 'Jerrad Pierce <jpierce@cpan.org>', 'Ariel Brosh <schop cpan.org>', ],
    resources => {
      bugtracker => {
        web => 'https://github.com/manchicken/data-javascript/issues',
      },
      repository => {
        type => 'git',
        url  => 'git@github.com:manchicken/data-javascript.git',
        web  => 'https://github.com/manchicken/data-javascript',
      },
    },
  },
);
