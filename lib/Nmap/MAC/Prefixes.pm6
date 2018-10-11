use v6;
unit module Nmap::MAC::Prefixes;

constant %NMAP-MAC-PREFIXES =
    %?RESOURCES<nmap-mac-prefixes>
    .IO.lines
    .grep(none /^'#'/)
    .map({
        my Str:D @w = .split(/\s+/);
        my Str:D $vendor = @w[1..*].join(' ');
        my Str:D $oui = @w.first;
        $vendor => $oui
    })
    .classify({
        # classify by vendor
        .keys.first
    })
    .map({
        .kv
        .map(-> Str:D $vendor, @vendor-then-oui {
            # isolate oui
            my Str:D @oui = @vendor-then-oui.map({ .values.tail });
            $vendor => @oui;
        })
    })
    .flat
    .hash;

# vim: set filetype=perl6 foldmethod=marker foldlevel=0 nowrap:
