package Sangoku::Service::Admin::ResetGame {

  use Sangoku;
  use Mouse;
  with 'Sangoku::Service::Role::Base';

  sub reset_game {
    my ($class, $start_time) = @_;
    $class->delete_data_all();
    $class->init_data_all($start_time);
  }

  sub delete_data_all {
    my ($class) = @_;
    $class->model($_)->delete_all() for qw/Unit Player Town Country/;
    $class->model("Player::$_")->remove_all() for qw/Command CommandLog CommandList/;
    $class->model($_)->remove() for qw/MapLog HistoryLog AdminLog/;
  }

  sub init_data_all {
    my ($class, $start_time) = @_;
    $class->model($_)->init() for qw/Country Town Player Country::Position MapLog HistoryLog AdminLog/;
    $class->model('Site')->init($start_time);
  }

  __PACKAGE__->meta->make_immutable();
}

1;