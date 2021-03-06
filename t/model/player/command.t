use Sangoku 'test';
use Test::Record;

my $TR = Test::Record->new();
my $TEST_CLASS = 'Sangoku::Model::Player::Command';
load $TEST_CLASS;
my $OBJ;
my $PLAYER_ID = 'test_player';

subtest 'new' => sub {
  $OBJ = $TEST_CLASS->new(id => $PLAYER_ID);
  isa_ok($OBJ, $TEST_CLASS);
};

subtest 'init' => sub {
  ok $OBJ->init($PLAYER_ID);

  my $list = $OBJ->get_all();
  my $none = $OBJ->NONE_DATA;
  is($list->[0]->id, $none->{id});

  my $max = $TEST_CLASS->CLASS->MAX();
  is($list->[$max - 1]->id, $none->{id});

};

subtest 'input' => sub {
  ok $OBJ->input(undef, [0 .. 10]);
};

subtest 'remove' => sub {
  ok $OBJ->remove();
};

subtest 'remove_all' => sub {
  my @record;
  for (0 .. 9) {
    $record[$_] = $TEST_CLASS->new(id => "test_$_");
    $record[$_]->init();
  }
  ok $record[0]->remove();
  lives_ok { $TEST_CLASS->remove_all() };
  dies_ok { $record[5]->remove() };
};

done_testing();
