use v6;
unit module Nmap::MAC::Prefixes;

constant %NMAP-MAC-PREFIXES =
    %?RESOURCES<nmap-mac-prefixes>
    .IO.lines
    .grep(none /^'#'/)
    .map({
        my Str:D @w = .split(/\s+/);
        my Str:D $key = @w.first;
        my Str:D $value = @w[1..*].join(' ');
        $key => $value
    })
    .classify({
        .values.first
    })
    .map({
        .kv.map(-> $k, $v {
            my @v = $v.map({ .keys }).flat;
            $k => @v
        })
        .flat
    })
    .flat
    .sort
    .hash;

# vim: set filetype=perl6 foldmethod=marker foldlevel=0 nowrap:
