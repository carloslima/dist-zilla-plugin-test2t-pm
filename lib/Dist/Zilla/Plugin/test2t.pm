package Dist::Zilla::Plugin::test2t;

# ABSTRACT: write like ingy, release like regular perl
# VERSION

use Moose;
with('Dist::Zilla::Role::FileMunger');
use namespace::autoclean;

sub munge_file {
    my ( $self, $file ) = @_;

    return unless $file->name =~ qr{^test/};

    $file->name =~ s/^test/t/;
    $self->log_debug(
        [ 'Renaming file', $file->name ] );
}

__PACKAGE__->meta->make_immutable;
1;

