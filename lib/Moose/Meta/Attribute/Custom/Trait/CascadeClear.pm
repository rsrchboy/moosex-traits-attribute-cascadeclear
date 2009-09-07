#############################################################################
#
# CascadeClear trait resolution 
#
# Author:  Chris Weyl (cpan:RSRCHBOY), <cweyl@alumni.drew.edu>
# Company: No company, personal work
# Created: 12/26/2008 10:25:30 AM PST
#
# Copyright (c) 2008 Chris Weyl <cweyl@alumni.drew.edu>
#
# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
#
#############################################################################

package Moose::Meta::Attribute::Custom::Trait::CascadeClear; 

use strict;
use warnings;

our $VERSION = '0.02';

sub register_implementation { 'MooseX::Traits::Attribute::CascadeClear' }

1;

__END__

=head1 NAME

Moose::Meta::Attribute::Custom::Trait::CascadeClear - stub module for Moose

=head1 SYNOPSIS

This module serves to assist L<Moose> with trait resolution for the
CascadeClear attribute trait.

=head1 DESCRIPTION

See L<MooseX::Traits::Attribute::CascadeClear>.

=head1 SUBROUTINES/METHODS

=head2 register_implementation()

Simply returns 'MooseX::Traits::Attribute::CascadeClear'.

=head1 SEE ALSO

L<MooseX::Traits::Attribute::CascadeClear>

=head1 AUTHOR

Chris Weyl  <cweyl@alumni.drew.edu>


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
License along with this library; if not, write to the 

    Free Software Foundation, Inc.
    59 Temple Place, Suite 330
    Boston, MA  
    02111-1307  USA

=cut



