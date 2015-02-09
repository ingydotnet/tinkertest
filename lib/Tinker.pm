use strict; use warnings;
package Tinker;
use Dancer ':syntax';

use YAML::XS;
use JSON::XS;

get '/tinker' => sub {
  my ($yaml, $json);
  $yaml = param('yaml');
  eval {
    my $data = YAML::XS::Load($yaml);
    $json = JSON::XS->new->
      pretty(1)->
      allow_nonref->
      canonical->
      convert_blessed->
      encode($data);
  };
  if ($@) {
    return "*** ERROR ***\n\n$@";
  }
  return $json;
};

get ['/js/*', '/css/*'] => sub {
  my $params = shift;
  my ($file) = @{ $params->{splat} };
  send_file $file;
};

get '/' => sub {
  send_file 'index.html'
};

true;
