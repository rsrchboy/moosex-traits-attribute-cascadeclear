#############################################################################
#
# Attribute metaclass trait to cascade clearers
#
# Author:  Chris Weyl (cpan:RSRCHBOY), <cweyl@alumni.drew.edu>
# Company: No company, personal work
# Created: 12/24/2008 11:08:00 PM PST
#
# Copyright (c) 2008 Chris Weyl <cweyl@alumni.drew.edu> 
#
# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
#
#############################################################################

package MooseX::Traits::Attribute::CascadeClearMaster;

use Moose::Role;

our $VERSION = '0.02';

#use Smart::Comments '###', '####';

# I think this is kosher...
override process_accessors => sub {
    my ($self, $type, $accessor, $generate_as_inline_methods) = @_;

    # skip anything not a clearer
    return super if $type ne 'clearer';

    my $class = $self->associated_class;
    
    # I'm pretty sure the class/method_metaclass bit is correct...
    my $method = $class->method_metaclass->wrap(
        is_inline    => 0,     # right?
        package_name => $class->name,
        name         => $accessor, # $self->clearer,
        body         => sub { $self->_really_clear_value(shift) },
    );
    $self->associate_method($method);    

    return ($self->clearer, $method);
};
    
sub _really_clear_value {
    my ($self, $instance) = @_;

    # lifted from 
    #Class::MOP::Class
    #    ->initialize(ref($instance))
    #    ->get_meta_instance
    #    ->deinitialize_slot($instance, $self->name)
    #    ; 

    # clear our value 
    $self->clear_value($instance);

    # now, clear any other attribute that lists us as a master
    my $name = $self->name;
    my @atts = $instance->meta->get_all_attributes;

    for my $attribute (@atts) {

        ### working on: $attribute->name
        if ($attribute->does('CascadeClear') 
            && $attribute->has_clear_on
            && $attribute->clear_on eq $name) {

                if ($attribute->has_clearer) {

                    # this way cascading "just works"
                    my $att_clearer = $attribute->clearer;
                    $instance->$att_clearer();
                }
                else {

                    $attribute->clear_value($instance);
                }
        }
    }

}

no Moose::Role;

1;

__END__

=head1 NAME

MooseX::Traits::Attribute::CascadeClearMaster - Master clearer metatrait

=head1 SYNOPSIS

    # our "master" attribute
    has master => (

        # overrides our clearer method to check for dependent atts to clear
        traits     => [ 'CascadeClearMaster' ], 
        is         => 'rw',
        isa        => 'Str',
        lazy       => 1,
        default    => 'nuts',
    );

    has client1 => (

        # mark us for clearing on clear_master()
        traits   => [ 'CascadeClear' ], 
        clear_on => 'master', 

        is      => 'ro', 
        isa     => 'Str', 
        lazy    => 1,
        default => sub { shift->master . "1" }
    );

=head1 DESCRIPTION

CascadeClearer is an attribute metaclass trait that allows one to chain
attribute clearing actions.  For instance, if you have attributes that derive
their value from a "master" attribute, this would transparently allow you to
clear all the children attributes by clearing the master attribute.

=head1 USAGE

See L<MooseX::Traits::Attribute::CascadeClear>.

=head1 BUGS AND LIMITATIONS

There are no known bugs in this module.

Please report problems or requests to this package's RT tracker at 
<bug-MooseX-Traits-Attribute-CascadeClear@rt.cpan.org>.

Patches are welcome.

=head1 AUTHOR

Chris Weyl <cweyl@alumni.drew.edu>


=head1 LICENSE AND COPYRIGHT

Copyright (c) 2008 Chris Weyl <cweyl@alumni.drew.edu>

This library is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.

This library is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with this library; if not, write to the Free Software
Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

=cut





