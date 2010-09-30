
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  'build_requires' => {
    'Dancer::FileUtils' => '0',
    'Module::Build' => '0.3601',
    'Test::More' => '0'
  },
  'configure_requires' => {
    'Module::Build' => '0.3601'
  },
  'dist_abstract' => 'Mason wrapper for Dancer',
  'dist_author' => [
    'Yanick Champoux'
  ],
  'dist_name' => 'Dancer-Template-Mason',
  'dist_version' => '0.002000',
  'license' => 'perl',
  'module_name' => 'Dancer::Template::Mason',
  'recommends' => {},
  'recursive_test_files' => 1,
  'requires' => {
    'Dancer' => '0',
    'Dancer::Config' => '0',
    'Dancer::Template::Abstract' => '0',
    'FindBin' => '0',
    'HTML::Mason' => '0',
    'HTML::Mason::Interp' => '0'
  },
  'script_files' => []
);


my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
