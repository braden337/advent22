my %filesystem;
my $folder = %filesystem;
my @path = [$folder];

for 'input/day_7.txt'.IO.lines -> $line {
    my ($first, $second, $third) = $line.words;

    my $is_cd = $first eq '$' && $second eq 'cd' && $third.Bool;
    my $is_ls = $first eq '$' && $second eq 'ls';
    my $is_dir = $first eq 'dir';
    my $is_file = !($is_cd || $is_ls || $is_dir);

    my $current = @path[*-1];

    if $is_cd {
        if $third (elem) $current.keys {
            @path.push($current{$third});
        } elsif $third eq '..' {
            @path.pop;
        } else {
            $current.push($third => {});
            @path.push($current{$third});
        }
    } elsif $is_dir {
        $current.push($second => {});
    } elsif $is_file {
        $current.push($second => $first);
    }
}

my @dir_sizes;

sub dir_size($directory) {
    my $sum = 0;

    for $directory.keys -> $key {
        my $current = $directory{$key};

        if $current ~~ Hash {
            my $size = dir_size($current);
            @dir_sizes.push($size);
            $sum += $size;
        } elsif +$current ~~ Int {
            $sum += +$current;
        }
    }

    return $sum;
}

my $used_space = dir_size(%filesystem);
say [+](@dir_sizes.values.grep(* <= 100000));

my $free = 70_000_000 - $used_space;

say @dir_sizes.grep(($free + *) >= 30_000_000).sort.head;
