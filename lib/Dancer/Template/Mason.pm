package Dancer::Template::Mason;
# ABSTRACT: Mason wrapper for Dancer

use strict;
use warnings;
use Dancer::Config 'setting';
use FindBin;
use HTML::Mason::Interp;

use base 'Dancer::Template::Abstract';

my $_engine;
my $root_dir;

sub init { 
    if(defined(setting('views'))) {
        $root_dir = setting('views');
    } else {
        $root_dir = $FindBin::Bin . '/views';
    }
    
    $_engine = HTML::Mason::Interp->new( comp_root => $root_dir );
}

sub default_tmpl_ext { "mason" };

sub render {
    my ($self, $template, $tokens) = @_;
    
    $template =~ s/^\Q$root_dir//;  # cut the leading path
    
    my $content;
    $_engine->out_method( \$content );
    $_engine->exec($template, %$tokens);
    return $content;
}

1;
__END__

=pod

=head1 SYNOPSIS

 set template => 'mason';
 
 get '/foo', sub {
 	template 'foo.mason' => {
        title => 'bar'
 	};
 };

Then, on C<views/foo.mason>:

    <%args>
    $title
    </%args>

    <h1><% $title %></h1>

    <p>Mason says hi!</p>


=head1 DESCRIPTION

This class is an interface between Dancer's template engine abstraction layer
and the L<HTML::Mason> templating system.

In order to use this engine, set the following setting as the following:

    template: mason

This can be done in your config.yml file or directly in your app code with the
B<set> keyword.

=head1 SEE ALSO

L<Dancer>, L<HTML::Mason>

=cut
