#!/usr/bin/perl -T

use Test::More tests => 1;

BEGIN {
	use_ok( 'MooseX::Traits::Attribute::CascadeClearMaster' );
}

diag( "Testing MooseX::Traits::Attribute::CascadeClearMaster $MooseX::Traits::Attribute::CascadeClearMaster::VERSION, Perl $], $^X" );
