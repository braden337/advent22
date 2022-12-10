my $MAX_LENGTH = 10;

my @x = 0 xx $MAX_LENGTH;
my @y = 0 xx $MAX_LENGTH;
my @tails = <0,0>.SetHash xx $MAX_LENGTH - 1;

sub distance($points, $head) {
    $points[$head] - $points[$head + 1];
}

sub adjacent($head) {
    distance($@x, $head).abs < 2 && distance($@y, $head).abs < 2;
}

sub move($head, $direction) {
    ('LR' ~~ /$direction/ ?? $@x !! $@y)[$head] += 'UR' ~~ /$direction/ ?? 1 !! -1;
}

sub follow($head) {
    my $x = distance($@x, $head);
    my $y = distance($@y, $head);
    my $tail = $head + 1;

    @x[$tail] += $x.sign;
    @y[$tail] += $y.sign;

    my $coordinate = join ',', @x[$tail], @y[$tail];

    @tails[$head].set($coordinate) unless @tails[$head]<$coordinate>;
}

for 'input/day_9.txt'.IO.lines -> $line {
    my ($direction, $magnitude) = $line.words;

    for $direction xx $magnitude {
        my $n = 0;
        move($n, $direction);

        while $n < @x - 1 {
            follow($n) unless adjacent($n);
            $n += 1;
        }
    }
}

say @tails.head.keys.elems;
say @tails.tail.keys.elems;
