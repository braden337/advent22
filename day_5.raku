my %part_one_stacks = [
    1 => ['G', 'F', 'V', 'H', 'P', 'S'],
    2 => ['G', 'J', 'F', 'B', 'V', 'D', 'Z', 'M'],
    3 => ['G', 'M', 'L', 'J', 'N'],
    4 => ['N', 'G', 'Z', 'V', 'D', 'W', 'P'],
    5 => ['V', 'R', 'C', 'B'],
    6 => ['V', 'R', 'S', 'M', 'P', 'W', 'L', 'Z'],
    7 => ['T', 'H', 'P'],
    8 => ['Q', 'R', 'S', 'N', 'C', 'H', 'Z', 'V'],
    9 => ['F', 'L', 'G', 'P', 'V', 'Q', 'J'],
];

my %part_two_stacks = [
    1 => ['G', 'F', 'V', 'H', 'P', 'S'],
    2 => ['G', 'J', 'F', 'B', 'V', 'D', 'Z', 'M'],
    3 => ['G', 'M', 'L', 'J', 'N'],
    4 => ['N', 'G', 'Z', 'V', 'D', 'W', 'P'],
    5 => ['V', 'R', 'C', 'B'],
    6 => ['V', 'R', 'S', 'M', 'P', 'W', 'L', 'Z'],
    7 => ['T', 'H', 'P'],
    8 => ['Q', 'R', 'S', 'N', 'C', 'H', 'Z', 'V'],
    9 => ['F', 'L', 'G', 'P', 'V', 'Q', 'J'],
];

for 'input/day_5.txt'.IO.lines -> $line {
    my ($n, $from, $to) = $line.split(/move|from|to/, :skip-empty);
    %part_one_stacks{+$to}.push(%part_one_stacks{+$from}.pop) for 1...+$n;

    %part_two_stacks{+$to}.append(%part_two_stacks{+$from}.tail(+$n));
    %part_two_stacks{+$from}.pop for 1...+$n;
}

%part_one_stacks{$_}.pop.print for %part_one_stacks.keys.sort;
say '';

%part_two_stacks{$_}.pop.print for %part_two_stacks.keys.sort;
say '';
