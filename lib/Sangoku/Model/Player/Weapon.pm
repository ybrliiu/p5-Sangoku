package Sangoku::Model::Player::Weapon {

  use Sangoku;
  use Mouse;
  with 'Sangoku::Model::Role::DB';

  use Sangoku::Util qw/validate_values/;

  use constant TABLE_NAME => 'player_weapon';

  sub create {
    my ($class, $args) = @_;
    validate_values($args => [qw/player_id power/]);
    $class->db->do_insert(TABLE_NAME, $args);
  }

  __PACKAGE__->generate_methods();

  __PACKAGE__->meta->make_immutable();
}

1;
