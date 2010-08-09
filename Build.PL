
use strict;
use warnings;

use Module::Build 0.3601;

my %module_build_args = (
                       'dist_abstract' => 'Mason wrapper for Dancer',
                       'dist_author' => [
                                          'Yanick Champoux'
                                        ],
                       'dist_name' => 'Dancer-Template-Mason',
                       'script_files' => [],
                       'module_name' => 'Dancer::Template::Mason',
                       'requires' => {
                                       'HTML::Mason' => '0',
                                       'Dancer' => '0'
                                     },
                       'license' => 'perl'
                     );


my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
