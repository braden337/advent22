my $part_one_sum = 0;
my $part_two_sum = 0;

for 'input/day_4.txt'.IO.lines -> $line {
    my ($a, $b, $c, $d) = $line.split(/<[\-\,]>/, :skip-empty);

    my @first = (+$a...+$b);
    my @second = (+$c...+$d);

    if (@first (<=) @second or @first (>=) @second) {
        $part_one_sum += 1;
    }

    if (@first (&) @second > 0) {
        $part_two_sum += 1;
    }
}

$part_one_sum.say;
$part_two_sum.say;
