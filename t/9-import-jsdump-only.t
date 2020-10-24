#!/usr/bin/env perl

use Modern::Perl;

use Test2::V0;

use Data::JavaScript 'chicken', ':horse';

ok defined( *{main::jsdump} ), 'Make sure the `jsdump` function is imported.';

done_testing;
