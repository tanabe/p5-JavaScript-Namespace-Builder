package JavaScript::Namespace::Compiler;
use strict;
use warnings;
use IO::File;

our $script_root;

sub compile {
  my ($self, $params) = @_;
  $script_root = $params->{script_root};
  $script_root =~ s/\/*$//g;
  my $files = $self->_create_file_list($params->{namespaces});

  my $script;
  for my $path (@$files) {
    my @lines = $self->_read($path);
    $script .= join '', @lines;
  }
  return {
    files  => $files,
    script => $script,
  };
}

sub _create_file_list {
  my ($self, $namespaces, $files) = @_;
  $files = [] unless defined $files;
  for my $namespace (@{$namespaces}) {
    my $path = $self->_namespace_to_path($namespace);
    if (-e $path) {
      next if (grep {$_ eq $path} @{$files});
      push @{$files}, $path;
      my @lines = $self->_read($path);
      my $used_namespaces = $self->_parse(\@lines);
      $self->_create_file_list($used_namespaces, $files);
    } else {
      die("$path is not found");
    }
  }
  return $files;
}

sub _parse {
  my ($self, $lines) = @_;
  my $chunked = join '', map {chomp $_; $_} @{$lines};
  my @used_namespaces = $chunked =~ /(?:Namespace\([^)]+\))?(?:\.use\(\s*(?:'|")([.a-zA-Z0-9]+)\s+[a-zA-Z0-9*,]+\s*(?:'|")\))/g;
  return \@used_namespaces;
}

sub _namespace_to_path {
  my ($self, $namespace) = @_;
  $namespace =~ s/\./\//g;
  return $script_root . '/' . $namespace . '.js';
}

sub _read {
  my ($self, $path) = @_;
  my $file_handler = IO::File->new;
  $file_handler->open($path, 'r');
  my @lines = $file_handler->getlines();
  $file_handler->close();
  return @lines;
}

1;
__END__
