unlink('/tmp/pomo.out') or die 'No Pomodoro temp file found';
my $file = '/tmp/pomo.out';

unless(open FILE, '>'.$file) {
    die "\nUnable to create $file\n";
}

print FILE "\n";
close FILE;
