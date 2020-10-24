#!/usr/bin/env perl

use Modern::Perl;

use Test2::V0;

#No Unicode, undef yields empty strings
use Data::JavaScript ( ':all' => { UNDEF=>0, JS => 0 } );

#Test undef default
is join( q//, jsdump( 'foo', [ 1, undef, 1 ] ) ),
  q/var foo = new Array;foo[0] = 1;foo[1] = '';foo[2] = 1;/,
  'Default undefined value';

done_testing;
