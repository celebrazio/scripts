#!/usr/bin/perl

use strict; 
use warnings; 

use Benchmark; 

my @strings = map { chomp; $_ } <DATA>; 
   @strings = ( @strings ) x 100 ; 

my $if_elsif = sub { 
  my ($doctypeEnc) = @_ ; 
  if ($doctypeEnc eq 'utf8') {
    $doctypeEnc = 'UTF-8';
  } elsif ($doctypeEnc eq 'iso-8859-1') {
    # iso-8859-1 do nothing 
  } elsif ($doctypeEnc eq 'big5-eten') {
    # and Chinese (Taiwan) Big5
    $doctypeEnc = 'Big5';
  } elsif ($doctypeEnc eq 'cp936') {
    # and Chinese Simplified GBK
    $doctypeEnc = 'GBK';
  } elsif ($doctypeEnc eq 'shiftjis') {
    # and shiftjis...
    $doctypeEnc = 'Shift_JIS';
  } elsif ($doctypeEnc eq 'euc-cn') {
    # and PRC Chinese EUC = GB2312
    $doctypeEnc = 'GB2312';
  } 
  # $doctypeEnc ; 
} ; 


my $tab_ternary = sub { 
  my ($doctypeEnc) = @_ ; 
  $doctypeEnc = $doctypeEnc eq 'utf8'                  ? "UTF-8"
              : $doctypeEnc eq 'iso-8859-1'            ? $doctypeEnc
              : $doctypeEnc eq 'euc-kr'                ? $doctypeEnc
              : $doctypeEnc eq 'big5-eten'             ? "Big5"
              : $doctypeEnc eq 'cp936'                 ? "GBK" 
              : $doctypeEnc eq 'shiftjis'              ? "Shift_JIS"
              : $doctypeEnc eq 'euc-cn'                ? "GB2312" 
              :                                          $doctypeEnc ; 
} ; 

my $less_ternary = sub { 
  my ($doctypeEnc) = @_ ; 
  $doctypeEnc = $doctypeEnc eq 'utf8'                  ? "UTF-8"
              : $doctypeEnc eq 'big5-eten'             ? "Big5"
              : $doctypeEnc eq 'cp936'                 ? "GBK" 
              : $doctypeEnc eq 'shiftjis'              ? "Shift_JIS"
              : $doctypeEnc eq 'euc-cn'                ? "GB2312" 
              :                                          $doctypeEnc ; 
} ; 

my $t1_elsif = sub { 
  my ($doctypeEnc) = @_ ; 
  if ($doctypeEnc eq 'utf8') {
    $doctypeEnc = 'UTF-8';
  } elsif ($doctypeEnc eq 'iso-8859-1') {
    # iso-8859-1 do nothing 
    $doctypeEnc = $doctypeEnc ; 
  } elsif ($doctypeEnc eq 'euc-kr') {
    # iso-8859-1 do nothing 
    $doctypeEnc = $doctypeEnc ; 
  } elsif ($doctypeEnc eq 'big5-eten') {
    # and Chinese (Taiwan) Big5
    $doctypeEnc = 'Big5';
  } elsif ($doctypeEnc eq 'cp936') {
    # and Chinese Simplified GBK
    $doctypeEnc = 'GBK';
  } elsif ($doctypeEnc eq 'shiftjis') {
    # and shiftjis...
    $doctypeEnc = 'Shift_JIS';
  } elsif ($doctypeEnc eq 'euc-cn') {
    # and PRC Chinese EUC = GB2312
    $doctypeEnc = 'GB2312';
  } 
} ; 

my $t2_elsif = sub { 
  my ($doctypeEnc) = @_ ; 
  if ($doctypeEnc eq 'utf8') {
    $doctypeEnc = 'UTF-8';
  } elsif ($doctypeEnc eq 'iso-8859-1') {
    # iso-8859-1 do nothing 
    $doctypeEnc = 'iso-8859-1' ; 
  } elsif ($doctypeEnc eq 'euc-kr') {
    # iso-8859-1 do nothing 
    $doctypeEnc = 'euc-kr' ; 
  } elsif ($doctypeEnc eq 'big5-eten') {
    # and Chinese (Taiwan) Big5
    $doctypeEnc = 'Big5';
  } elsif ($doctypeEnc eq 'cp936') {
    # and Chinese Simplified GBK
    $doctypeEnc = 'GBK';
  } elsif ($doctypeEnc eq 'shiftjis') {
    # and shiftjis...
    $doctypeEnc = 'Shift_JIS';
  } elsif ($doctypeEnc eq 'euc-cn') {
    # and PRC Chinese EUC = GB2312
    $doctypeEnc = 'GB2312';
  } 
} ; 

my $orig_elsif = sub { 
  my ($doctypeEnc) = @_ ; 
  if ($doctypeEnc eq 'utf8') {
    $doctypeEnc = 'UTF-8';
  } elsif ($doctypeEnc eq 'shiftjis') {
    # and shiftjis...
    $doctypeEnc = 'Shift_JIS';
  } elsif ($doctypeEnc eq 'big5-eten') {
    # and Chinese (Taiwan) Big5
    $doctypeEnc = 'Big5';
  } elsif ($doctypeEnc eq 'cp936') {
    # and Chinese Simplified GBK
    $doctypeEnc = 'GBK';
  } elsif ($doctypeEnc eq 'euc-cn') {
    # and PRC Chinese EUC = GB2312
    $doctypeEnc = 'GB2312';
  } 
  # $doctypeEnc ; 
} ; 


timethese( 1000, {
  #t2_elsif    => sub {     $t2_elsif->( $_ ) for (@strings)    }, 
  #tab_ternary => sub {  $tab_ternary->( $_ ) for (@strings)    },
  #orig_elsif  => sub {   $orig_elsif->( $_ ) for (@strings)    }, 
  t1_elsif    => sub {     $t1_elsif->( $_ ) for (@strings)    }, 
  #t2_elsif    => sub {     $t2_elsif->( $_ ) for (@strings)    }, 
  #less_ternary=> sub { $less_ternary->( $_ ) for (@strings)    },
  #tab_ternary => sub {  $tab_ternary->( $_ ) for (@strings)    },

} ); 


__DATA__
utf8
iso-8859-1
utf8
utf8
utf8
utf8
utf8
utf8
iso-8859-1
iso-8859-1
utf8
big5-eten
iso-8859-1
euc-kr
euc-kr
euc-kr
utf8
utf8
utf8
utf8
utf8
utf8
utf8
utf8
utf8
utf8
utf8
utf8
utf8
utf8
utf8
iso-8859-1
iso-8859-1
euc-kr
