package Object::Iterate::Tester;

sub new { bless [qw(a b c d e f)], shift }
sub __more__ { scalar @{ $_[0] } }
sub __next__ { shift  @{ $_[0] } }

1;
