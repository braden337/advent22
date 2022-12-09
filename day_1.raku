my @elf_calories;
my $sum = 0;

for 'input/day_1.txt'.IO.lines -> $line {
    if ($line == '') {
        @elf_calories.push($sum);
        $sum = 0;
    } else {
        $sum += $line;
    }
}

@elf_calories.sort.tail.say;
@elf_calories.sort.tail(3).sum.say;
