use Sangoku 'test';
use Sangoku::Util qw/daytime/;

use Sangoku::API::AdminLog;
my $TEST_CLASS = 'Sangoku::API::AdminLog';

subtest 'check' => sub {
  ok $TEST_CLASS->MAX();
  ok $TEST_CLASS->file_path();
};

subtest 'new' => sub {
  my $log = $TEST_CLASS->new('テストログ');
  isa_ok $log, $TEST_CLASS;
  like $log, qr/テストログ/;
  like $log, qr/@{[ daytime() ]}/;
};

done_testing();
