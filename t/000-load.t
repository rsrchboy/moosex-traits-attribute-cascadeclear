#!/usr/bin/perl -T

use Test::More tests => 1;

BEGIN {
	use_ok( 'MooseX::Traits::Attribute::CascadeClear' );
}

diag( "Testing MooseX::Traits::Attribute::CascadeClear $MooseX::Traits::Attribute::CascadeClear::VERSION, Perl $], $^X" );
