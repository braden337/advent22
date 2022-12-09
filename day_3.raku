sub priority ($item) {
    return 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'.index($item) + 1;
}

my $part_one_sum = 0;
my $part_two_sum = 0;
my $elf1 = '';
my $elf2 = '';
my $elf3 = '';
my $n = 1;

for 'input/day_3.txt'.IO.lines -> $line {
    my @items = $line.split('', :skip-empty);
    my $half = @items / 2;
    my @first = @items[0..^$half];
    my @second = @items[$half..*];

    $part_one_sum += priority((@first (&) @second).keys.first);

    if ($n %% 3) {
        $elf3 = $line;
        $part_two_sum += priority(($elf1.comb (&) $elf2.comb (&) $elf3.comb).keys.first);
    } elsif ($n %% 2) {
        $elf2 = $line;
    } else {
        $elf1 = $line;
    }

    $n += 1;
}

$part_one_sum.say;
$part_two_sum.say;
