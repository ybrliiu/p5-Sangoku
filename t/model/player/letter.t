use Sangoku 'test';
use Test::Sangoku::PostgreSQL;
use Test::Sangoku::Util qw/prepare_player_model_tests create_test_player TEST_PLAYER_DATA/;

use Sangoku::Model::Player;

my $PLAYER_ID = Sangoku::Model::Player->ADMINISTARTOR_DATA->{player}{id};
my $TEST_CLASS = 'Sangoku::Model::Player::Letter';
load $TEST_CLASS;
my $OBJ;
my $PSQL = Test::Sangoku::PostgreSQL->new();

prepare_player_model_tests({country => 1});
create_test_player({country => 1});

subtest 'new' => sub {
  $OBJ = $TEST_CLASS->new(id => $PLAYER_ID);
  isa_ok $OBJ, $TEST_CLASS;
};

my $SENDER;

subtest 'add, add_sended' => sub {
  $SENDER = Sangoku::Model::Player->get($PLAYER_ID);
  my $receiver = Sangoku::Model::Player->get(TEST_PLAYER_DATA->{player}{id});

  ok $OBJ->add({
    sender   => $SENDER,
    receiver => $receiver,
    message  => '手紙テスト',
  });

  ok $OBJ->add({
    sender   => $SENDER,
    receiver => $receiver,
    message  => 'テスト2',
  });

  ok $OBJ->add_sended({
    letter_type         => $OBJ->letter_type,
    sender_name         => 'test_player',
    sender_icon         => 100,
    sender_town_name    => '金陵',
    sender_country_name => '無所属',
    receiver_name       => '管理人',
    message             => 'this is letter.',
    time                => '2016...',
  });
};

subtest 'get_all' => sub {
  ok(my $list = $OBJ->get_all);
  is @$list, 5;
};

subtest 'get' => sub {
  ok(my $list = $OBJ->get);
  is @$list, 3;

  {
    my $letter = $list->[1];
    is $letter->message, 'テスト2';
  }

  {
    my $letter = $list->[0];
    is $letter->sender_icon, 100;
  }

  my $transmission_history = $OBJ->transmission_history;
  my $letter = $transmission_history->[0];
  is $letter->letter_type, 'player';
};

done_testing();
