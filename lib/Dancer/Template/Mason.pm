package Dancer::Template::Mason;

use strict;
use warnings;

use HTML::Mason::Interp;
use FindBin;

use base 'Dancer::Template::Abstract';

our $VERSION = '0.01';

my $_engine;

my $root_dir = $FindBin::Bin . '/views';

sub init { 
    $_engine = HTML::Mason::Interp->new( comp_root => $root_dir );
}

sub render {
    my ($self, $template, $tokens) = @_;

    #$template =~ s/\.tt$/\.mason/;
    #$template =~ s#^.*/views/##;
    
    $template =~ s/\.tt$//;  # no nefarious .tt for mason!

    $template =~ s/^\Q$root_dir//;  # cut the leading path
    
    my $content;
    $_engine->out_method( \$content );
    $_engine->exec($template, %$tokens);
    return $content;
}

1;
__END__

=pod

=head1 NAME

Dancer::Template::Haml - Haml wrapper for Dancer

=head1 SYNOPSIS

 set template => 'haml';
 
 get '/bazinga', sub {
 	template 'bazinga' => {
 		title => 'Bazinga!',
 		content => 'Bazinga?',
 	};
 };

Then, on C<views/bazinga.haml>:

 !!!
 %html{ :xmlns => "http://www.w3.org/1999/xhtml", :lang => "en", "xml:lang" => "en"}
   %head
     %title= title
   %body
     #content
       %strong= content

And... bazinga!

=head1 DESCRIPTION

This class is an interface between Dancer's template engine abstraction layer
and the L<Text::Haml> module.

In order to use this engine, set the following setting as the following:

    template: haml

This can be done in your config.yml file or directly in your app code with the
B<set> keyword.

=head1 SEE ALSO

L<Dancer>, L<Text::Haml>

=head1 TODO

The usage of helpers, filters and attributes. This will be implemented once
Dancer has capabilities to take specific parameters for each templating engine
it supports.

=head1 AUTHOR

This module has been written by David Moreno, L<http://stereonaut.net/>. This module
was heavily based on Franck Cuny's L<Dancer::Template::MicroTemplate>.

=head1 LICENSE

This module is free software and is released under the same terms as Perl
itself.

=cut
