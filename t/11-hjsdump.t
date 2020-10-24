#!/usr/bin/env perl

use Modern::Perl;

use Test2::V0;

use Data::JavaScript qw/hjsdump/;

my $dummy_data = { a => 'b' };

my $str = hjsdump 'foo', $dummy_data;
my @arr = hjsdump 'foo', $dummy_data;

is $str,
qq{<script type="text/javascript" language="JavaScript1.3" />\n<!--\nvar foo = new Object;\nfoo["a"] = "b";\n// -->\n</script>\n},
  'Verify matching string.';
is \@arr,
  [
  q{<script type="text/javascript" language="JavaScript1.3" />},
  q{<!--},
  q{var foo = new Object;},
  q{foo["a"] = "b";},
  q{// -->}, q{</script>}
  ],
  'Verify matching array.';

done_testing;
