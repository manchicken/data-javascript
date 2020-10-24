#!/usr/bin/env perl

use Modern::Perl;

use Test2::V0;

use Data::JavaScript ( ':all' => [ 1, 2, 3 ] );

is
  join( q//, jsdump( 'qux', { color => 'monkey', age => 2, eyes => 'blue' } ) ),
  'var qux = new Object;qux["age"] = 2;'
  . 'qux["color"] = "monkey";qux["eyes"] = "blue";',
  'Simple hashref';

done_testing;
