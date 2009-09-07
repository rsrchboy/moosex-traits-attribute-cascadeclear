use inc::Module::Install;

name     'MooseX-Traits-Attribute-CascadeClear';
all_from 'lib/MooseX/Traits/Attribute/CascadeClear.pm';
author   'Chris Weyl <cweyl@alumni.drew.edu>';

test_requires 'Test::More';
test_requires 'FindBin';

requires 'Moose';
requires 'Moose::Role';

extra_tests;

auto_install;

WriteAll;

