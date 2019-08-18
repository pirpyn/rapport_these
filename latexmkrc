# Timezone for dates
$ENV{'TZ'}='Europe/France';

# Main file to compile
@default_files = ('these_payen_2019.tex');

# We want a pdf, dvi is so old school
$pdf_mode = "1";

# Computing with pdflatex
$pdflatex = "pdflatex -shell-escape -file-line-error -interaction=nonstopmode %O %S";

# Lets have builing directory
$out_dir = "build";

## If LaTeX is installed in a custom way, please modify accordingly 
## (  dot (.) is a concatenation operator )
#$ENV{'TEXINPUTS'}=$ENV{'HOME'} . '/.texlive/texmf-dist//:' . $ENV{'TEXINPUTS'}; 
## Same for the latex related binaries
#$ENV{'PATH'}=$ENV{'HOME'} . '/.texlive/bin/x86_64-linux//:' . $ENV{'PATH'}; 

# Adding all the glossaries
# for any entry in your tex file like
# 	\newglossary{label}{gls}{glo}{name}
# you should add a line like
# 	add_cus_dep( 'glo', 'gls', 0, 'makeglossaries' );

add_cus_dep( 'acrlo', 'acrls', 0, 'makeglossaries' );
add_cus_dep( 'phylo', 'phyls', 0, 'makeglossaries' );
add_cus_dep( 'opelo', 'opels', 0, 'makeglossaries' );
add_cus_dep( 'matlo', 'matls', 0, 'makeglossaries' );

# This function helps to make glossaries right.
sub makeglossaries {
  my ($base_name, $path) = fileparse( $_[0] );
  pushd $path;
  my $return = system "makeglossaries $base_name";
  popd;
  return $return;
}
