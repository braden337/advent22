my %second_spaces = ('0,0' => 1);
my %tail_spaces = ('0,0' => 1);
my @x = 0 xx 10;
my @y = 0 xx 10;

sub distance($head, $tail) {
    $head - $tail;
}

sub adjacent($head) {
    my $tail = $head + 1;
    abs(distance(@x[$head], @x[$tail])) < 2 && abs(distance(@y[$head], @y[$tail])) < 2;
}

sub follow($head) {
    my $tail = $head + 1;
    my $x = distance(@x[$head], @x[$tail]);
    my $y = distance(@y[$head], @y[$tail]);

    @x[$tail] += $x.sign;
    @y[$tail] += $y.sign;

    my $coordinate = "{@x[$tail]},{@y[$tail]}";

    if $tail == 1 {
        %second_spaces{$coordinate} += 1;
    }
    
    if $tail == @x - 1 {
        %tail_spaces{$coordinate} += 1;
    }
}

sub move($head, $direction) {
    if ($direction eq 'U') {
        @y[$head] += 1;
    } elsif ($direction eq 'D') {
        @y[$head] -= 1;
    } elsif ($direction eq 'L') {
        @x[$head] -= 1;
    } elsif ($direction eq 'R') {
        @x[$head] += 1;
    }
}

for 'input/day_9.txt'.IO.lines -> $line {
    my ($direction, $magnitude) = $line.words;

    for 1..+$magnitude {
        my $n = 0;
        move($n, $direction);

        while $n < @x - 1 {
            follow($n) unless adjacent($n);
            $n += 1;
        }
    }
}

say %second_spaces.keys.elems;
say %tail_spaces.keys.elems;
