#!/usr/bin/env perl

use Test::More tests => 2;


eval { require MooseX::Traits::Attribute::CascadeClear };
ok $@ =~ /^This package is non-functional; please see MooseX::CascadeClearing/;

diag( "Testing MooseX::Traits::Attribute::CascadeClear $MooseX::Traits::Attribute::CascadeClear::VERSION, Perl $], $^X" );

eval { require MooseX::Traits::Attribute::CascadeClearMaster };
ok $@ =~ /^This package is non-functional; please see MooseX::CascadeClearing/;

diag( "Testing MooseX::Traits::Attribute::CascadeClearMaster $MooseX::Traits::Attribute::CascadeClearMaster::VERSION, Perl $], $^X" );

