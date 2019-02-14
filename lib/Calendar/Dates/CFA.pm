package Calendar::Dates::CFA;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

use Role::Tiny::With;

with 'Calendar::DatesRoles::FromData';

1;
# ABSTRACT: CFA exam calendar

=head1 DESCRIPTION

This module provides CFA exam calendar using the L<Calendar::Dates> interface.


=head1 prepend:SEE ALSO

L<https://www.cfainstitute.org/programs/cfa>

L<https://en.wikipedia.org/wiki/Chartered_Financial_Analyst>

=cut

__DATA__
# dec2018exam
2019-01-23;Exam results announcement (Dec 2018, Levels I & II);dec2018exam

# jun2019exam
2018-10-15;First deadline to request disability accommodations;jun2019exam
2018-10-17;Early registration fee deadline;jun2019exam
2019-02-13;Standard registration fee deadline;jun2019exam
2019-02-18;Second deadline to request disability accommodations;jun2019exam
2019-03-13;Final (late) registration fee deadline;jun2019exam
2019-03-18;Final deadline to request disability accommodations;jun2019exam
# mid-may 2019, admission tickets available
2019-06-11;Deadline for submission of test center change requests;jun2019exam
2019-06-15;Exam day: Asia-Pacific (Levels II & III), Americas and EMEA (all levels);jun2019exam
2019-06-16;Exam day: Asia-Pacific (Level I only);jun2019exam
2019-06-16;Religious alternate exam date (Americas and EMEA, all levels);jun2019exam
2019-06-17;Religious alternate exam date (Asia Pacific, all levels);jun2019exam
# TODO: result announcement

# dec2019exam
2019-01-24;Exam registration open;dec2019exam
2019-03-27;Early registration fee deadline;dec2019exam
2019-08-14;Standard registration fee deadline;dec2019exam
2019-09-11;Final (late) registration fee deadline;dec2019exam
2019-12-07;Exam day;dec2019exam
