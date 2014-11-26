use strict;
use warnings;
package WWW::jsonip;
use WWW::REST::Simple qw/get/;
use utf8;

# ABSTRACT: get a JSON format ip info

use base 'Exporter';
our @EXPORT = qw/json_ip ip_detail/;

our $VERSION = '0.001';

sub json_ip {
    get('http://jsonip.cn');
}

sub ip_detail {
    get('http://jsonip.cn/i');
}

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

WWW::jsonip - Get a JSON format ip info through L<http://jsonip.cn>

=head1 VERSION

version 0.001

=head1 SYNOPSIS

    use WWW::jsonip qw/json_ip/;

    my $ip = json_ip(); # {"ip": "123.45.67.89", "detail":"http://jsonip.cn/i"}

=head1 EXPORTS

Exports the C<json_ip> and C<ip_detail> functions.

=head1 FUNCTIONS

=head2 json_ip

Get a JSON format ip info:

    use WWW::jsonip qw/json_ip/;
    use JSON;
    use Data::Dumper;

    my $ip_info = json_ip();
    $ip_info = form_json($ip_info);
    print Dumper $ip_info

    # {"ip": "123.45.67.89", "detail":"http://jsonip.cn/i"};

=head2 ip_detail

Get a JSON format ip info in a little detail, including OS/Browser/Geo etc.

    use WWW::jsonip qw/ip_detail/;
    use JSON;
    use Data::Dumper;

    my $ip_detail = ip_detail();
    $ip_detail = form_json($ip_detail);
    print Dumper $ip_detail;

    # {
    #   ip: "123.45.67.89",
    #   browser: "Chrome",
    #   os: "Macintosh",
    #   country: "中国",
    #   city: "北京"
    # }


=head1 AUTHOR

Bin Joy <perlxruby@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Bin Joy.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
