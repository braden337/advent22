my @grid;

for 'input/day_8.txt'.IO.lines -> $line {
    @grid.push($line.split('', :skip-empty));
}

my $lo = 0;
my $hi = @grid.first.elems - 1;

my $visible = 0;
my $scenic = 0;

loop (my $row = 0; $row <= $hi; $row++) {
    loop (my $col = 0; $col <= $hi; $col++) {
        if $row (elem) ($lo, $hi) || $col (elem) ($lo, $hi) {
            $visible += 1;
        } else {
            my $height = +@grid[$row][$col];

            my $up_visible = True;
            my $down_visible = True;
            my $left_visible = True;
            my $right_visible = True;

            my $up_score = 1;
            my $down_score = 1;
            my $left_score = 1;
            my $right_score = 1;

            my $trees = 0;
            my $n = 0;

            my $current;

            loop ($n = $row - 1; $n >= $lo; $n--) {
                $current = +@grid[$n][$col];
                $trees += 1 if $up_visible;
                $up_visible = False if $current >= $height;
            }

            $up_score = $trees;

            loop ($n = $row + 1, $trees = 0; $n <= $hi; $n++) {
                $current = +@grid[$n][$col];
                $trees += 1 if $down_visible;
                $down_visible = False if $current >= $height;
            }

            $down_score = $trees;

            loop ($n = $col - 1, $trees = 0; $n >= $lo; $n--) {
                $current = +@grid[$row][$n];
                $trees += 1 if $left_visible;
                $left_visible = False if $current >= $height;
            }

            $left_score = $trees;

            loop ($n = $col + 1, $trees = 0; $n <= $hi; $n++) {
                $current = +@grid[$row][$n];
                $trees += 1 if $right_visible;
                $right_visible = False if $current >= $height;
            }

            $right_score = $trees;

            my $score = $up_score * $down_score * $left_score * $right_score;
            $scenic = $score if $score > $scenic;

            $visible += 1 if $up_visible || $down_visible || $left_visible || $right_visible;
        }
    }
}

say $visible;
say $scenic;
