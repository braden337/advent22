my %scores = 'A X' => 4, 'A Y' => 8, 'A Z' => 3, 'B X' => 1, 'B Y' => 5, 'B Z' => 9, 'C X' => 7, 'C Y' => 2, 'C Z' => 6;
my %win = <A Y B Z C X>;
my %lose = <A Z B X C Y>;
my %draw = <A X B Y C Z>;
my %strategies = X => %lose, Y => %draw, Z => %win;

my $part_one_score = 0;
my $part_two_score = 0;

for 'input/day_2.txt'.IO.lines -> $line {
    $part_one_score += %scores{$line};

    my ($them, $strategy) = $line.words;
    my $me = %strategies{$strategy}{$them};

    $part_two_score += %scores{"$them $me"};
}

$part_one_score.say;
$part_two_score.say;
