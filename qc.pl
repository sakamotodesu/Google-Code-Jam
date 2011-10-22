#!/usr/bin/perl

# for Google Code Jam Japann 2011
# 予選問題C.ビット数
# http://code.google.com/codejam/contest/dashboard?c=889487#s=p2

use strict;

my $file = $ARGV[0];
my $fh;
my %bin;

open $fh, '<', $file or die;

my $testcase = <$fh>;
for( my $i = 1; $i <= $testcase; $i++ ){
	my $line = <$fh>;
	my $ret = max($line);
	print "Case #$i: $ret\n";
}

close($fh);

sub max{
	my $n = shift;
	chomp($n);
	my $max = 0;
	my $kuri =0;
	
	while ( $n != 0 ){
		if ( ( $n & 1 )  == 0 ){
			# 0
			if( $kuri == 1 ){
				$max+=1;
				$kuri = 1;
			} else {
				$max+=2;
				$kuri = 1;
			}
		} else {
			# 1
			if( $kuri == 1 ){
				if( $n >> 1 == 0){
					$kuri = 0;
				}else{
					$max+=2;
					$kuri = 1;
				}
			} else {
				$max+=1;
				$kuri=0;
			}
		}
		$n = $n >> 1;
	}
	return $max;
}
