package SingleCascade;

use Moose;

has master => (
    #traits => [qw{Moose::Meta::Attribute::Custom::Trait::CascadeClear}], 
    traits => [qw{CascadeClearMaster}], 
    
    is => 'rw',
    isa => 'Str',
    clearer => 'clear_master',
    predicate => 'has_master',
    lazy => 1,
    default => 'nuts',
);

my @opts = (
    traits => [qw{CascadeClear}], 
    is => 'ro', isa => 'Str', clear_on => 'master', lazy_build => 1,
);

has sub1 => @opts; 
has sub2 => @opts;
has sub3 => @opts;

has nosub => (is => 'rw', isa => 'Str', lazy_build => 1);

sub _build_sub1 { shift->master . "1" }
sub _build_sub2 { shift->master . "2" }
sub _build_sub3 { shift->master . "3" }

sub _build_nosub { 'lazy!' }

1;

