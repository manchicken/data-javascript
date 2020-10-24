#!/usr/bin/env perl

use Modern::Perl;

use Test2::V0;

use Data::JavaScript qw/jsdump/;

my $str = jsdump 'foo', ();

is $str, qq{var foo;\n}, 'Verify empty variable output with empty input.';

{
  is jsdump( 'foo', [qw/føº «bar» 💀/] ),
    qq{var foo = new Array;\nfoo[0] = "f\\u00F8\\u00BA";\nfoo[1] =}
    . qq{ "\\u00ABbar\\u00BB";\nfoo[2] = "\\xF0\\x9F\\x92\\x80";\n},
    'Verify unicode support with the encoder.';
};
{
  local $] = 5.006;
  is jsdump( 'foo', [qw/føº «bar» 💀/] ),
qq{var foo = new Array;\nfoo[0] = "f\\xF8\\xBA";\nfoo[1] = "\\xABbar\\xBB";\nfoo[2] = "\\x1F480";\n},
    'Verify unicode support without the encoder.';
};

# Circular refs
{
  my $foo = { a => 1 };
  $foo->{foo} = $foo;
  is jsdump( 'foo', $foo ),
    qq{var foo = new Object;\nfoo["a"] = 1;\nfoo["foo"] = foo;\n},
    q{Verify that circular references work properly.};
}

# Plain arrayref
{
  my $foo = [ 1, 2 ];
  is jsdump( 'foo', $foo ),
    qq{var foo = new Array;\nfoo[0] = 1;\nfoo[1] = 2;\n},
    q{Support blessed arrays, too!};
};

# Blessed hashref
{
  my $foo = { a => 1 };
  my $blessed_foo = bless $foo, 'BlessedBeThyFoo';
  is jsdump( 'foo', $blessed_foo ), qq{var foo = new Object;\nfoo["a"] = 1;\n},
    q{Support blessed arrays, too!};
};

# Blessed arrayref
{
  my $foo = [ 1, 2 ];
  my $blessed_foo = bless $foo, 'BlessedBeThyFoo';
  is jsdump( 'foo', $blessed_foo ),
    qq{var foo = new Array;\nfoo[0] = 1;\nfoo[1] = 2;\n},
    q{Support blessed arrays, too!};
};

# Blessed string ref isn't really all that supported.
{
  my $blessings   = "blessings";
  my $foo         = \$blessings;
  my $blessed_foo = bless $foo, 'BlessedBeThyFoo';
  is jsdump( 'foo', $blessed_foo ),
    qq{var //Unknown reference: foo=BlessedBeThyFoo\n},
    q{Support blessed arrays, too!};
};

done_testing;
