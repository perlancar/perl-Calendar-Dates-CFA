package Calendar::Dates::CFA;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

use Role::Tiny::With;

with 'Calendar::DatesRoles::DataPreparer::CalendarVar::FromData';
with 'Calendar::DatesRoles::DataUser::CalendarVar';

sub filter_entry {
    my ($self, $entry, $params) = @_;

    if (defined(my $mon = $params->{exam_month})) {
        $mon eq 'jun' || $mon eq 'dec' or die "Invalid exam_month, please specify either jun/dec";
        return 0 unless grep { /\A$mon/ } @{ $entry->{tags} // [] };
    }
    if (defined(my $lvl = $params->{exam_level})) {
        my $mentions_lvl1 = $entry->{summary} =~ /levels? I\b/i;
        my $mentions_lvl2 = $entry->{summary} =~ /levels? II & III\b/i;
        my $mentions_lvl3 = $entry->{summary} =~ /levels? II & III\b/i;
        my $is_dec = grep { /\Adec/ } @{ $entry->{tags} // [] };
        return 0 if $lvl == 1 && !$mentions_lvl1 && ($mentions_lvl2 || $mentions_lvl3);
        return 0 if $lvl == 2 && $is_dec || !$mentions_lvl2 && ($mentions_lvl1 || $mentions_lvl3);
        return 0 if $lvl == 3 && $is_dec || !$mentions_lvl3 && ($mentions_lvl1 || $mentions_lvl2);
    }
    1;
}

1;
# ABSTRACT: CFA exam calendar

=head1 DESCRIPTION

This module provides CFA exam calendar using the L<Calendar::Dates> interface.


=head1 PARAMETERS

=head2 exam_month

Can be used to select dates related to a certain exam month only. Value is
either C<jun> or C<dec>. Example:

 $entries = Calendar::Dates::CFA->get_entries({exam_month=>'jun'}, 2019);

=head2 exam_level

Can be used to select dates related to a certain exam level only. Value is
either 1, 2, 3.

 $entries = Calendar::Dates::CFA->get_entries({exam_level=>2}, 2019);


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
2019-12-03;Test center change request submission deadline;dec2019exam
2019-12-07;Exam day;dec2019exam
2019-12-08;Religious alternate exam date;dec2019exam

# jun2020exam
# 2019-08-xx;Exam registration open;jun2020exam
2020-06-06;Exam day: Asia-Pacific (Levels II & III), Americas and EMEA (all levels);jun2020exam
2020-06-07;Exam day: Asia-Pacific (Level I only);jun2020exam
