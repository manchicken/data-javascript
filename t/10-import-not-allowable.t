#!/usr/bin/env perl

use Modern::Perl;

use Test2::V0;

use Data::JavaScript 'jsdump';

ok defined(&{"jsdump"}), 'Make sure the function is imported.';

done_testing;
