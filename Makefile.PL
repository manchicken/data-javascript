use ExtUtils::MakeMaker;

WriteMakefile(
  NAME          => 'Data::JavaScript',
  AUTHOR        => 'Michael Stemle, Jr. <mstemle@cpan.org>',
  VERSION_FROM  => 'lib/Data/JavaScript.pm',
  ABSTRACT_FROM => 'lib/Data/JavaScript.pm',
  LICENSE       => 'perl_5',
  PREREQ_PM =>
    { 'Modern::Perl' => '0', 'Readonly' => '0', 'Scalar::Util' => '0' },
  TEST_REQUIRES => {
    'Devel::Cover'             => '0',
    'FindBin'                  => '0',
    'Test2::V0'                => '0',
    'Test2::Tools::PerlCritic' => '0',
  },
  META_MERGE => {
    'meta-spec' => { version => 2 },
    'x_contributors' =>
      [ 'Jerrad Pierce <jpierce@cpan.org>', 'Ariel Brosh <schop cpan.org>', ],
    resources => {
      bugtracker =>
        { web => 'https://github.com/manchicken/data-javascript/issues', },
      repository => {
        type => 'git',
        url  => 'git@github.com:manchicken/data-javascript.git',
        web  => 'https://github.com/manchicken/data-javascript',
      },
    },
  },
);
