package My_module;

#**********************************************************

=head2 test_function($attr) - Test function
 
  Arguments:
    $attr   - Extra attributes
       $stm   - Query with data from database
 
  Returns:
   $stm
 
  Example:
 
  
=cut

#**********************************************************

use strict;
use warnings FATAL => 'all';

use parent qw( dbcore );

our ($db, $admin, %conf, %lang, $html, %permissions, @WEEKDAYS, @MONTHES, %FORM);

#**********************************************************
# Init
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

sub take {
  my $self = shift;
  my ($attr) = @_;

  # Take the query from the db

  my $stm = $self->query("SELECT user_id, user_name, user_address, user_email FROM user_inform;", undef, { COLS_NAME => 1 });
  return $self->{list};
}

1;

