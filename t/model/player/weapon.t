use Sangoku 'test';
use Test::Sangoku::PostgreSQL;
use Test::Sangoku::Util qw/prepare_player_model_tests/;

use Sangoku::Model::Player;
use Sangoku::Model::Player::Weapon;

my $PLAYER_ID = Sangoku::Model::Player->ADMINISTARTOR_DATA->{player}{id};
my $TEST_CLASS = 'Sangoku::Model::Player::Weapon';
my $PSQL = Test::Sangoku::PostgreSQL->new();

prepare_player_model_tests();

subtest 'create' => sub {
  ok $TEST_CLASS->create({player_id => $PLAYER_ID, power => 0});
};

subtest 'get' => sub {
  ok(my $weapon = $TEST_CLASS->get($PLAYER_ID));
  is $weapon->name, '木刀';
};

done_testing();
