# A perl while-loop pomodoro, it counts down 1500 seconds (25 minutes)
# then sends a notification to take a break and a reminder after 600 seconds
# (10 minutes) of rest.

#use strict;

my $pomoTime = 1500;
my $restTime = 600;
$| = 1;

while ($pomoTime > 0) {
    my $output =  qq{($pomoTime)\n};
    print $output;
    $pomoTime--;
    sleep(1);
}
system('notify-send "Pomodoro Ended" "Beginning Break Time" -u low');
if ($pomoTime = 1) {
    while ($restTime > 0) {
	my $output = qq{($restTime)\n};
	print $output;
	$restTime--;
	sleep(1);
    }
}
system('notify-send "Break Ended"');
print "\n";
