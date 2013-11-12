package Dist::Zilla::Plugin::test2t;
# VERSION

use Moose;
with('Dist::Zilla::Role::FileMunger');
use namespace::autoclean;

sub munge_file {
    my ( $self, $file ) = @_;

    return unless $file->name =~ qr{^test/};

    (my $name = $file->name) =~ s/^test/t/;
    $file->name( $name );
    $self->log_debug(
        [ 'Renaming file', $file->name ] );
}

__PACKAGE__->meta->make_immutable;
1;

