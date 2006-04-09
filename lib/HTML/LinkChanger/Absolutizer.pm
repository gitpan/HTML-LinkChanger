package HTML::LinkChanger::Absolutizer;

use strict;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK);

require Exporter;

@ISA = qw(Exporter AutoLoader HTML::LinkChanger);
# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.
@EXPORT = qw(
	
);
$VERSION = sprintf("%d.%d", q$Revision: 1.2 $ =~ /(\d+)\.(\d+)/);

# Preloaded methods go here.

# Autoload methods go after =cut, and are processed by the autosplit program.

require URI;
require HTML::LinkChanger;

sub new
{
	my($class, $base) = @_;

	die "Must specify base URL" unless $base;

	my $self = $class->SUPER::new();

	$self->{_absolutizer_base} = URI->new($base);

	$self;
}

sub change_url
{
	my $self = shift;
	my $url = shift;

	my $base = $self->{_absolutizer_base};

	return URI->new($url, $base)->abs($base);
}

1;
__END__

=head1 NAME

HTML::LinkChanger::Absolutizer - subclass of HTML::LinkChanger that converts
all relative URLs to absolute ones.

=head1 SYNOPSIS

use HTML::LinkChanger::Absolutizer;

my $absolutize = new HTML::LinkChanger::Absolutizer('http://www.mysite.com/some/path.html');
my $converted_HTML = $absolutize->filter($original_HTML);

=head1 DESCRIPTION

HTML::LinkChanger::Absolutizer is an implementation of HTML::LinkChanger
that converts all relative URLs to absolute. It might be very useful when
processing RSS feeds for example since RSS standard is not very strict about
relative URL handling and might misinterpret them.

=head1 AUTHOR

Sergey Chernyshev <sergeyche@cpan.org>

=head1 SEE ALSO

HTML::LinkChanger

=cut
