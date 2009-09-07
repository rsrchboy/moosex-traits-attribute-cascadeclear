use inc::Module::Install;

name     'MooseX-Traits-Attribute-CascadeClear';
all_from 'lib/MooseX/Traits/Attribute/CascadeClear.pm';
author   'Chris Weyl <cweyl@alumni.drew.edu>';

test_requires 'Test::More';
test_requires 'FindBin';

requires 'Moose'        => 0.64;
requires 'Moose::Role'  => 0.64;

extra_tests;

auto_install;

WriteAll;

