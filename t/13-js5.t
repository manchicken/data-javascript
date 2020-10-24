#!/usr/bin/env perl

use Modern::Perl;

use Test2::V0;

#No Unicode, undef yields empty strings
use Data::JavaScript ( ':compat' => { JS => 5 } );

#Test undef default
is join( q//, jsdump( 'foo', [ 1, undef, 1 ] ) ),
  q/var foo = new Array;foo[0] = 1;foo[1] = undefined;foo[2] = 1;/,
  'Default undefined value';

#Test alphanumeric string output: quoting, ASCII/ANSI escaping, Unicode
## no critic (ProhibitEscapedCharacters, RequireInterpolationOfMetachars)
is join( q//, jsdump( 'ANSI', "M\xF6tley Cr\xFCe" ) ),
  q?var ANSI = "M\xF6tley Cr\xFCe";?,
  'Quoting, ASCII/ANSI escaping, unicode.';

is
  join( q//, jsdump( 'unicode', "Euros (\x{20ac}) aren't Ecus (\x{20a0})" ) ),
  q{var unicode = "Euros (\u20AC) aren't Ecus (\u20A0)";},
  'No real Unicode';

is join( q//, jsdump( 'thang', qq('\t"\n\\\xa0) ) ),
  q(var thang = "'\t\"\n\\\\\xA0";),
  q(var thang = "'\t\"\n\\\xA0");

done_testing;
