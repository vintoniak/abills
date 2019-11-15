package Uprofiles;

use strict;
use warnings FATAL => 'all';

use parent qw( dbcore );

our ($db, $admin, %conf, %lang, $html, %permissions, @WEEKDAYS, @MONTHES, %FORM);

#**********************************************************
# Init
#**********************************************************

#**********************************************************

=head2 new - db connection
 
  Arguments:
    $attr   - Extra attributes

  
=cut

#**********************************************************
sub new {
  my $class = shift;
  my ($db, $admin, $CONF) = @_;

  my $self = {};
  $self->{admin} = $admin;
  $self->{conf}  = $CONF;
  bless($self, $class);

  $self->{db} = $db;

  return $self;
}

#**********************************************************

=head2 take_data - take all data from db
 
  Arguments:
    $attr 
    user_id
    user_name
    user_address
    user_email
    user_inform
 

  
=cut

#**********************************************************
sub take_data {
  my $self = shift;
  my ($attr) = @_;

  # Take the query from the db

  my $stm = $self->query("SELECT id, user_name, user_address, user_email FROM user_inform;", undef, { COLS_NAME => 1 });
  return $self->{list};
}

1;

