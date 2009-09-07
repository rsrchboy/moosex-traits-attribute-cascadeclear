#############################################################################
#
# Attribute metaclass trait to cascade clearers.
#
# Author:  Chris Weyl (cpan:RSRCHBOY), <cweyl@alumni.drew.edu>
# Company: No company, personal work
# Created: 12/24/2008 11:08:00 PM PST
#
# Copyright (c) 2008 Chris Weyl (cweyl@alumni.drew.edu) 
#
# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
#
#############################################################################

package MooseX::Traits::Attribute::CascadeClear;

use Moose::Role;

our $VERSION = 0.03;

has clear_on => (
    is        => 'rw',
    isa       => 'Str',
    predicate => 'has_clear_on',
    clearer   => 'clear_clear_on',
);

no Moose::Role;

1;

__END__

=head1 NAME

MooseX::Traits::Attribute::CascadeClear - Attribute trait to cascade clearer actions

=head1 SYNOPSIS

    # our "master" attribute
    has master => (
        # overrides our clearer method 
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
        is       => 'ro', 
        isa      => 'Str', 
        lazy     => 1,
        default  => sub { shift->master . "1" }
    );

=head1 DESCRIPTION

CascadeClearer is an attribute metaclass trait that allows one to chain
attribute clearing actions.  For instance, if you have attributes that derive
their value from a "master" attribute, this would transparently allow you to
clear all the children attributes by clearing the master attribute.

=head1 USAGE

This trait provides an additional option to attributes, I<clear_on>.  It
should be used in conjunction with I<CascadeClearMaster> (aka
L<Moose::Meta::Attribute::Custom::Traits::CascadeClearMaster>).  As attributes
are defined, this trait should be specified and the clear_on attribute
declared.  Declaring a non-existant attribute in I<clear_on> causes neither an
error nor a warning.

To use, simply declare B<CascadeClear> as one of your attributes traits, then
designate its master attribute through I<clear_on>.  The client attribute does
not need to have a clearer defined, but if it does, it will be used.

=head1 SEE ALSO

L<MooseX::Traits::Attribute::CascadeClearMaster>

This package is part of the Fedora Project's Perl SIG work.  For more
information, see:

    http://fedoraproject.org
    http://fedoraproject.org/wiki/Perl
    http://camelus.fedorahosted.org

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



