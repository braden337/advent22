my $data = 'input/day_6.txt'.IO.slurp.trim;

sub find_marker(@letters, $marker_size) {
    my $n = 0;
    my @four = [];

    for @letters -> $letter {
        if @four.elems < $marker_size {
            @four.push($letter);
        } else {
            if (@four.unique.elems == @four) {
                return $n + $marker_size;
            } else {
                @four.shift;
                @four.push($letter);
                $n += 1;
            }
        }
    }
}

say find_marker($data.split('', :skip-empty), 4);
say find_marker($data.split('', :skip-empty), 14);
