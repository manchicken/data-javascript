use strict;
use warnings;
use ExtUtils::MakeMaker;

my %TEST_REQUIRES = (
  'Devel::Cover::Report::Coveralls' => '0',
  'Devel::Cover'                    => '0',
  'FindBin'                         => '0',
  'Test2::V0'                       => '0',
  'B::Debug'                        => '0',
  'Perl::Critic'                    => '0',
);
my %GENERAL_REQUIRES = (
  'Modern::Perl' => '0',
  'Readonly'     => '0',
  'Scalar::Util' => '0',
);

if ( $] >= 5.020 ) {
  $TEST_REQUIRES{'Test2::Tools::PerlCritic'} = '0';
} else {
  %GENERAL_REQUIRES = (%GENERAL_REQUIRES, %TEST_REQUIRES);
}

WriteMakefile(
  NAME          => 'Data::JavaScript',
  AUTHOR        => 'Michael Stemle, Jr. <mstemle@cpan.org>',
  VERSION_FROM  => 'lib/Data/JavaScript.pm',
  ABSTRACT_FROM => 'lib/Data/JavaScript.pm',
  LICENSE       => 'perl_5',
  PREREQ_PM     => \%GENERAL_REQUIRES,
  TEST_REQUIRES => \%TEST_REQUIRES,
  META_MERGE    => {
    'meta-spec'      => { version => 2 },
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
